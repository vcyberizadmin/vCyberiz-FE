// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:vcyberiz/core/utils/config/config.dart';
import 'package:vcyberiz/core/utils/constants/asset_constants.dart';
import 'package:vcyberiz/core/utils/hover/hover.dart';
import 'package:vcyberiz/core/utils/styles/app_colors.dart';

class CustomButtonWidget extends StatelessWidget {
  final void Function()? onTap;
  final String text;
  final Color bgButtonColor;
  final Color buttonHoverColor;
  final Color textColor;
  final double textSize;
  final double buttonHeight;
  final double? width;
  final EdgeInsetsGeometry padding;
  final bool showIcon;
  final Widget? iconWidget;

  const CustomButtonWidget({
    this.bgButtonColor = AppColors.orange,
    this.buttonHoverColor = AppColors.hoverOrange,
    this.textColor = AppColors.white,
    this.textSize = 15,
    super.key,
    this.onTap,
    required this.text,
    this.width,
    this.buttonHeight = 35,
    this.showIcon = false,
    this.padding = const EdgeInsets.symmetric(
      horizontal: 15,
      vertical: 8,
    ),
    this.iconWidget,
  });

  @override
  Widget build(BuildContext context) {
    return HoverView(builder: (isHover) {
      return ResponsiveBuilder(builder: (context, sizingInformation) {
        if (sizingInformation.isDesktop) {
          return InkWell(
            onTap: onTap,
            child: Container(
              width: width,
              decoration: BoxDecoration(
                color: isHover ? buttonHoverColor : bgButtonColor,
                borderRadius: BorderRadius.circular(
                  20,
                ),
              ),
              padding: padding,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  kStyle.med(
                    text: text,
                    size: textSize,
                    color: textColor,
                    textAlign: TextAlign.center,
                  ),
                  if (showIcon)
                    Gap(
                      10,
                    ),
                  if (showIcon)
                    iconWidget ??
                        Image.asset(
                          AssetConst.arrowIcon,
                          width: 20,
                        ),
                ],
              ),
            ),
          );
        } else {
          return InkWell(
            onTap: onTap,
            child: Container(
              decoration: BoxDecoration(
                color: bgButtonColor,
                borderRadius: BorderRadius.circular(
                  20,
                ),
              ),
              child: Padding(
                padding: padding,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    kStyle.med(
                      text: text,
                      size: textSize,
                      color: textColor,
                      textAlign: TextAlign.center,
                    ),
                    if (showIcon) Gap(10),
                    if (showIcon)
                      Image.asset(
                        AssetConst.arrowIcon,
                        width: 20,
                      ),
                  ],
                ),
              ),
            ),
          );
        }
      });
    });
  }
}
