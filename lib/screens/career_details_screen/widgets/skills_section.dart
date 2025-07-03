// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:vcyberiz/bloc/careers_bloc/careers_bloc.dart';
import 'package:vcyberiz/core/utils/config/config.dart';
import 'package:vcyberiz/core/utils/styles/app_colors.dart';

import '../../../core/utils/constants/constants.dart';
import '../../../data/model/careers_model/career_details_model.dart';

class SkillsContainer extends StatelessWidget {
  final CareersState state;
  const SkillsContainer({
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
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              spacing: 10,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                kStyle.med(
                  text: "Skills",
                  size: getValueForScreenType(
                    context: context,
                    mobile: 16,
                    tablet: 16,
                    desktop: 18,
                  ),
                  color: AppColors.darkBlueText,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: getValueForScreenType(
                        context: context,
                        mobile: double.infinity,
                        tablet: double.infinity,
                        desktop: double.infinity,
                      ),
                    ),
                    child: Wrap(
                      spacing: 8,
                      runSpacing: 10,
                      alignment: WrapAlignment.start,
                      children: (state.careerData?.skills ?? [])
                          .map((EmploymentType data) {
                        return Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: AppColors.powderBlue,
                          ),
                          child: kStyle.reg(
                            text: data.secText ?? '',
                            color: AppColors.black,
                            size: getValueForScreenType(
                              context: context,
                              mobile: 14,
                              tablet: 16,
                              desktop: 16,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
