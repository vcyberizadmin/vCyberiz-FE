// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:vcyberiz/core/utils/config/config.dart';
import 'package:vcyberiz/core/utils/constants/constants.dart';

import '../../../bloc/solutions_bloc/solutions_bloc.dart';
import '../../../core/utils/styles/app_colors.dart';
import 'card_widget.dart';

class MicrosoftSecurity extends StatelessWidget {
  const MicrosoftSecurity({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Constants.width,
      color: AppColors.backGroundColor,
      child: BlocBuilder<SolutionsBloc, SolutionsState>(
        builder: (context, state) {
          if (state.microsoftSecurityData == null) {
            return SizedBox();
          }
          return Center(
            child: SizedBox(
              width: getValueForScreenType<double>(
                context: context,
                mobile: Constants.width * .92,
                tablet: Constants.width * .92,
                desktop: Constants.desktopBreakPoint,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Gap(30),
                  Center(
                    child: kStyle.med(
                      text: state.microsoftSecurityData?.secHeader ?? '',
                      size: getValueForScreenType(
                          context: context,
                          mobile: 25,
                          tablet: 30,
                          desktop: 35),
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.visible,
                      color: AppColors.blue,
                    ),
                  ),
                  const Gap(10),
                  // Main Description
                  SizedBox(
                    width: getValueForScreenType(
                      context: context,
                      mobile: double.infinity,
                      tablet: double.infinity,
                      desktop: Constants.width * .5,
                    ),
                    child: kStyle.reg(
                      text: state.microsoftSecurityData?.secLabel ?? '',
                      size: getValueForScreenType(
                        context: context,
                        mobile: 14,
                        tablet: 16,
                        desktop: 16,
                      ),
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.visible,
                    ),
                  ),
                  const Gap(30),

                  // List of Items
                  ...List.generate(
                      (state.microsoftSecurityData?.secCard ?? []).length,
                      (index) {
                    final item =
                        (state.microsoftSecurityData?.secCard ?? [])[index];
                    return CardWidget(item: item);
                  }),
                  Gap(30),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
