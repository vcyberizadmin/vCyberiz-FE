// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:vcyberiz/core/utils/constants/constants.dart';
import 'package:vcyberiz/core/utils/styles/app_colors.dart';
import 'package:vcyberiz/core/utils/styles/text_styles.dart';

import '../../../bloc/about_us_bloc/about_us_bloc.dart';
import '../../../core/utils/global_widgets/card_widget.dart';
import '../../../data/model/about_us_model/about_us_our_values_model.dart';

class ValuesSection extends StatefulWidget {
  const ValuesSection({super.key});

  @override
  State<ValuesSection> createState() => _ValuesSectionState();
}

class _ValuesSectionState extends State<ValuesSection> {
  int? _hoveredIndex;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AboutUsBloc, AboutUsState>(
      builder: (context, state) {
        if (state.loading) {
          return const SizedBox();
        }
        return Container(
          width: Constants.width,
          color: AppColors.backGroundColor,
          child: Center(
            child: SizedBox(
              width: getValueForScreenType<double>(
                context: context,
                mobile: Constants.width * .96,
                tablet: Constants.width * .92,
                desktop: Constants.desktopBreakPoint,
              ),
              child: Column(
                children: [
                  Gap(
                    getValueForScreenType(
                        context: context, mobile: 10, tablet: 15, desktop: 20),
                  ),
                  Kstyles().med(
                      text: state.ourValuesData?.secHeader ?? '',
                      color: AppColors.textBlueColor,
                      size: getValueForScreenType(
                        context: context,
                        mobile: 30,
                        desktop: 30,
                        tablet: 30,
                      )),
                  Gap(getValueForScreenType(
                    context: context,
                    mobile: 20,
                    desktop: 25,
                    tablet: 20,
                  )),
                  SizedBox(
                    // width: Constants.width * .58,
                    width: getValueForScreenType(
                        context: context,
                        mobile: Constants.width,
                        tablet: Constants.width,
                        desktop: Constants.desktopBreakPoint * .9),

                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: getValueForScreenType(
                          context: context,
                          mobile: 1,
                          tablet: 2,
                          desktop: 3,
                        ),
                        crossAxisSpacing: getValueForScreenType(
                            context: context,
                            mobile: 10,
                            tablet: 10,
                            desktop: 30),
                        mainAxisSpacing: getValueForScreenType(
                            context: context,
                            mobile: 10,
                            tablet: 10,
                            desktop: 30),
                        childAspectRatio: getValueForScreenType(
                          context: context,
                          mobile: 2 / 1.6,
                          tablet: 2 / 1.5,
                          desktop: 2 / 1.2,
                        ),
                      ),
                      shrinkWrap: true,
                      itemCount: (state.ourValuesData?.secCard ?? []).length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        SecCard? data = state.ourValuesData?.secCard?[index];
                        return CardWidget(
                          title: data?.secHeader ?? '',
                          description: data?.description ?? '',
                          imageUrl: data?.logoImg?.url ?? '',
                          index: index,
                          hoveredIndex: _hoveredIndex,
                          onHover: (isHovered) {
                            setState(() {
                              _hoveredIndex = isHovered ? index : null;
                            });
                          },
                          isHome: false,
                        );
                      },
                    ),
                  ),
                  Gap(20),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
