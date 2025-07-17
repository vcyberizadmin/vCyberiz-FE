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
  final GlobalKey _leftKey = GlobalKey();
  final GlobalKey _rightKey = GlobalKey();

  double? detailsHeight;

  @override
  void initState() {
    super.initState();
  }

  void _measureHeights() {
    final leftContext = _leftKey.currentContext;
    final rightContext = _rightKey.currentContext;

    double? leftHeight;
    double? rightHeight;

    if (leftContext != null) {
      final box = leftContext.findRenderObject() as RenderBox;
      leftHeight = box.size.height;
    }

    if (rightContext != null) {
      final box = rightContext.findRenderObject() as RenderBox;
      rightHeight = box.size.height;
    }

    if (leftHeight != null && rightHeight != null) {
      setState(() {
        detailsHeight = leftHeight! > rightHeight! ? leftHeight : rightHeight;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) => _measureHeights());

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
              child: ResponsiveBuilder(
                builder: (context, sizingInformation) {
                  if (sizingInformation.isDesktop) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: detailsWidget(
                            _leftKey,
                            context,
                            state,
                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                            key: _rightKey,
                            height: (detailsHeight ?? 0) < 500
                                ? 600
                                : detailsHeight,
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
                          _leftKey,
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
                },
              ),
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
        height: getValueForScreenType(
          context: context,
          mobile: null,
          tablet: null,
          desktop: 600,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(20),
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
