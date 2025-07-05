import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:vcyberiz/core/utils/styles/app_colors.dart';

import '../constants/constants.dart';
import '../hover/hover.dart';

class CustomAnimatedButton extends StatelessWidget {
  final void Function()? onTap;
  final String text;
  final double buttonWidth;
  final Color bgButtonColor;
  final Color borderColor;
  final Color textColor;
  final Color selectedTextColor;
  final Color unselectedTextColor;
  final double textSize;
  final bool isIconLeft;
  final double buttonHeight;
  final List<Color>? gradientColor;
  final bool isWhiteBg;

  const CustomAnimatedButton({
    required this.bgButtonColor,
    this.isIconLeft = false,
    this.borderColor = AppColors.borderColorBgBlack,
    this.textColor = AppColors.darkBlueText,
    this.selectedTextColor = AppColors.white,
    this.unselectedTextColor = AppColors.white,
    this.textSize = 15,
    super.key,
    this.onTap,
    required this.text,
    required this.buttonWidth,
    this.buttonHeight = 35,
    this.gradientColor,
    this.isWhiteBg = true,
  });

  @override
  Widget build(BuildContext context) {
    return HoverView(builder: (isHover) {
      return AnimatedButton(
        borderColor: isWhiteBg
            ? AppColors.transparent
            : isHover
                ? AppColors.transparent
                : borderColor,
        onPress: onTap,
        width: buttonWidth,
        backgroundColor: bgButtonColor,
        text: text,
        borderRadius: 20,
        animatedOn: AnimatedOn.onHover,
        height: buttonHeight,
        selectedGradientColor: isWhiteBg
            ? LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: gradientColor ?? AppColors.whiteButtonGradientColor,
              )
            : LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: gradientColor ?? AppColors.buttonGradientColor,
              ),
        selectedTextColor: selectedTextColor,
        transitionType: TransitionType.LEFT_BOTTOM_ROUNDER,
        textStyle: TextStyle(
          fontSize: textSize,
          fontFamily: Constants.font,
          color: unselectedTextColor,
          fontWeight: FontWeight.w400,
          overflow: TextOverflow.visible,
        ),
      );
    });
  }
}
