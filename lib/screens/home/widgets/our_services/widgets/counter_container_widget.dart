// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:vcyberiz/core/utils/config/config.dart';
import 'package:vcyberiz/core/utils/constants/constants.dart';
import 'package:vcyberiz/core/utils/styles/app_colors.dart';

class CustomCounterWidget extends StatefulWidget {
  final String text;
  final String sign;
  final double value;
  final double? width;
  final Color? textColor;
  final bool isleft;

  const CustomCounterWidget({
    super.key,
    required this.text,
    required this.sign,
    required this.value,
    this.textColor = AppColors.blue,
    this.isleft = false,
    this.width,
  });

  @override
  State<CustomCounterWidget> createState() => _CustomCounterWidgetState();
}

class _CustomCounterWidgetState extends State<CustomCounterWidget> {
  late double fixedValue; // The target value to display
  late double animatedValue; // The value passed to the counter widget
  late Timer timer;

  @override
  void initState() {
    super.initState();
    fixedValue = widget.value;
    animatedValue = 0; // Start at 0 to ensure an initial animation

    // Use a Future.delayed to trigger the first animation after the widget is built.
    // This is important because AnimatedFlipCounter needs an initial state to animate from.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        animatedValue = fixedValue;
      });
    });

    // Start a timer to retrigger the animation every 5 seconds
    timer = Timer.periodic(const Duration(seconds: 5), (_) {
      // Step 1: Briefly set to a "reset" value (e.g., 0) to prepare for re-animation
      setState(() {
        animatedValue = 0;
      });

      // Step 2: After a very short delay, set to the target value to trigger the roll
      Future.delayed(const Duration(milliseconds: 50), () {
        // Increased delay slightly
        setState(() {
          animatedValue = fixedValue;
        });
      });
    });
  }

  @override
  void dispose() {
    timer.cancel(); // Cancel the timer to avoid memory leaks
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: getValueForScreenType(
            context: context,
            mobile: 0,
            tablet: 20,
            desktop: 20,
          ),
          vertical: getValueForScreenType(
            context: context,
            mobile: 10,
            tablet: 20,
            desktop: 20,
          )),
      child: Container(
        width: widget.width ??
            getValueForScreenType(
              context: context,
              mobile: 150,
              tablet: Constants.width > 1000 ? 120 : 250,
              desktop: 200,
            ),
        child: Column(
          mainAxisAlignment: widget.isleft
              ? MainAxisAlignment.start
              : MainAxisAlignment.center,
          crossAxisAlignment: widget.isleft
              ? CrossAxisAlignment.start
              : CrossAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: widget.isleft
                  ? MainAxisAlignment.start
                  : MainAxisAlignment.center,
              children: [
                AnimatedFlipCounter(
                  value: animatedValue,
                  fractionDigits: _getFractionDigits(fixedValue),
                  duration: const Duration(seconds: 1),
                  curve: Curves.linear,
                  textStyle: TextStyle(
                    fontSize: getValueForScreenType(
                      context: context,
                      mobile: 25,
                      tablet: 30,
                      desktop: 35,
                    ),
                    fontFamily: Constants.font,
                    fontWeight: FontWeight.bold,
                    color: widget.textColor,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Gap(5),
                kStyle.bold(
                  size: getValueForScreenType(
                    context: context,
                    mobile: 25,
                    tablet: 30,
                    desktop: 35,
                  ),
                  text: widget.sign,
                  color: widget.textColor ?? AppColors.blue,
                ),
              ],
            ),
            kStyle.med(
              textAlign: TextAlign.center,
              overflow: TextOverflow.visible,
              size: getValueForScreenType(
                context: context,
                mobile: 14,
                desktop: 18,
                tablet: 16,
              ),
              text: widget.text,
              color: AppColors.blue,
            ),
          ],
        ),
      ),
    );
  }

  int _getFractionDigits(double value) {
    if (value == value.toInt().toDouble()) {
      return 0;
    }
    String valueString = value.toString();
    if (!valueString.contains('.')) return 0;
    String fractionPart = valueString.split('.')[1];
    return fractionPart.length;
  }
}
