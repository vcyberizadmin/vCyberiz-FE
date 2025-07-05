// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:vcyberiz/bloc/solutions_bloc/solutions_bloc.dart';
import 'package:vcyberiz/core/utils/config/config.dart';
import 'package:vcyberiz/core/utils/constants/constants.dart';
import 'package:vcyberiz/core/utils/global_widgets/image_widget.dart';
import 'package:vcyberiz/core/utils/styles/app_colors.dart';

class HeaderSection extends StatelessWidget {
  HeaderSection({super.key});

  final imageKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SolutionsBloc, SolutionsState>(
      builder: (context, state) {
        return Container(
          width: Constants.width,
          color: AppColors.powderBlue,
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
                    children: [
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 24,
                            horizontal: 100,
                          ),
                          child: detailsWidget(
                            context,
                            state: state,
                            sizingInformation: sizingInformation,
                          ),
                        ),
                      ),
                      Expanded(
                        child: ImageWidget(
                          imageUrl: state.solutionsHeaderData?.secBanner?.secImg
                                  ?.url ??
                              '',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  );
                } else {
                  return Column(
                    spacing: 10,
                    children: [
                      Container(
                        width: getValueForScreenType(
                            context: context,
                            mobile: Constants.width * .92,
                            tablet: Constants.width * .8),
                        padding: EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                        child: detailsWidget(
                          context,
                          state: state,
                          sizingInformation: sizingInformation,
                        ),
                      ),
                      ImageWidget(
                        key: imageKey,
                        imageUrl:
                            state.solutionsHeaderData?.secBanner?.secImg?.url ??
                                '',
                        fit: BoxFit.cover,
                        // width: sizingInformation.isTablet ? 687 : 833,
                      ),
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

  Widget detailsWidget(BuildContext context,
      {required SolutionsState state,
      required SizingInformation sizingInformation}) {
    return Column(
      spacing: 10,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kStyle.med(
          color: AppColors.blue,
          text: state.solutionsHeaderData?.secBanner?.secHeader ?? '',
          size: getValueForScreenType(
            context: context,
            mobile: 25,
            desktop: 35,
            tablet: 30,
          ),
          overflow: TextOverflow.visible,
        ),
        SizedBox(
          width: getValueForScreenType<double>(
            context: context,
            mobile: Constants.width * .92,
            tablet: Constants.width * .92,
            desktop: Constants.width * .35,
          ),
          child: kStyle.med(
            color: AppColors.blue,
            overflow: TextOverflow.visible,
            text: state.solutionsHeaderData?.secBanner?.secDescription ?? '',
            height: 1.7,
            size: getValueForScreenType(
              context: context,
              mobile: 14,
              desktop: 18,
              tablet: 16,
            ),
          ),
        ),
      ],
    );
  }
}
