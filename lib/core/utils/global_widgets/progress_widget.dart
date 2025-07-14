// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:math' as math;

import 'package:dashed_circular_progress_bar/dashed_circular_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:vcyberiz/core/utils/config/config.dart';
import 'package:vcyberiz/core/utils/constants/asset_constants.dart';
import 'package:vcyberiz/core/utils/constants/constants.dart';
import 'package:vcyberiz/core/utils/global_widgets/image_widget.dart';
import 'package:vcyberiz/core/utils/styles/app_colors.dart';

import '../../../data/model/service_details_model/service_details_model.dart';

class ProgressWidget extends StatefulWidget {
  final List<SecCard> items;
  final String header;
  final String label;
  final String bgImage;
  final String logoimage;

  const ProgressWidget({
    super.key,
    required this.items,
    required this.header,
    required this.bgImage,
    required this.label,
    required this.logoimage,
  });

  @override
  State<ProgressWidget> createState() => _ProgressWidgetState();
}

class _ProgressWidgetState extends State<ProgressWidget> {
  // String? _hoveredItemId;
  double _currentProgressBarValue = 0.0;

  /// Returns evenly spaced angles from 170° to 10° (top semi-circle)
  List<double> getItemAngles(int itemCount) {
    const double startAngle = math.pi - math.pi / 18; // 170 degrees
    const double endAngle = math.pi / 18; // 10 degrees
    final double step =
        itemCount > 1 ? (startAngle - endAngle) / (itemCount - 1) : 0;

    return List.generate(itemCount, (i) => startAngle - (i * step));
  }

  /// Start progress from 10%, and spread evenly to 100%
  List<double> getProgressValues(int itemCount) {
    if (itemCount == 1) return [100]; // Only one item, full progress
    double start = 10;
    double end = 100;
    double step = (end - start) / (itemCount - 1);
    return List.generate(itemCount, (i) => start + (i * step));
  }

  @override
  Widget build(BuildContext context) {
    const double progressBarContainerHeight = 350;
    const double progressBarContainerWidth = progressBarContainerHeight * 2;
    const double semiCircleRadius = progressBarContainerHeight / 2;
    const double stackTotalHeight = semiCircleRadius + 200;

    const Offset semiCircleCenterInStack = Offset(
      progressBarContainerWidth / 2,
      stackTotalHeight,
    );

    const double itemPlacementRadius = semiCircleRadius + 80;
    const double itemWidth = 220;
    const double itemHeight = 150;

    final int itemCount = widget.items.length;
    final List<double> itemAngles = getItemAngles(itemCount);
    final List<double> progressValues = getProgressValues(itemCount);

    return Container(
      width: Constants.width,
      height: getValueForScreenType(
        context: context,
        mobile: null,
        tablet: 500,
        desktop: 500,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        image: DecorationImage(
          image: decorationImageProviderWidget(widget.bgImage),
          fit: getValueForScreenType(
            context: context,
            mobile: BoxFit.contain,
            tablet: BoxFit.cover,
            desktop: BoxFit.contain,
          ),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          top: getValueForScreenType(
            context: context,
            mobile: 20,
            tablet: 20,
            desktop: 30,
          ),
          bottom: getValueForScreenType(
            context: context,
            mobile: 20,
            tablet: 0,
            desktop: 0,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            kStyle.med(
              text: widget.header,
              textAlign: TextAlign.center,
              size: getValueForScreenType(
                context: context,
                mobile: 25,
                tablet: 30,
                desktop: 35,
              ),
              color: AppColors.blue,
              overflow: TextOverflow.visible,
            ),
            if (widget.label.isNotEmpty)
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.antiFlashWhite,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 5,
                  ),
                  child: kStyle.med(
                    text: widget.label,
                    textAlign: TextAlign.center,
                    size: 15,
                    color: AppColors.black,
                  ),
                ),
              ),
            ResponsiveBuilder(builder: (context, sizingInformation) {
              if (sizingInformation.isMobile) {
                return Column(
                  children: widget.items.map((data) {
                    SecCard item = data;

                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 20,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              color: Colors.orange.shade500,
                              shape: BoxShape.circle,
                            ),
                            child:
                                ImageWidget(imageUrl: item.secLogo?.url ?? ''),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: kStyle.med(
                              text: item.secDescription ?? '',
                              textAlign: TextAlign.left,
                              size: 14,
                              color: AppColors.black,
                              overflow: TextOverflow.visible,
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                );
              } else {
                return Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    width: 700,
                    height: stackTotalHeight,
                    child: Stack(
                      children: [
                        // Circular Progress Bar
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 400,
                                width: 700,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                      AssetConst.curve,
                                    ),
                                    fit: getValueForScreenType(
                                      context: context,
                                      mobile: BoxFit.contain,
                                      tablet: BoxFit.contain,
                                      desktop: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 150,
                                width: 300,
                                decoration: BoxDecoration(
                                  border: const Border(
                                    top: BorderSide(
                                        color: AppColors.orange, width: 1),
                                    left: BorderSide(
                                        color: AppColors.orange, width: 1),
                                    right: BorderSide(
                                        color: AppColors.orange, width: 1),
                                  ),
                                  color: AppColors.progressBgColor,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(200),
                                    topRight: Radius.circular(200),
                                  ),
                                ),
                                child: Stack(
                                  alignment: Alignment.bottomCenter,
                                  children: [
                                    Positioned(
                                      bottom: 20,
                                      child: ImageWidget(
                                        imageUrl: widget.logoimage,
                                        height: 50, // control size here
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                    DashedCircularProgressBar.aspectRatio(
                                      aspectRatio: 2,
                                      progress: _currentProgressBarValue,
                                      startAngle: 270,
                                      sweepAngle: 180,
                                      circleCenterAlignment:
                                          Alignment.bottomCenter,
                                      foregroundColor: AppColors.orange,
                                      backgroundColor: AppColors.transparent,
                                      foregroundStrokeWidth: 5,
                                      backgroundStrokeWidth: 5,
                                      backgroundGapSize: 2,
                                      backgroundDashSize: 1,
                                      seekColor: Colors.transparent,
                                      seekSize: 0,
                                      animation: true,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        ...widget.items.asMap().entries.map((entry) {
                          int index = entry.key;
                          SecCard item = entry.value;
                          final double angle = itemAngles[index];
                          final double progress = progressValues[index];

                          final double x = semiCircleCenterInStack.dx +
                              itemPlacementRadius * math.cos(angle);
                          final double y = semiCircleCenterInStack.dy -
                              itemPlacementRadius * math.sin(angle);
                          return Positioned(
                            left: x - (itemWidth / 2) < 0
                                ? 0
                                : x - (itemWidth / 2) > 450
                                    ? 480
                                    : x - (itemWidth / 2),
                            top: y - (itemHeight / 2),
                            child: MouseRegion(
                              onEnter: (_) => setState(() {
                                _currentProgressBarValue = progress;
                              }),
                              onExit: (_) => setState(() {
                                _currentProgressBarValue = 0.0;
                              }),
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    _currentProgressBarValue = progress;
                                  });
                                },
                                child: Container(
                                  width: itemWidth,
                                  child: Column(
                                    children: [
                                      kStyle.bold(
                                        text: item.label ?? '',
                                        textAlign: TextAlign.center,
                                        size: 13,
                                        color: AppColors.black,
                                        overflow: TextOverflow.visible,
                                        height: 1,
                                      ),
                                      kStyle.reg(
                                        text: item.secDescription ?? '',
                                        textAlign: TextAlign.center,
                                        size: 13,
                                        color: AppColors.black,
                                        overflow: TextOverflow.visible,
                                        height: 1,
                                      ),
                                      const Gap(10),
                                      Container(
                                        width: 30,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          color: AppColors.orange,
                                          shape: BoxShape.circle,
                                          boxShadow: [
                                            BoxShadow(
                                              color: AppColors.orange,
                                              spreadRadius: 2,
                                              blurRadius: 6,
                                              offset: Offset(0, 3),
                                            ),
                                          ],
                                        ),
                                        child: ImageWidget(
                                            imageUrl: item.secLogo?.url ?? ''),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                      ],
                    ),
                  ),
                );
              }
            }),
          ],
        ),
      ),
    );
  }
}
