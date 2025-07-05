// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:vcyberiz/core/utils/hover/hover.dart';

import '../config/config.dart';
import '../styles/app_colors.dart';

class CustomButton extends StatelessWidget {
  final Color? color;
  final Color? textColor;

  final bool isIconVisible;
  final bool isWhiteBg;
  final Color? borderColor;
  final Function()? onTap;

  final BorderRadiusGeometry border;
  final EdgeInsetsGeometry? padding;
  final String text;
  final double? width;
  final Color? iconColor;

  const CustomButton({
    this.isIconVisible = false,
    this.borderColor = AppColors.transparent,
    super.key,
    this.color = AppColors.buttonColor,
    required this.border,
    this.padding = const EdgeInsets.symmetric(
      horizontal: 15,
      vertical: 5,
    ),
    required this.text,
    this.onTap,
    this.isWhiteBg = true,
    this.textColor,
    this.width,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return HoverView(builder: (isHover) {
      return InkWell(
        onTap: onTap,
        child: Container(
          width: width,
          decoration: BoxDecoration(
            border: Border.all(
              color: borderColor ?? AppColors.transparent,
            ),
            color: isWhiteBg ? AppColors.darkOrangeColor : color,
            gradient: isHover
                ? LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      AppColors.buttonColor,
                      AppColors.darkOrangeColor,
                      AppColors.buttonColor,
                    ],
                  )
                : null,
            borderRadius: border,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: padding!,
                child: kStyle.reg14(
                  text: text,
                  color: textColor ?? AppColors.white,
                ),
              ),
              if (isIconVisible)
                Icon(
                  Icons.arrow_forward,
                  color: iconColor ?? AppColors.white,
                ),
            ],
          ),
        ),
      );
    });
  }
}
