// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:vcyberiz/core/utils/global_widgets/custom_button_widget.dart';
import 'package:vcyberiz/core/utils/global_widgets/image_widget.dart';
import 'package:vcyberiz/core/utils/styles/app_colors.dart';
import 'package:vcyberiz/routes/route_constants.dart';

import '../../../../bloc/our_solutions_bloc/our_solutions_bloc.dart';
import '../../../../core/utils/config/config.dart';
import '../../../../core/utils/constants/constants.dart';

class OurSolutionWidget extends StatelessWidget {
  const OurSolutionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Constants.width,
      color: AppColors.white,
      child: BlocBuilder<OurSolutionsBloc, OurSolutionsState>(
        builder: (context, state) {
          if (state.loading) {
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
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: getValueForScreenType(
                  context: context,
                  mobile: 20,
                  tablet: 20,
                  desktop: 40,
                )),
                child: Column(children: [
                  //!-------(Title text)
                  kStyle.med(
                    size: getValueForScreenType(
                      context: context,
                      mobile: 25,
                      tablet: 30,
                      desktop: 35,
                    ),
                    color: AppColors.blue,
                    text: state.data?.sectionHeading ?? "",
                  ),

                  Gap(30),

                  //!-----------(Tab View section)

                  tabHeadingWidget(
                    context,
                    state,
                  ),
                  tabDataWidget(context, state),
                ]),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget tabHeadingWidget(
    BuildContext context,
    OurSolutionsState state,
  ) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: state.data?.solutionAccordian?.length ?? 0,
        itemBuilder: (context, index) {
          final isSelected = index == state.selectedIndex;
          final item = state.data?.solutionAccordian?[index];
          final color = _hexToColor(item?.colorIdentifier ?? '');

          return MouseRegion(
            cursor: SystemMouseCursors.click,
            child: InkWell(
              onTap: () {
                context.read<OurSolutionsBloc>().add(
                      SelectIndexEvent(index: index),
                    );
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                width: getValueForScreenType(
                  context: context,
                  mobile: Constants.width * .45,
                  tablet: Constants.width *
                      .8 /
                      (state.data?.solutionAccordian?.length ?? 1),
                  desktop: Constants.desktopBreakPoint /
                      (state.data?.solutionAccordian?.length ?? 1),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ResponsiveBuilder(
                      builder: (context, sizingInformation) {
                        if (sizingInformation.isMobile) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AnimatedScale(
                                scale: isSelected ? 1.1 : 1.0,
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                                child: ImageWidget(
                                  imageUrl: item?.sectionLogo?.url ?? '',
                                  width: getValueForScreenType<double>(
                                    context: context,
                                    mobile: 25,
                                    tablet: 25,
                                    desktop: 35,
                                  ),
                                  color: color,
                                ),
                              ),
                              kStyle.med(
                                size: getValueForScreenType(
                                  context: context,
                                  mobile: 12,
                                  desktop: 20,
                                  tablet: 16,
                                ),
                                overflow: TextOverflow.visible,
                                textAlign: TextAlign.center,
                                color: color,
                                text: item?.heading ?? '',
                              ),
                            ],
                          );
                        } else {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AnimatedScale(
                                scale: isSelected ? 1.1 : 1.0,
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                                child: ImageWidget(
                                  imageUrl: item?.sectionLogo?.url ?? '',
                                  width: getValueForScreenType<double>(
                                    context: context,
                                    mobile: 25,
                                    tablet: 25,
                                    desktop: 35,
                                  ),
                                  color: color,
                                ),
                              ),
                              Gap(
                                getValueForScreenType<double>(
                                  context: context,
                                  mobile: 5,
                                  tablet: 10,
                                  desktop: 10,
                                ),
                              ),
                              kStyle.med(
                                size: getValueForScreenType(
                                  context: context,
                                  mobile: 12,
                                  desktop: 20,
                                  tablet: 16,
                                ),
                                overflow: TextOverflow.visible,
                                color: color,
                                text: item?.heading ?? '',
                              ),
                            ],
                          );
                        }
                      },
                    ),
                    const Gap(10),
                    AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      height: 2,
                      color: isSelected ? color : AppColors.transparent,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Color _hexToColor(String hexCode) {
    final hex = hexCode.replaceAll("#", ""); // Remove the "#" if present
    return Color(int.parse("FF$hex", radix: 16)); // Add "FF" for full opacity
  }

  Widget tabDataWidget(
    BuildContext context,
    OurSolutionsState state,
  ) {
    return ResponsiveBuilder(builder: (
      context,
      sizingInformation,
    ) {
      if (sizingInformation.isDesktop) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 30,
          ),
          child: Row(
            children: [
              Expanded(
                flex: 5,
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          kStyle.bold(
                            text: state
                                    .data
                                    ?.solutionAccordian?[state.selectedIndex]
                                    .heading ??
                                '',
                            color: AppColors.black,
                            size: getValueForScreenType(
                              context: context,
                              mobile: 20,
                              tablet: 35,
                              desktop: 30,
                            ),
                          ),
                          const Gap(15),

                          kStyle.med(
                            text: state
                                    .data
                                    ?.solutionAccordian?[state.selectedIndex]
                                    .description ??
                                '',
                            color: AppColors.black,
                            size: getValueForScreenType(
                              context: context,
                              mobile: 14,
                              tablet: 15,
                              desktop: 16,
                            ),
                            overflow: TextOverflow.visible,
                          ),
                          const Gap(30),

                          //!-------------(services button)

                          Row(
                            children: [
                              CustomButtonWidget(
                                bgButtonColor: _hexToColor(state
                                        .data
                                        ?.solutionAccordian?[
                                            state.selectedIndex]
                                        .colorIdentifier ??
                                    ''),
                                text: state
                                        .data
                                        ?.solutionAccordian?[
                                            state.selectedIndex]
                                        .cta
                                        ?.label ??
                                    '',
                                textSize: 16,
                                onTap: () {
                                  context.goNamed(RouteConstants.solutionsPath);
                                },
                                showIcon: true,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Gap(100),
                  ],
                ),
              ),
              //!-----------(Globe image)
              Expanded(
                flex: 4,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: ImageWidget(
                    imageUrl: state
                            .data
                            ?.solutionAccordian?[state.selectedIndex]
                            .imgUrl
                            ?.first
                            .url ??
                        '',
                    height: getValueForScreenType(
                      context: context,
                      mobile: 300,
                      desktop: 450,
                      tablet: 400,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        );
      } else {
        return Column(
          children: [
            Gap(20),
            //!-----------(Globe image)
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: ImageWidget(
                imageUrl: state.data?.solutionAccordian?[state.selectedIndex]
                        .imgUrl?.first.url ??
                    '',
                width: getValueForScreenType(
                  context: context,
                  mobile: Constants.width,
                  desktop: 400,
                  tablet: Constants.width,
                ),
                fit: BoxFit.fill,
              ),
            ),
            Gap(20),
            SizedBox(
              width: Constants.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  kStyle.med(
                    text: state.data?.solutionAccordian?[state.selectedIndex]
                            .heading ??
                        '',
                    color: AppColors.black,
                    size: 20,
                  ),
                  const Gap(10),

                  kStyle.reg(
                    text: state.data?.solutionAccordian?[state.selectedIndex]
                            .description ??
                        '',
                    color: AppColors.black,
                    size: getValueForScreenType(
                      context: context,
                      mobile: 14,
                      tablet: 15,
                      desktop: 18,
                    ),
                    overflow: TextOverflow.visible,
                  ),
                  const Gap(20),

                  //!-------------(explore global services button)

                  CustomButtonWidget(
                    bgButtonColor: _hexToColor(state
                            .data
                            ?.solutionAccordian?[state.selectedIndex]
                            .colorIdentifier ??
                        ''),
                    buttonHoverColor: _hexToColor(state
                            .data
                            ?.solutionAccordian?[state.selectedIndex]
                            .colorIdentifier ??
                        ''),
                    text: state.data?.solutionAccordian?[state.selectedIndex]
                            .cta?.label ??
                        '',
                    onTap: () {},
                    showIcon: true,
                  ),
                ],
              ),
            ),
            Gap(30),
          ],
        );
      }
    });
  }
}
