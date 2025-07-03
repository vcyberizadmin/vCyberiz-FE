// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:vcyberiz/core/utils/config/config.dart';
import 'package:vcyberiz/core/utils/styles/app_colors.dart';

import '../../../bloc/careers_bloc/careers_bloc.dart';
import '../../../core/utils/constants/constants.dart';

class SecuritySection extends StatelessWidget {
  final CareersState state;

  const SecuritySection({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
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
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(15),
                child: Column(
                  spacing: 10,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    kStyle.med(
                      text: state.careerData?.jobDetails?[2].secHeader ?? '',
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
                    kStyle.reg(
                      maxLines: 4,
                      color: AppColors.black,
                      text:
                          state.careerData?.jobDetails?[2].secDescription ?? '',
                      size: getValueForScreenType(
                        context: context,
                        mobile: 14,
                        tablet: 16,
                        desktop: 16,
                      ),
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.visible,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
