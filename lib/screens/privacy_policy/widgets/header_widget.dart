import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:vcyberiz/core/utils/config/config.dart';
import 'package:vcyberiz/core/utils/styles/app_colors.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return kStyle.bold(
      text: text,
      size: getValueForScreenType(
        context: context,
        mobile: 36,
        tablet: 60,
        desktop: 64,
      ),
      color: AppColors.blue,
      textAlign: TextAlign.left,
    );
  }
}
