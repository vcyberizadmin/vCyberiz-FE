// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:vcyberiz/bloc/our_service_bloc/our_service_bloc.dart';
import 'package:vcyberiz/core/utils/config/config.dart';
import 'package:vcyberiz/core/utils/constants/constants.dart';
import 'package:vcyberiz/core/utils/global_widgets/gradiant_text.dart';
import 'package:vcyberiz/core/utils/hover/hover.dart';
import 'package:vcyberiz/core/utils/styles/app_colors.dart';

class WhyThisService extends StatelessWidget {
  const WhyThisService({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OurServiceBloc, OurServiceState>(
      builder: (context, state) {
        if ((state.serviceDetailsData?.innerPage?[3].component ?? '') !=
            'm365.why-you-need-this-service') {
          return SizedBox();
        }
        return Container(
          width: Constants.width,
          color: AppColors.antiFlashWhite,
          child: Center(
            child: Container(
              width: getValueForScreenType(
                context: context,
                mobile: Constants.width * .9,
                tablet: Constants.width * .9,
                desktop: Constants.desktopBreakPoint,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: getValueForScreenType(
                    context: context,
                    mobile: 20,
                    tablet: 20,
                    desktop: 30,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    kStyle.med(
                      text: state.serviceDetailsData?.innerPage?[3].secHeader ??
                          '',
                      size: getValueForScreenType(
                        context: context,
                        mobile: 25,
                        tablet: 30,
                        desktop: 35,
                      ),
                      color: AppColors.blue,
                      overflow: TextOverflow.visible,
                      textAlign: TextAlign.center,
                    ),
                    Gap(10),
                    ResponsiveBuilder(builder: (
                      context,
                      sizingInformation,
                    ) {
                      if (sizingInformation.isMobile) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            (state.serviceDetailsData?.innerPage?[3].secCard ??
                                    [])
                                .length,
                            (index) {
                              final item = (state.serviceDetailsData
                                      ?.innerPage?[3].secCard ??
                                  [])[index];
                              return cardWidget(context, state,
                                  item.label ?? '', item.secDescription ?? '');
                            },
                          ),
                        );
                      } else if (sizingInformation.isTablet) {
                        List<Widget> rows = [];
                        int i = 0;
                        final cardList =
                            state.serviceDetailsData?.innerPage?[3].secCard ??
                                [];

                        while (i < cardList.length) {
                          if (i == cardList.length - 1 &&
                              cardList.length % 2 != 0) {
                            // Center the last single card (if odd count)
                            final item = cardList[i];
                            rows.add(
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.4,
                                      child: cardWidget(
                                          context,
                                          state,
                                          item.label ?? '',
                                          item.secDescription ?? '')),
                                ],
                              ),
                            );
                            i++;
                          } else {
                            // Add two cards side by side
                            final item1 = cardList[i];
                            final item2 = cardList[i + 1];

                            rows.add(
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  const Gap(20),
                                  Expanded(
                                    child: cardWidget(
                                      context,
                                      state,
                                      item1.label ?? '',
                                      item1.secDescription ?? '',
                                    ),
                                  ),
                                  const Gap(20),
                                  Expanded(
                                    child: cardWidget(
                                      context,
                                      state,
                                      item2.label ?? '',
                                      item2.secDescription ?? '',
                                    ),
                                  ),
                                  const Gap(20),
                                ],
                              ),
                            );
                            i += 2;
                          }

                          // Spacing between rows
                          rows.add(const SizedBox(height: 16));
                        }

                        return Column(
                          children: rows,
                        );
                      } else {
                        final cardList =
                            state.serviceDetailsData?.innerPage?[3].secCard ??
                                [];
                        List<Widget> rows = [];
                        int i = 0;

                        while (i < cardList.length) {
                          // Get the number of cards remaining
                          final remaining = cardList.length - i;
                          final itemsInRow = remaining >= 5 ? 5 : remaining;

                          // Build row children
                          List<Widget> rowChildren =
                              List.generate(itemsInRow, (j) {
                            final item = cardList[i + j];
                            return cardWidget(
                              context,
                              state,
                              item.label ?? '',
                              item.secDescription ?? '',
                            );
                          });

                          rows.add(
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Row(
                                mainAxisAlignment: itemsInRow < 5
                                    ? MainAxisAlignment.center
                                    : MainAxisAlignment.spaceEvenly,
                                children: rowChildren,
                              ),
                            ),
                          );

                          i += itemsInRow;
                        }

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: rows,
                        );
                      }
                    }),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget cardWidget(
    BuildContext context,
    OurServiceState state,
    String label,
    String discription,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: HoverView(builder: (isHover) {
        return Container(
          height: getValueForScreenType(
            context: context,
            mobile: 200,
            tablet: 200,
            desktop: 220,
          ),
          width: getValueForScreenType(
            context: context,
            mobile: Constants.width,
            tablet: Constants.width * .4,
            desktop: (Constants.desktopBreakPoint / 5) - 35,
          ),
          padding: EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 10,
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: AppColors.white,
              image: DecorationImage(
                image: CachedNetworkImageProvider(isHover
                    ? (state.serviceDetailsData?.innerPage?[3].bgImg?.last
                            .url ??
                        '')
                    : state.serviceDetailsData?.innerPage?[3].bgImg?.first
                            .url ??
                        ''),
                fit: BoxFit.fill,
              )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GradientText(
                text: label,
                gradient: const LinearGradient(
                    colors: AppColors.orangeGradient,
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter),
              ),
              Padding(
                padding:
                    EdgeInsets.only(right: Constants.desktopBreakPoint * .025),
                child: kStyle.reg(
                  text: discription,
                  color: AppColors.black,
                  size: getValueForScreenType(
                    context: context,
                    mobile: 16,
                    tablet: 18,
                    desktop: Constants.desktopBreakPoint * .012,
                  ),
                  overflow: TextOverflow.visible,
                ),
              )
            ],
          ),
        );
      }),
    );
  }

  Widget gridWidget(
    BuildContext context,
    OurServiceState state,
  ) {
    return GridView.builder(
      shrinkWrap: true,
      physics:
          const NeverScrollableScrollPhysics(), // Disable GridView's own scrolling
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: getValueForScreenType(
            context: context, mobile: 1, tablet: 2, desktop: 5), // 2 columns
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
        childAspectRatio: .8 / .5,
      ),
      itemCount: (state.serviceDetailsData?.innerPage?[3].secCard ?? []).length,
      itemBuilder: (context, index) {
        final item =
            (state.serviceDetailsData?.innerPage?[3].secCard ?? [])[index];
        return HoverView(builder: (isHover) {
          return Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: AppColors.white,
                image: DecorationImage(
                  image: CachedNetworkImageProvider(isHover
                      ? (state.serviceDetailsData?.innerPage?[3].bgImg?.last
                              .url ??
                          '')
                      : state.serviceDetailsData?.innerPage?[3].bgImg?.first
                              .url ??
                          ''),
                  fit: BoxFit.fill,
                )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(10),
                GradientText(
                  text: item.label ?? '',
                  gradient: const LinearGradient(
                      colors: AppColors.orangeGradient,
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter),
                ),
                Gap(10),
                kStyle.reg(
                  text: item.secDescription ?? '',
                  color: AppColors.black,
                  size: 15,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 4,
                )
              ],
            ),
          );
        });
      },
    );
  }
}
