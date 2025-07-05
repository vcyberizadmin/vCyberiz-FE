// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:vcyberiz/bloc/careers_bloc/careers_bloc.dart';
import 'package:vcyberiz/core/utils/constants/constants.dart';
import 'package:vcyberiz/core/utils/constants/string_const.dart';
import 'package:vcyberiz/core/utils/global_widgets/no_data_widget.dart';
import 'package:vcyberiz/core/utils/styles/app_colors.dart';

import 'job_card_widget.dart';

class CarrierJobSection extends StatelessWidget {
  const CarrierJobSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CareersBloc, CareersState>(
      builder: (context, state) {
        return Container(
          width: getValueForScreenType(
              context: context,
              mobile: Constants.width,
              desktop: Constants.desktopBreakPoint,
              tablet: Constants.width),
          color: AppColors.bluishGrey,
          child: (state.eventList ?? []).isEmpty
              ? NoDataWidget(
                  text: StringConst.weDontHaveAnyOpeningYet,
                  color: AppColors.greyText,
                )
              : GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: getValueForScreenType(
                        context: context, mobile: 1, desktop: 3, tablet: 2),
                    crossAxisSpacing: getValueForScreenType(
                        context: context, mobile: 10, desktop: 30, tablet: 30),
                    mainAxisSpacing: getValueForScreenType(
                        context: context, mobile: 10, desktop: 30, tablet: 30),
                    childAspectRatio: getValueForScreenType(
                      context: context,
                      mobile: 1.2,
                      tablet: 1.5,
                      desktop: 1.7,
                    ),
                  ),
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: (state.eventList ?? []).length,
                  itemBuilder: (context, index) {
                    //!---------(Job card widget)
                    return CareerCard(data: state.eventList?[index]);
                  },
                ),
        );
      },
    );
  }
}
