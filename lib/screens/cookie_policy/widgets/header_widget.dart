import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:vcyberiz/core/utils/config/config.dart';
import 'package:vcyberiz/core/utils/styles/app_colors.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: getValueForScreenType(
        context: context,
        mobile: Alignment.centerLeft,
        tablet: Alignment.centerLeft,
        desktop: Alignment.centerLeft,
      ),
      child: kStyle.bold(
        text: "Cookie Policy",
        size: getValueForScreenType(
            context: context, mobile: 25, tablet: 30, desktop: 35),
        color: AppColors.blue,
        textAlign: TextAlign.left,
      ),
    );
  }
}
