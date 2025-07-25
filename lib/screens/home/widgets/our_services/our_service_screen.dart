// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:vcyberiz/bloc/our_service_bloc/our_service_bloc.dart';
import 'package:vcyberiz/core/utils/config/config.dart';
import 'package:vcyberiz/core/utils/constants/constants.dart';
import 'package:vcyberiz/core/utils/global_widgets/image_widget.dart';
import 'package:vcyberiz/core/utils/styles/app_colors.dart';
import 'package:vcyberiz/screens/home/widgets/our_services/widgets/counter_container_widget.dart';

import '../../../../core/utils/constants/string_const.dart';
import '../../../../data/model/our_service_model/our_service_model.dart';
import 'widgets/tab_content_widget.dart';

import 'widgets/video_player.dart';
import 'widgets/video_player2.dart';

class OurServicesWidget extends StatelessWidget {
  const OurServicesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OurServiceBloc, OurServiceState>(
      builder: (context, state) {
        if (state.loading) {
          return const SizedBox();
        }
        return Container(
          width: Constants.width,
          color: AppColors.antiFlashWhite,
          child: Column(
            children: [
              counterWidget(context, state),
              SizedBox(
                width: getValueForScreenType<double>(
                  context: context,
                  mobile: Constants.width * .92,
                  tablet: Constants.width * .92,
                  desktop: Constants.desktopBreakPoint,
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: getValueForScreenType(
                    context: context,
                    mobile: 20,
                    tablet: 20,
                    desktop: 40,
                  )),
                  child: Column(children: [
                    //!-------(Title text)
                    kStyle.med(
                      size: getValueForScreenType(
                        context: context,
                        mobile: 25,
                        tablet: 30,
                        desktop: 35,
                      ),
                      color: AppColors.blue,
                      text: state.data?.titleSection?.label ?? "",
                    ),

                    Gap(30),

                    //!-----------(Tab View section)
                    tabHeadingWidget(context, state),
                    ResponsiveBuilder(builder: (
                      context,
                      sizingInformation,
                    ) {
                      if (sizingInformation.isDesktop) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: tabDataWidget(context, state),
                        );
                      } else {
                        return tabDataMobileWidget(context, state);
                      }
                    }),
                  ]),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget counterWidget(
    BuildContext context,
    OurServiceState state,
  ) {
    return Container(
      color: AppColors.powderBlue,
      width: Constants.width,
      child: SizedBox(
        width: getValueForScreenType<double>(
          context: context,
          mobile: Constants.width * .96,
          tablet: Constants.width * .92,
          desktop: Constants.desktopBreakPoint,
        ),
        child: Column(
          children: [
            const Gap(30),
            //!-------------(counter Widgets)
            Wrap(
              alignment: WrapAlignment.spaceBetween,
              runAlignment: WrapAlignment.spaceBetween,
              spacing: getValueForScreenType(
                context: context,
                mobile: 5,
                tablet: 5,
                desktop: 0,
              ),
              children: [
                ...(state.data?.achieves?.stat ?? []).map(
                  (Stat data) => CustomCounterWidget(
                    text: data.description ?? '',
                    value: data.value ?? 0,
                    sign: data.sign ?? '',
                  ),
                ),
              ],
            ),
            const Gap(20),
            //!----------(daily data text)
            getValueForScreenType(
              context: context,
              mobile: kStyle.reg(
                size: getValueForScreenType(
                  context: context,
                  mobile: 14,
                  tablet: 14,
                  desktop: 14,
                ),
                color: AppColors.blue,
                text: StringConst.dailyData +
                    DateFormat("d.M.yy 'at' h a 'GST'").format(
                      state.data?.publishedAt ?? DateTime.now(),
                    ),
              ),
              tablet: kStyle.reg(
                size: getValueForScreenType(
                  context: context,
                  mobile: 14,
                  tablet: 14,
                  desktop: 14,
                ),
                color: AppColors.blue,
                text: StringConst.dailyData +
                    DateFormat("d.M.yy 'at' h a 'GST'").format(
                      state.data?.publishedAt ?? DateTime.now(),
                    ),
              ),
              desktop: kStyle.bold(
                size: getValueForScreenType(
                  context: context,
                  mobile: 14,
                  tablet: 14,
                  desktop: 14,
                ),
                color: AppColors.blue,
                text: StringConst.dailyData +
                    DateFormat("d.M.yy 'at' h a 'GST'").format(
                      state.data?.publishedAt ?? DateTime.now(),
                    ),
              ),
            ),
            const Gap(30),
          ],
        ),
      ),
    );
  }

  Widget tabHeadingWidget(
    BuildContext context,
    OurServiceState state,
  ) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: state.data?.mainSection?.first.services?.length ?? 0,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              context.read<OurServiceBloc>().add(TabClickEvent(index));
            },
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              width: getValueForScreenType(
                context: context,
                mobile: Constants.width * .4,
                tablet: Constants.width *
                    .8 /
                    (state.data?.mainSection?.first.services?.length ?? 1),
                desktop: (Constants.desktopBreakPoint) /
                    (state.data?.mainSection?.first.services?.length ?? 1),
              ),
              child: Column(
                children: [
                  AnimatedScale(
                    duration: Duration(milliseconds: 300),
                    scale: index == state.selectedItem ? 1.05 : 1.0,
                    child: ResponsiveBuilder(
                      builder: (context, sizingInformation) {
                        if (sizingInformation.isMobile) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 3),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ImageWidget(
                                  width: getValueForScreenType<double>(
                                    context: context,
                                    mobile: 25,
                                    tablet: 25,
                                    desktop: 35,
                                  ),
                                  imageUrl: state.data?.mainSection?.first
                                          .services?[index].secLogo?.url ??
                                      '',
                                  label: state.data?.mainSection?.first
                                          .services?[index].secLogo?.name ??
                                      '',
                                  color: hexToColor(state
                                          .data
                                          ?.mainSection
                                          ?.first
                                          .services?[index]
                                          .colorIdentifier ??
                                      ''),
                                ),
                                kStyle.reg(
                                  size: getValueForScreenType(
                                    context: context,
                                    mobile: 12,
                                    desktop: 20,
                                    tablet: 16,
                                  ),
                                  overflow: TextOverflow.visible,
                                  textAlign: TextAlign.center,
                                  color: hexToColor(state
                                          .data
                                          ?.mainSection
                                          ?.first
                                          .services?[index]
                                          .colorIdentifier ??
                                      ''),
                                  text: state.data?.mainSection?.first
                                          .services?[index].header ??
                                      '',
                                ),
                              ],
                            ),
                          );
                        } else {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ImageWidget(
                                width: getValueForScreenType<double>(
                                  context: context,
                                  mobile: 25,
                                  tablet: 25,
                                  desktop: 35,
                                ),
                                imageUrl: state.data?.mainSection?.first
                                        .services?[index].secLogo?.url ??
                                    '',
                                label: state.data?.mainSection?.first
                                        .services?[index].secLogo?.name ??
                                    '',
                                color: hexToColor(state.data?.mainSection?.first
                                        .services?[index].colorIdentifier ??
                                    ''),
                              ),
                              Gap(
                                getValueForScreenType<double>(
                                    context: context,
                                    mobile: 5,
                                    tablet: 10,
                                    desktop: 10),
                              ),
                              kStyle.med(
                                size: getValueForScreenType(
                                  context: context,
                                  mobile: 12,
                                  desktop: 20,
                                  tablet: 16,
                                ),
                                overflow: TextOverflow.visible,
                                color: hexToColor(state.data?.mainSection?.first
                                        .services?[index].colorIdentifier ??
                                    ''),
                                text: state.data?.mainSection?.first
                                        .services?[index].header ??
                                    '',
                              ),
                            ],
                          );
                        }
                      },
                    ),
                  ),
                  const Gap(10),
                  AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    height: 2,
                    color: index == state.selectedItem
                        ? hexToColor(state.data?.mainSection?.first
                                .services?[index].colorIdentifier ??
                            '')
                        : AppColors.transparent,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget tabDataMobileWidget(
    BuildContext context,
    OurServiceState state,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Gap(10),
        SizedBox(
          height: getValueForScreenType(
            context: context,
            mobile: 200,
            tablet: 400,
            desktop: 400,
          ),
          width: Constants.width,
          child: state.selectedItem == 0
              ? VideoPlayerWidget(
                  videoUrl: (state.data?.mainSection?.first.services?[0]
                          .serviceBg?.first.url ??
                      ""),
                  secondaryVideoUrl: (state.data?.mainSection?.first
                          .services?[0].secondaryVideoUrl ??
                      ""),
                  placeholderWidget: Container(),
                  fit: BoxFit.fill,
                )
              : VideoPlayerWidget2(
                  videoUrl: (state.data?.mainSection?.first.services?[1]
                          .serviceBg?.first.url ??
                      ""),
                  secondaryVideoUrl: (state.data?.mainSection?.first
                          .services?[1].secondaryVideoUrl ??
                      ''),
                  placeholderWidget: Container(),
                  fit: BoxFit.cover,
                ),
        ),
        Gap(20),
        TabContentWidget(
          heading: state.data?.mainSection?.first.services?[state.selectedItem]
                  .header ??
              '',
          imageUrl: state.data?.mainSection?.first.services?[state.selectedItem]
                  .secLogo?.url ??
              '',
          description: state.data?.mainSection?.first
                  .services?[state.selectedItem].secDescription ??
              '',
          statList: [],
          buttonText: state.data?.mainSection?.first
                  .services?[state.selectedItem].cta?.label ??
              '',
          color: hexToColor(state.data?.mainSection?.first
                  .services?[state.selectedItem].colorIdentifier ??
              ''),
        ), //!-----------(Globe image)
      ],
    );
  }

  Widget tabDataWidget(
    BuildContext context,
    OurServiceState state,
  ) {
    return AnimatedSwitcher(
      duration:
          const Duration(milliseconds: 800), // Duration for the transition
      transitionBuilder: (Widget child, Animation<double> animation) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 2,
            child: TabContentWidget(
              key: ValueKey(state.selectedItem),
              imageUrl: state.data?.mainSection?.first
                      .services?[state.selectedItem].secLogo?.url ??
                  '',
              description: state.data?.mainSection?.first
                      .services?[state.selectedItem].secDescription ??
                  '',
              heading: state.data?.mainSection?.first
                      .services?[state.selectedItem].header ??
                  '',
              statList: [],
              buttonText: state.data?.mainSection?.first
                      .services?[state.selectedItem].cta?.label ??
                  '',
              color: hexToColor(state.data?.mainSection?.first
                      .services?[state.selectedItem].colorIdentifier ??
                  ''),
              gradientColor: [
                hexToColor(state.data?.mainSection?.first
                        .services?[state.selectedItem].secColorIdentifier ??
                    ''),
                hexToColor(state.data?.mainSection?.first
                            .services?[state.selectedItem].colorIdentifier ??
                        '')
                    .withOpacity(.8),
              ],
            ),
          ),
          Gap(Constants.width * .1),

          //!-----------(Globe image)

          Expanded(
            flex: 2,
            child: SizedBox(
              height: getValueForScreenType(
                context: context,
                mobile: 300,
                desktop: state.selectedItem == 0 ? 450 : 450,
                tablet: 400,
              ),
              child: state.selectedItem == 0
                  ? VideoPlayerWidget(
                      videoUrl: (state.data?.mainSection?.first.services?[0]
                              .serviceBg?.first.url ??
                          ""),
                      secondaryVideoUrl: (state.data?.mainSection?.first
                              .services?[0].secondaryVideoUrl ??
                          ""),
                      placeholderWidget: Container(),
                      fit: BoxFit.fill,
                    )
                  : VideoPlayerWidget2(
                      videoUrl: (state.data?.mainSection?.first.services?[1]
                              .serviceBg?.first.url ??
                          ""),
                      secondaryVideoUrl: (state.data?.mainSection?.first
                              .services?[1].secondaryVideoUrl ??
                          ""),
                      placeholderWidget: Container(),
                      fit: BoxFit.cover,
                    ),
            ),
          ),
        ],
      ),
    );
  }

  Color hexToColor(String hexCode) {
    final hex = hexCode.replaceAll("#", "");
    return Color(int.parse("FF$hex", radix: 16));
  }
}

class GradientBorder extends StatelessWidget {
  const GradientBorder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: AppColors.buttonGradientColor,
        ),
      ),
      width: Constants.width,
    );
  }
}
