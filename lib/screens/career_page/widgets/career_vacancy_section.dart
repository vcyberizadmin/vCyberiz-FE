// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:vcyberiz/bloc/careers_bloc/careers_bloc.dart';
import 'package:vcyberiz/core/utils/config/config.dart';
import 'package:vcyberiz/core/utils/constants/constants.dart';
import 'package:vcyberiz/core/utils/styles/app_colors.dart';

import 'carrier_job_section.dart';
import 'custom_search_bar.dart';

class CareerVacancySection extends StatelessWidget {
  const CareerVacancySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      color: AppColors.bluishGrey,
      width: Constants.width,
      child: Center(
        child: SizedBox(
          width: getValueForScreenType<double>(
            context: context,
            mobile: Constants.width * .96,
            tablet: Constants.width * .92,
            desktop: Constants.desktopBreakPoint,
          ),
          child: BlocConsumer<CareersBloc, CareersState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              if (state.loading) {
                return const SizedBox();
              }
              return Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getValueForScreenType(
                  context: context,
                  mobile: 0,
                  tablet: 0,
                  desktop: 100,
                )),
                child: Column(
                  children: [
                    Gap(20),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: getValueForScreenType(
                        context: context,
                        mobile: 0,
                        tablet: 0,
                        desktop: 100,
                      )),
                      child: kStyle.med(
                        overflow: TextOverflow.visible,
                        maxLines: 3,
                        textAlign: TextAlign.center,
                        text: state.filterData?.secDescription ?? '',
                        color: AppColors.darkBlueText,
                        size: getValueForScreenType(
                            context: context,
                            mobile: 16,
                            desktop: 24,
                            tablet: 20),
                      ),
                    ),
                    Gap(50),
                    CustomSearchBar(),
                    Gap(30),
                    CarrierJobSection(),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
