// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vcyberiz/bloc/partners_bloc/partners_bloc.dart';
import 'package:vcyberiz/core/utils/config/config.dart';
import 'package:vcyberiz/core/utils/constants/constants.dart';
import 'package:vcyberiz/core/utils/global_widgets/image_widget.dart';
import 'package:vcyberiz/core/utils/styles/app_colors.dart';

class OurPartnersTabSection extends StatelessWidget {
  OurPartnersTabSection({super.key});
  final bodyKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PartnersBloc, PartnersState>(
      builder: (context, state) {
        if (state.secureFuture == null) {
          return SizedBox();
        }
        //!-----------image container
        return Stack(
          children: [
            FutureBuilder(
              future: Future.delayed(
                Duration.zero,
                () => bodyKey.currentContext?.size,
              ),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Container(
                    width: Constants.width,
                    color: AppColors.blue,
                    child: Center(
                      child: SizedBox(
                        height: snapshot.data?.height,
                        width: Constants.videoBreakPoint,
                        child: SizedBox(
                          child: ImageWidget(
                            imageUrl:
                                state.secureFuture?.secBackground?.url ?? "",
                            label:
                                state.secureFuture?.secBackground?.name ?? "",
                            fit: BoxFit.cover,
                            alignment: Alignment.topCenter,
                          ),
                        ),
                      ),
                    ),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
            Center(
              key: bodyKey,
              child: SizedBox(
                width: getValueForScreenType<double>(
                  context: context,
                  mobile: Constants.width * 0.92,
                  tablet: Constants.width * 0.92,
                  desktop: Constants.desktopBreakPoint,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Gap(
                      getValueForScreenType<double>(
                        context: context,
                        mobile: 32,
                        tablet: 32,
                        desktop: 96,
                      ),
                    ),
                    kStyle.med(
                      text: state.secureFuture?.secHeader ?? "",
                      size: getValueForScreenType(
                        context: context,
                        mobile: 30,
                        desktop: 40,
                        tablet: 30,
                      ),
                      color: AppColors.white,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.visible,
                    ),
                    Gap(
                      getValueForScreenType<double>(
                        context: context,
                        mobile: 32,
                        tablet: 32,
                        desktop: 96,
                      ),
                    ),
                    tabHeadingWidget(context, state),
                    Gap(
                      getValueForScreenType<double>(
                        context: context,
                        mobile: 32,
                        tablet: 32,
                        desktop: 96,
                      ),
                    ),
                    tabDataMobileWidget(context, state),
                    Gap(
                      getValueForScreenType<double>(
                        context: context,
                        mobile: 32,
                        tablet: 32,
                        desktop: 96,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget tabHeadingWidget(
    BuildContext context,
    PartnersState state,
  ) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal, // Horizontal scroll
        itemCount: (state.secureFuture?.partnerCard ?? []).length,
        itemBuilder: (context, index) {
          return MouseRegion(
            cursor: SystemMouseCursors.click,
            child: InkWell(
              onTap: () {
                context.read<PartnersBloc>().add(TabClickEvent(
                      index,
                    ));
              },
              child: Container(
                width: getValueForScreenType(
                  context: context,
                  mobile: Constants.width * .45,
                  tablet: Constants.videoBreakPoint *
                      .9 /
                      (state.secureFuture?.partnerCard ?? []).length,
                  desktop: (Constants.desktopBreakPoint * .6) /
                      (state.secureFuture?.partnerCard ?? []).length,
                ),
                decoration: BoxDecoration(
                  color: state.selectedItem == index
                      ? AppColors.blue
                      : AppColors.transparent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: kStyle.med(
                      size: getValueForScreenType(
                        context: context,
                        mobile: 14,
                        desktop: 16,
                        tablet: 16,
                      ),
                      overflow: TextOverflow.visible,
                      color: AppColors.white,
                      text: state.secureFuture?.partnerCard?[index].tabHead
                              ?.tabHeading ??
                          ''),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget tabDataMobileWidget(
    BuildContext context,
    PartnersState state,
  ) {
    if (state.selectedItem == 0) {
      return SizedBox(
        width: getValueForScreenType(
          context: context,
          mobile: Constants.width * .92,
          tablet: Constants.width * .92,
          desktop: Constants.desktopBreakPoint,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getValueForScreenType(
              context: context,
              mobile: 0,
              tablet: 0,
              desktop: 50,
            ),
          ),
          child: detailsWidget(
              context: context,
              image: state.secureFuture?.partnerCard?[state.selectedItem]
                      .tabBody?.first.secLogo?.url ??
                  '',
              imageLabel: state.secureFuture?.partnerCard?[state.selectedItem]
                      .tabBody?.first.secLogo?.name ??
                  '',
              description: state.secureFuture?.partnerCard?[state.selectedItem]
                      .tabBody?.first.secDescription ??
                  '',
              linkText:
                  state.secureFuture?.partnerCard?[state.selectedItem].tabBody?.first.linkText ??
                      '',
              uri: state.secureFuture?.partnerCard?[state.selectedItem].tabBody
                      ?.first.secCta?.href ??
                  '',
              label: state.secureFuture?.partnerCard?[state.selectedItem].tabBody?.first.secCta?.label ?? '',
              height: 75),
        ),
      );
    } else {
      return ResponsiveBuilder(builder: (context, sizingInformation) {
        if (sizingInformation.isDesktop) {
          return SizedBox(
            width: getValueForScreenType(
              context: context,
              mobile: Constants.width * .92,
              tablet: Constants.width * .92,
              desktop: Constants.desktopBreakPoint,
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: getValueForScreenType(
                  context: context,
                  mobile: 0,
                  tablet: 0,
                  desktop: 50,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: detailsWidget(
                      context: context,
                      image: state
                              .secureFuture
                              ?.partnerCard?[state.selectedItem]
                              .tabBody
                              ?.first
                              .secLogo
                              ?.url ??
                          '',
                      imageLabel: state
                              .secureFuture
                              ?.partnerCard?[state.selectedItem]
                              .tabBody
                              ?.first
                              .secLogo
                              ?.name ??
                          '',
                      description: state
                              .secureFuture
                              ?.partnerCard?[state.selectedItem]
                              .tabBody
                              ?.first
                              .secDescription ??
                          '',
                      linkText: state
                              .secureFuture
                              ?.partnerCard?[state.selectedItem]
                              .tabBody
                              ?.first
                              .linkText ??
                          '',
                      uri: state.secureFuture?.partnerCard?[state.selectedItem]
                              .tabBody?.first.secCta?.href ??
                          '',
                      label: state
                              .secureFuture
                              ?.partnerCard?[state.selectedItem]
                              .tabBody
                              ?.first
                              .secCta
                              ?.label ??
                          '',
                      height: 75,
                    ),
                  ),
                  const Gap(50),
                  Expanded(
                    child: detailsWidget(
                      context: context,
                      image: state
                              .secureFuture
                              ?.partnerCard?[state.selectedItem]
                              .tabBody
                              ?.last
                              .secLogo
                              ?.url ??
                          '',
                      imageLabel: state
                              .secureFuture
                              ?.partnerCard?[state.selectedItem]
                              .tabBody
                              ?.last
                              .secLogo
                              ?.name ??
                          '',
                      description: state
                              .secureFuture
                              ?.partnerCard?[state.selectedItem]
                              .tabBody
                              ?.last
                              .secDescription ??
                          '',
                      linkText: state
                              .secureFuture
                              ?.partnerCard?[state.selectedItem]
                              .tabBody
                              ?.last
                              .linkText ??
                          '',
                      uri: state.secureFuture?.partnerCard?[state.selectedItem]
                              .tabBody?.last.secCta?.href ??
                          '',
                      label: state
                              .secureFuture
                              ?.partnerCard?[state.selectedItem]
                              .tabBody
                              ?.last
                              .secCta
                              ?.label ??
                          '',
                      height: 90,
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        return SizedBox(
          width: getValueForScreenType(
            context: context,
            mobile: Constants.width * .92,
            tablet: Constants.width * .92,
            desktop: Constants.desktopBreakPoint,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getValueForScreenType(
                context: context,
                mobile: 0,
                tablet: 0,
                desktop: 50,
              ),
            ),
            child: Column(
              children: [
                detailsWidget(
                  context: context,
                  image: state.secureFuture?.partnerCard?[state.selectedItem]
                          .tabBody?.first.secLogo?.url ??
                      '',
                  imageLabel: state
                          .secureFuture
                          ?.partnerCard?[state.selectedItem]
                          .tabBody
                          ?.first
                          .secLogo
                          ?.name ??
                      '',
                  description: state
                          .secureFuture
                          ?.partnerCard?[state.selectedItem]
                          .tabBody
                          ?.first
                          .secDescription ??
                      '',
                  linkText: state.secureFuture?.partnerCard?[state.selectedItem]
                          .tabBody?.first.linkText ??
                      '',
                  uri: state.secureFuture?.partnerCard?[state.selectedItem]
                          .tabBody?.first.secCta?.href ??
                      '',
                  label: state.secureFuture?.partnerCard?[state.selectedItem]
                          .tabBody?.first.secCta?.label ??
                      '',
                  height: 75,
                ),
                const Gap(50),
                detailsWidget(
                    context: context,
                    image: state.secureFuture?.partnerCard?[state.selectedItem]
                            .tabBody?.last.secLogo?.url ??
                        '',
                    imageLabel: state
                            .secureFuture
                            ?.partnerCard?[state.selectedItem]
                            .tabBody
                            ?.last
                            .secLogo
                            ?.name ??
                        '',
                    description: state
                            .secureFuture
                            ?.partnerCard?[state.selectedItem]
                            .tabBody
                            ?.last
                            .secDescription ??
                        '',
                    linkText: state
                            .secureFuture
                            ?.partnerCard?[state.selectedItem]
                            .tabBody
                            ?.last
                            .linkText ??
                        '',
                    uri: state.secureFuture?.partnerCard?[state.selectedItem]
                            .tabBody?.last.secCta?.href ??
                        '',
                    label: state.secureFuture?.partnerCard?[state.selectedItem].tabBody?.last.secCta?.label ?? '',
                    height: 90),
              ],
            ),
          ),
        );
      });
    }
  }

  Widget detailsWidget({
    required BuildContext context,
    required String image,
    required String imageLabel,
    required String description,
    required String linkText,
    required String uri,
    required String label,
    required double height,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Gap(10),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageWidget(
              imageUrl: image,
              label: imageLabel,
              height: height,
            ),
          ],
        ),
        Gap(height != 90 ? 50 : 30),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            kStyle.med(
              size: getValueForScreenType(
                context: context,
                mobile: 16,
                tablet: 16,
                desktop: 20,
              ),
              overflow: TextOverflow.visible,
              color: AppColors.white,
              text: description,
            ),
            Gap(20),
            Row(
              children: [
                kStyle.med(
                  size: getValueForScreenType(
                    context: context,
                    mobile: 16,
                    tablet: 16,
                    desktop: 20,
                  ),
                  overflow: TextOverflow.visible,
                  color: AppColors.white,
                  text: linkText,
                ),
                Gap(5),
                InkWell(
                  onTap: () async {
                    final Uri url = Uri.parse(uri);
                    if (!await launchUrl(url)) {
                      throw Exception('Could not launch $url');
                    }
                  },
                  child: kStyle.med(
                    size: getValueForScreenType(
                      context: context,
                      mobile: 16,
                      tablet: 16,
                      desktop: 20,
                    ),
                    overflow: TextOverflow.visible,
                    color: AppColors.white,
                    text: label,
                    decoration: TextDecoration.underline,
                    decorationColor: AppColors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
