import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:vcyberiz/core/utils/config/config.dart';
import 'package:vcyberiz/core/utils/styles/app_colors.dart';

import '../../../bloc/careers_bloc/careers_bloc.dart';
import '../../../core/utils/constants/constants.dart';

class KeyResponsibilities extends StatelessWidget {
  final CareersState state;

  const KeyResponsibilities({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
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
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                spacing: 10,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  kStyle.med(
                    text: state.careerData?.jobDetails?[1].secHeader ?? '',
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
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: (state.careerData?.jobDetails?[1].bodyText ?? [])
                        .length,
                    itemBuilder: (context, index) {
                      final bufferData =
                          state.careerData?.jobDetails?[1].bodyText?[index];
                      return BulletPoint(
                        text: bufferData?.text ?? '',
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BulletPoint extends StatelessWidget {
  final String text;

  const BulletPoint({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 5,
            width: 5,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.black,
            ),
          ),
          Gap(10),
          Expanded(
            child: kStyle.reg(
              text: text,
              size: getValueForScreenType(
                context: context,
                mobile: 14,
                tablet: 16,
                desktop: 16,
              ),
              textAlign: TextAlign.left,
              overflow: TextOverflow.visible,
            ),
          ),
        ],
      ),
    );
  }
}
