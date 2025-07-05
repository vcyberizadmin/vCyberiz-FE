// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:vcyberiz/bloc/our_service_bloc/our_service_bloc.dart';
import 'package:vcyberiz/core/utils/config/config.dart';
import 'package:vcyberiz/core/utils/constants/constants.dart';
import 'package:vcyberiz/core/utils/global_widgets/custom_button_widget.dart';
import 'package:vcyberiz/core/utils/global_widgets/image_widget.dart';
import 'package:vcyberiz/core/utils/styles/app_colors.dart';
import 'package:vcyberiz/routes/route_constants.dart';

class HeaderSection extends StatefulWidget {
  final String documentId;
  const HeaderSection({super.key, required this.documentId});

  @override
  State<HeaderSection> createState() => _HeaderSectionState();
}

class _HeaderSectionState extends State<HeaderSection> {
  final GlobalKey _detailsKey = GlobalKey();
  double? detailsHeight;

  @override
  void initState() {
    super.initState();

    // Delay measurement until first frame is rendered
    WidgetsBinding.instance.addPostFrameCallback((_) => _measureHeight());
  }

  void _measureHeight() {
    if (_detailsKey.currentContext != null) {
      final RenderBox box =
          _detailsKey.currentContext!.findRenderObject() as RenderBox;
      setState(() {
        if ((detailsHeight ?? 0) >= 500) {
          detailsHeight = box.size.height;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OurServiceBloc, OurServiceState>(
      builder: (context, state) {
        return Container(
          width: Constants.width,
          color: AppColors.blue,
          child: Center(
            child: SizedBox(
              width: getValueForScreenType<double>(
                context: context,
                mobile: Constants.width,
                tablet: Constants.width,
                desktop: Constants.videoBreakPoint,
              ),
              child: ResponsiveBuilder(builder: (
                context,
                sizingInformation,
              ) {
                if (sizingInformation.isDesktop) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: detailsWidget(
                          _detailsKey,
                          context,
                          state,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: SizedBox(
                          height: detailsHeight,
                          child: imageWidget(
                            state.serviceDetailsData?.innerPage?[0].secBanner
                                    ?.secImg?.url ??
                                '',
                          ),
                        ),
                      ),
                    ],
                  );
                } else {
                  return Column(
                    children: [
                      Gap(getValueForScreenType(
                          context: context,
                          mobile: 20,
                          tablet: 30,
                          desktop: 40)),
                      detailsWidget(
                        _detailsKey,
                        context,
                        state,
                      ),
                      Gap(getValueForScreenType(
                          context: context, mobile: 20, tablet: 60)),
                      SizedBox(
                        width: double.infinity,
                        height: sizingInformation.isTablet ? 599 : 355,
                        child: imageWidget(
                          state.serviceDetailsData?.innerPage?[0].secBanner
                                  ?.secImg?.url ??
                              '',
                        ),
                      )
                    ],
                  );
                }
              }),
            ),
          ),
        );
      },
    );
  }

  Widget imageWidget(String imageUrl) {
    return ImageWidget(
      imageUrl: imageUrl,
      fit: BoxFit.cover,
      width: double.infinity,
    );
  }

  Widget detailsWidget(
    Key? key,
    BuildContext context,
    OurServiceState state,
  ) {
    return Padding(
      key: key,
      padding: EdgeInsets.symmetric(
        horizontal: getValueForScreenType(
          context: context,
          mobile: 0,
          tablet: 0,
          desktop: 50,
        ),
        vertical: 10,
      ),
      child: SizedBox(
        width: getValueForScreenType(
          context: context,
          mobile: Constants.width * .92,
          tablet: Constants.width * .92,
          desktop: double.infinity,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(10),
            kStyle.med(
              color: AppColors.white,
              text:
                  state.serviceDetailsData?.innerPage?[0].secBanner?.secLabel ??
                      '',
              overflow: TextOverflow.visible,
              textAlign: TextAlign.left,
              size: getValueForScreenType(
                context: context,
                mobile: 14,
                tablet: 20,
                desktop: 20,
              ),
            ),
            Gap(10),
            kStyle.bold(
              color: AppColors.white,
              text: state
                      .serviceDetailsData?.innerPage?[0].secBanner?.secHeader ??
                  '',
              size: getValueForScreenType(
                context: context,
                mobile: 30,
                desktop: 40,
                tablet: 35,
              ),
              textAlign: TextAlign.left,
              overflow: TextOverflow.visible,
            ),
            Gap(15),
            kStyle.med(
              color: AppColors.white,
              overflow: TextOverflow.visible,
              text: state.serviceDetailsData?.innerPage?[0].secBanner
                      ?.secDescription ??
                  '',
              size: getValueForScreenType(
                context: context,
                mobile: 14,
                desktop: 16,
                tablet: 16,
              ),
            ),
            Gap(20),
            Row(
              children: [
                CustomButtonWidget(
                  text: state.serviceDetailsData?.innerPage?[0].secBanner
                          ?.secCta?.label ??
                      '',
                  textSize: getValueForScreenType(
                    context: context,
                    mobile: 14,
                    tablet: 16,
                    desktop: 16,
                  ),
                  showIcon: true,
                  onTap: () {
                    context.goNamed(RouteConstants.contactUsScreenPath);
                  },
                ),
              ],
            ),
            Gap(20),
          ],
        ),
      ),
    );
  }
}
