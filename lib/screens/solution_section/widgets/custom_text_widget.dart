import 'package:flutter/material.dart';
import 'package:vcyberiz/core/utils/styles/text_styles.dart';

import '../../../core/utils/constants/constants.dart';
import '../../../core/utils/styles/app_colors.dart';

class CustomTextWidget extends StatelessWidget {
  final String text;

  const CustomTextWidget({
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Constants.width,
      decoration: BoxDecoration(color: AppColors.white, boxShadow: [
        BoxShadow(
            blurRadius: 4,
            color: AppColors.grey.withOpacity(0.2),
            spreadRadius: 3,
            offset: const Offset(1, 1))
      ]),
      height: 30,
      child: Row(
        children: [
          const Icon(
            Icons.check_circle_rounded,
            color: AppColors.orangeTextColor,
          ),
          Expanded(
            child: Kstyles().light(
              color: AppColors.darkBlueText,
              size: 10,
              text: text,
              overflow: TextOverflow.ellipsis,
            ),
          )
        ],
      ),
    );
  }
}
