import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:vcyberiz/bloc/careers_bloc/careers_bloc.dart';
import 'package:vcyberiz/core/utils/config/config.dart';
import 'package:vcyberiz/core/utils/styles/app_colors.dart';

import '../../../core/utils/constants/constants.dart';

class AdditionalInfoSection extends StatelessWidget {
  final CareersState state;
  const AdditionalInfoSection({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        return SizedBox(
          width: Constants.width,
          child: Center(
            child: Container(
              width: getValueForScreenType<double>(
                context: context,
                mobile: Constants.width * .96,
                tablet: Constants.width * .92,
                desktop: Constants.desktopBreakPoint,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  spacing: 10,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    kStyle.med(
                      text: state.careerData?.jobDetails?[0].secHeader ?? '',
                      size: getValueForScreenType(
                        context: context,
                        mobile: 16,
                        tablet: 16,
                        desktop: 18,
                      ),
                      color: AppColors.darkBlueText,
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.visible,
                    ),
                    if (sizingInformation.isMobile)
                      Column(
                        spacing: 10,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildInfoColumn(
                            title: state.careerData?.jobDetails?[0].contentBlock
                                    ?.first.secHeader ??
                                '',
                            content: state.careerData?.jobDetails?[0]
                                    .contentBlock?.first.secDescription ??
                                '',
                            context: context,
                          ),
                          buildInfoColumn(
                            title: state.careerData?.jobDetails?[0].contentBlock
                                    ?.last.secHeader ??
                                '',
                            content: state.careerData?.jobDetails?[0]
                                    .contentBlock?.last.secDescription ??
                                '',
                            context: context,
                          ),
                        ],
                      )
                    else
                      Row(
                        spacing: 10,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: buildInfoColumn(
                              title: state.careerData?.jobDetails?[0]
                                      .contentBlock?.first.secHeader ??
                                  '',
                              content: state.careerData?.jobDetails?[0]
                                      .contentBlock?.first.secDescription ??
                                  '',
                              context: context,
                            ),
                          ),
                          Expanded(
                            child: buildInfoColumn(
                              title: state.careerData?.jobDetails?[0]
                                      .contentBlock?.last.secHeader ??
                                  '',
                              content: state.careerData?.jobDetails?[0]
                                      .contentBlock?.last.secDescription ??
                                  '',
                              context: context,
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget buildInfoColumn({
    required String title,
    required String content,
    required BuildContext context,
  }) {
    return Column(
      spacing: 5,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kStyle.med(
          color: AppColors.orangeTextColor,
          text: title,
          size: getValueForScreenType(
            context: context,
            mobile: 16,
            tablet: 16,
            desktop: 18,
          ),
          textAlign: TextAlign.left,
          overflow: TextOverflow.visible,
        ),
        kStyle.reg(
          overflow: TextOverflow.visible,
          maxLines: 2,
          color: AppColors.black,
          text: content,
          size: getValueForScreenType(
            context: context,
            mobile: 14,
            tablet: 16,
            desktop: 16,
          ),
          textAlign: TextAlign.left,
        ),
      ],
    );
  }
}
