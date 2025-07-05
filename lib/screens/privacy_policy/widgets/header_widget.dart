import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:vcyberiz/core/utils/styles/app_colors.dart';
import 'package:vcyberiz/core/utils/styles/text_styles.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return getValueForScreenType(
      context: context,
      mobile: Kstyles().bold(
        text: text,
        size: 36,
        color: AppColors.blue,
        textAlign: TextAlign.left,
      ),
      tablet: Kstyles().med(
        text: text,
        size: 60,
        color: AppColors.black,
        textAlign: TextAlign.left,
      ),
      desktop: Kstyles().med(
        text: text,
        size: 64,
        color: AppColors.black,
        textAlign: TextAlign.left,
      ),
    );
  }
}
