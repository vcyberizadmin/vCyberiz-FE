import 'package:flutter/material.dart';
import 'package:vcyberiz/core/utils/constants/constants.dart';

import '../../../core/utils/constants/string_const.dart';
import '../../../core/utils/global_widgets/custom_animated_button.dart';
import '../../../core/utils/styles/app_colors.dart';

class SolutionContactSection extends StatelessWidget {
  const SolutionContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: Constants.desktopBreakPoint,
        height: 230,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 6, 42, 71),
          borderRadius: BorderRadius.circular(10),
          image: const DecorationImage(
            image: AssetImage(''), // Background pattern
            fit: BoxFit.cover,
            opacity: 0.8,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'AI-First XDR + Managed Threat Protection',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'What to know more? Book your meeting here',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white70,
                fontSize: 14,
              ),
            ),
            SizedBox(height: 20),
            CustomAnimatedButton(
              unselectedTextColor: AppColors.white,
              textColor: AppColors.white,
              selectedTextColor: AppColors.white,
              borderColor: AppColors.transparent,
              bgButtonColor: AppColors.darkOrangeColor,
              text: StringConst.contactUs,
              buttonWidth: 100,
              textSize: 12,
            ),
          ],
        ),
      ),
    );
  }
}
