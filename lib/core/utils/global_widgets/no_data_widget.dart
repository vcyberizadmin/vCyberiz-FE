import 'package:flutter/material.dart';
import 'package:vcyberiz/core/utils/styles/app_colors.dart';

import '../config/config.dart';

class NoDataWidget extends StatelessWidget {
  final String text;
  final Color color;
  const NoDataWidget({
    super.key,
    required this.text,
    this.color = AppColors.darkBlueText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: Center(
        child: kStyle.bold(
          text: text,
          color: color,
        ),
      ),
    );
  }
}
