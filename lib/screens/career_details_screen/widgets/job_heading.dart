// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:vcyberiz/bloc/careers_bloc/careers_bloc.dart';
import 'package:vcyberiz/core/utils/config/config.dart';

import '../../../core/utils/styles/app_colors.dart';

class JobDescriptionWidget extends StatelessWidget {
  const JobDescriptionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CareersBloc, CareersState>(
      builder: (context, state) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            kStyle.med(
              text: state.careerData?.secHeader ?? '',
              size: getValueForScreenType(
                context: context,
                mobile: 25,
                tablet: 30,
                desktop: 35,
              ),
              color: AppColors.textBlueColor,
            ),
            Gap(10),
            Flexible(
              child: kStyle.reg(
                overflow: TextOverflow.visible,
                maxLines: 4,
                text: state.careerData?.secDescription ?? '',
                size: getValueForScreenType(
                  context: context,
                  mobile: 14,
                  tablet: 16,
                  desktop: 18,
                ),
                color: AppColors.darkBlueText,
              ),
            ),
          ],
        );
      },
    );
  }
}
