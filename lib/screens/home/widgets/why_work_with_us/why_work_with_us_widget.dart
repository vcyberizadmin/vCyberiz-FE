// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:vcyberiz/bloc/why_work_with_us_bloc.dart/why_work_with_us_bloc.dart';
import 'package:vcyberiz/core/utils/config/config.dart';
import 'package:vcyberiz/core/utils/constants/constants.dart';
import 'package:vcyberiz/core/utils/styles/app_colors.dart';
import 'package:vcyberiz/core/utils/global_widgets/card_widget.dart';

class WhyWorkWithUsWidget extends StatefulWidget {
  const WhyWorkWithUsWidget({super.key});

  @override
  State<WhyWorkWithUsWidget> createState() => _WhyWorkWithUsWidgetState();
}

class _WhyWorkWithUsWidgetState extends State<WhyWorkWithUsWidget> {
  int? _hoveredIndex;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WhyWorkWithUsBloc, WhyWorkWithUsState>(
        builder: (context, state) {
      return _body(
        context,
        state,
      );
    });
  }

  Widget _body(BuildContext context, WhyWorkWithUsState state) {
    return Container(
      width: Constants.width,
      child: Center(
        child: SizedBox(
          width: getValueForScreenType(
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
                tablet: 30,
                desktop: 50,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                //!--------(Heading)
                kStyle.med(
                  text: state.data?.secHeader ?? "",
                  color: AppColors.blue,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.visible,
                  size: getValueForScreenType(
                    context: context,
                    mobile: 25,
                    tablet: 30,
                    desktop: 35,
                  ),
                ),
                Gap(20),
                //!---------(Description)
                SizedBox(
                  width: getValueForScreenType(
                    context: context,
                    mobile: Constants.width * .8,
                    tablet: Constants.width * .8,
                    desktop: Constants.desktopBreakPoint * .5,
                  ),
                  child: kStyle.med(
                    size: getValueForScreenType(
                      context: context,
                      mobile: 14,
                      tablet: 16,
                      desktop: 18,
                    ),
                    overflow: TextOverflow.visible,
                    textAlign: TextAlign.center,
                    text: state.data?.description ?? "",
                    color: AppColors.black,
                  ),
                ),
                Gap(40),
                ResponsiveBuilder(builder: (
                  context,
                  sizingInformation,
                ) {
                  if (sizingInformation.isMobile) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        state.data?.cards?.length ?? 0,
                        (index) {
                          return CardWidget(
                            imageUrl:
                                state.data?.cards?[index].cardImg?.url ?? "",
                            title: state.data?.cards?[index].title ?? "",
                            description:
                                state.data?.cards?[index].description ?? "",
                            index: index,
                            hoveredIndex:
                                _hoveredIndex, // Pass the hovered index
                            onHover: (isHovered) {
                              setState(() {
                                _hoveredIndex = isHovered ? index : null;
                              });
                            },
                          );
                        },
                      ),
                    );
                  } else if (sizingInformation.isTablet) {
                    List<Widget> rows = [];
                    int i = 0;
                    while (i < (state.data?.cards ?? []).length) {
                      if (i == (state.data?.cards ?? []).length - 1 &&
                          (state.data?.cards ?? []).length % 2 != 0) {
                        // Last item centered (odd count)
                        rows.add(
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.45,
                                child: CardWidget(
                                  imageUrl:
                                      state.data?.cards?[i].cardImg?.url ?? "",
                                  title: state.data?.cards?[i].title ?? "",
                                  description:
                                      state.data?.cards?[i].description ?? "",
                                  index: i,
                                  hoveredIndex: _hoveredIndex,
                                  onHover: (isHovered) {
                                    setState(() {
                                      _hoveredIndex = isHovered ? i : null;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        );
                        i++;
                      } else {
                        rows.add(
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: CardWidget(
                                  imageUrl:
                                      state.data?.cards?[i].cardImg?.url ?? "",
                                  title: state.data?.cards?[i].title ?? "",
                                  description:
                                      state.data?.cards?[i].description ?? "",
                                  index: i,
                                  hoveredIndex: _hoveredIndex,
                                  onHover: (isHovered) {
                                    setState(() {
                                      _hoveredIndex = isHovered ? i : null;
                                    });
                                  },
                                ),
                              ),
                              Gap(20),
                              Expanded(
                                child: CardWidget(
                                  imageUrl:
                                      state.data?.cards?[i + 1].cardImg?.url ??
                                          "",
                                  title: state.data?.cards?[i + 1].title ?? "",
                                  description:
                                      state.data?.cards?[i + 1].description ??
                                          "",
                                  index: i + 1,
                                  hoveredIndex: _hoveredIndex,
                                  onHover: (isHovered) {
                                    setState(() {
                                      _hoveredIndex = isHovered ? i + 1 : null;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        );
                        i += 2;
                      }
                      rows.add(const SizedBox(height: 16));
                    }
                    return Column(
                      children: rows,
                    );
                  } else {
                    return SizedBox(
                      height: 300,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          state.data?.cards?.length ?? 0,
                          (index) {
                            return CardWidget(
                              imageUrl:
                                  state.data?.cards?[index].cardImg?.url ?? "",
                              title: state.data?.cards?[index].title ?? "",
                              description:
                                  state.data?.cards?[index].description ?? "",
                              index: index,
                              hoveredIndex: _hoveredIndex,
                              onHover: (isHovered) {
                                setState(() {
                                  _hoveredIndex = isHovered ? index : null;
                                });
                              },
                              width: getValueForScreenType(
                                context: context,
                                mobile: Constants.width,
                                tablet: Constants.width * .45,
                                desktop: (Constants.desktopBreakPoint /
                                        (state.data?.cards ?? []).length) -
                                    30,
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  }
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
