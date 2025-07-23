// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:vcyberiz/bloc/our_service_bloc/our_service_bloc.dart';
import 'package:vcyberiz/core/utils/config/config.dart';
import 'package:vcyberiz/core/utils/constants/constants.dart';
import 'package:vcyberiz/core/utils/global_widgets/image_widget.dart';
import 'package:vcyberiz/core/utils/hover/hover.dart';
import 'package:vcyberiz/core/utils/styles/app_colors.dart';

class KeyFocusAreas extends StatelessWidget {
  final String documentId;

  const KeyFocusAreas({super.key, required this.documentId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OurServiceBloc, OurServiceState>(
      builder: (context, state) {
        if ((state.serviceDetailsData?.innerPage?[2].component ?? '') !=
            'm365.key-focus-areas') {
          return SizedBox();
        }
        return Container(
          width: Constants.width,
          color: AppColors.antiFlashWhite,
          child: Center(
            child: Container(
              width: getValueForScreenType(
                context: context,
                mobile: Constants.width * .92,
                tablet: Constants.width * .92,
                desktop: Constants.desktopBreakPoint,
              ),
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: decorationImageProviderWidget(
                  state.serviceDetailsData?.innerPage?[2].secBgImg?.first.url ??
                      '',
                ),
                fit: BoxFit.contain,
              )),
              child: ResponsiveBuilder(builder: (context, sizingInformation) {
                if (sizingInformation.isDesktop) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 50,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Left Section
                        Expanded(
                          child: Container(
                            height: 350,
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 120),
                                child: kStyle.med(
                                  text: state.serviceDetailsData?.innerPage?[2]
                                          .secHeader ??
                                      '',
                                  size: getValueForScreenType(
                                      context: context,
                                      mobile: 25,
                                      tablet: 30,
                                      desktop: 35),
                                  color: AppColors.blue,
                                ),
                              ),
                            ),
                          ),
                        ),

                        Expanded(
                          child: gridWidget(context, state),
                        ),
                      ],
                    ),
                  );
                } else {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Gap(20),
                      kStyle.med(
                        text:
                            state.serviceDetailsData?.innerPage?[2].secHeader ??
                                '',
                        size: getValueForScreenType(
                            context: context,
                            mobile: 25,
                            tablet: 30,
                            desktop: 35),
                        color: AppColors.blue,
                        overflow: TextOverflow.visible,
                        textAlign: TextAlign.center,
                      ),
                      Gap(20),
                      gridWidget(context, state)
                    ],
                  );
                }
              }),
            ),
          ),
        );
      },
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
            context: context, mobile: 1, tablet: 2, desktop: 2), // 2 columns
        crossAxisSpacing: 0, // Spacing between columns
        mainAxisSpacing: getValueForScreenType(
            context: context, mobile: 15, tablet: 0, desktop: 0),
        childAspectRatio: getValueForScreenType(
          context: context,
          mobile: (documentId == 'n2aihpnij6mk3ac1yzrk7x45' ||
                  documentId == 'g1c3nnw9zmcxye2xfxakcprk')
              ? .8 / .45
              : .8 / .7,
          tablet: (documentId == 'n2aihpnij6mk3ac1yzrk7x45' ||
                  documentId == 'g1c3nnw9zmcxye2xfxakcprk')
              ? .8 / .45
              : .8 / .6,
          desktop: () {
            final pixelRatio = MediaQuery.of(context).devicePixelRatio;
            final screenWidth = MediaQuery.of(context).size.width;

            final baseRatio = (documentId == 'n2aihpnij6mk3ac1yzrk7x45' ||
                    documentId == 'g1c3nnw9zmcxye2xfxakcprk')
                ? .8 / .45
                : .8 / .55;

            if (screenWidth < 1300 && pixelRatio > 1.0) {
              return baseRatio + -.5; // Increase aspect ratio for tighter space
            }
            if (screenWidth < 1200 && pixelRatio > 1.0) {
              return baseRatio + -.3; // Increase aspect ratio for tighter space
            }
            return baseRatio;
          }(),
        ),
      ),
      itemCount: (state.serviceDetailsData?.innerPage?[2].secCard ?? []).length,
      itemBuilder: (context, index) {
        final item =
            (state.serviceDetailsData?.innerPage?[2].secCard ?? [])[index];
        return _FocusAreaCard(
          title: item.secHeader ?? '',
          description: item.description ?? '',
          icon: item.logoImg?.url ?? '',
          cardIndex: index,
        );
      },
    );
  }
}

// Widget for an individual focus area card
class _FocusAreaCard extends StatelessWidget {
  final String title;
  final String description;
  final String icon;
  final int cardIndex; // To determine which border to apply

  const _FocusAreaCard({
    required this.title,
    required this.description,
    required this.icon,
    required this.cardIndex,
  });

  // Helper function to determine the border based on index and hover state
  Border? _getCardBorder(int index, bool isHover) {
    const BorderSide hoverBorderSide =
        BorderSide(color: AppColors.orange, width: 2);
    const BorderSide defaultBorderSide =
        BorderSide(color: AppColors.greyBorder, width: .1); // Light grey color

    switch (index) {
      case 0: // Data Protection (Top-Left)
        return isHover
            ? Border(right: hoverBorderSide, bottom: hoverBorderSide)
            : Border(right: defaultBorderSide, bottom: defaultBorderSide);
      case 1: // Identity Protection (Top-Right)
        return isHover
            ? Border(left: hoverBorderSide, bottom: hoverBorderSide)
            : Border(left: defaultBorderSide, bottom: defaultBorderSide);
      case 2: // Endpoint Protection (Bottom-Left)
        return isHover
            ? Border(top: hoverBorderSide, right: hoverBorderSide)
            : Border(top: defaultBorderSide, right: defaultBorderSide);
      case 3: // Threat Protection (Bottom-Right)
        return isHover
            ? Border(top: hoverBorderSide, left: hoverBorderSide)
            : Border(top: defaultBorderSide, left: defaultBorderSide);
      default:
        return Border.all(
            color: AppColors.transparent,
            width: 0); // Fallback for unexpected index
    }
  }

  @override
  Widget build(BuildContext context) {
    // Using your provided HoverView widget
    return HoverView(
      builder: (isHover) {
        return Container(
          padding: EdgeInsets.all(getValueForScreenType(
            context: context,
            mobile: 10,
            tablet: 15,
            desktop: 16,
          )),
          decoration: BoxDecoration(
              color: AppColors.antiFlashWhite,
              border: getValueForScreenType(
                context: context,
                mobile: Border.all(color: AppColors.transparent, width: 0),
                tablet: Border.all(color: AppColors.transparent, width: 0),
                desktop: _getCardBorder(cardIndex, isHover),
              )),
          child: Column(
            spacing: 15,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Icon
              ImageWidget(
                imageUrl: icon,
                height: 60,
              ),
              if (title.isNotEmpty)
                kStyle.semiBold(
                    text: title,
                    size: getValueForScreenType(
                      context: context,
                      mobile: 20,
                      tablet: 25,
                      desktop: Constants.desktopBreakPoint * .02,
                    ),
                    color: AppColors.black,
                    overflow: TextOverflow.visible),

              Expanded(
                child: kStyle.reg(
                  text: description,
                  size: getValueForScreenType(
                    context: context,
                    mobile: 16,
                    tablet: 16,
                    desktop: 16,
                  ),
                  color: AppColors.black,
                  overflow: TextOverflow.visible,
                  textAlign: TextAlign.start,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
