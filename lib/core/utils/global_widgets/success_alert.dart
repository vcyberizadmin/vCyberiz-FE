import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:vcyberiz/core/utils/config/config.dart';
import 'package:vcyberiz/core/utils/constants/constants.dart';
import 'package:vcyberiz/core/utils/styles/app_colors.dart';

void showSuccessDialog(
  BuildContext context,
  String text,
  String text2,
) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        backgroundColor: AppColors.white,
        child: SizedBox(
          width: getValueForScreenType(
            context: context,
            mobile: Constants.width * .9,
            tablet: Constants.width * .9,
            desktop: Constants.width * .4,
          ),
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    const Spacer(),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => context.pop(),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                // Success Icon
                CircleAvatar(
                  backgroundColor: Colors.blue.shade900,
                  radius: 30,
                  child: const Icon(Icons.check, color: Colors.white, size: 30),
                ),
                const SizedBox(height: 24),
                kStyle.bold(
                  text: text,
                  textAlign: TextAlign.center,
                  size: 18,
                  overflow: TextOverflow.visible,
                ),
                const SizedBox(height: 12),
                kStyle.reg(
                  text: text2,
                  textAlign: TextAlign.center,
                  size: 14,
                  overflow: TextOverflow.visible,
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      );
    },
  );
}
