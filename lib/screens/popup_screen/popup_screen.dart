import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../core/utils/global_widgets/check_pref.dart';
import '../../core/utils/global_widgets/custom_animated_button.dart';
import '../../core/utils/styles/app_colors.dart';

class PopUpWidget extends StatelessWidget {
  const PopUpWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      content: Column(
        // mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "We value your privacy",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          RichText(
            text: TextSpan(
              style: const TextStyle(fontSize: 14, color: Colors.black),
              children: [
                const TextSpan(
                  text:
                      "We use cookies to enhance your browsing experience, serve personalized ads or content, and analyze our traffic. By clicking 'Accept', you consent to our use of cookies. ",
                ),
                TextSpan(
                  text: "Cookies Policy",
                  style: const TextStyle(
                    color: Colors.black,
                    decoration: TextDecoration.underline,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      // Handle Cookies Policy tap
                    },
                ),
              ],
            ),
          ),
          const Gap(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomAnimatedButton(
                selectedTextColor: AppColors.black,
                unselectedTextColor: AppColors.black,
                isWhiteBg: false,
                textColor: AppColors.black,
                borderColor: AppColors.buttonColor,
                bgButtonColor: AppColors.transparent,
                text: 'Reject',
                buttonWidth: 120,
                onTap: () async {
                  await AppUtils.setAppOpened();
                  context.pop();
                },
              ),
              const Gap(20),
              CustomAnimatedButton(
                buttonWidth: 120,
                isWhiteBg: true,
                borderColor: AppColors.transparent,
                text: 'Accept',
                bgButtonColor: AppColors.darkOrangeColor,
                onTap: () async {
                  await AppUtils.setAppOpened();
                  context.pop();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
