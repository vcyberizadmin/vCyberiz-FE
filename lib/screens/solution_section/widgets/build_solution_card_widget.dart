import 'package:flutter/widgets.dart';
import 'package:vcyberiz/core/utils/styles/app_colors.dart';
import 'package:vcyberiz/screens/solution_section/widgets/line_with_circle_widget.dart';

import '../../../core/utils/global_widgets/custom_animated_button.dart';
import 'custom_text_widget.dart';

class BuildSolutionCardWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final String licenses;
  final Color tileColor;
  final List<String> features;
  final Color lineColor;

  const BuildSolutionCardWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.licenses,
    required this.tileColor,
    required this.features,
    required this.lineColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withOpacity(0.1),
              blurRadius: 20,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        height: 450,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: tileColor,
                      ),
                      height: 120,
                      child: Center(
                        child: Text(
                          title,
                          style: const TextStyle(
                            color: AppColors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        LineWithCircle(
                          circleColor: lineColor,
                          circleRadius: 5,
                          lineWidth: 80,
                          lineColor: lineColor,
                        ),
                        LineWithCircle(
                          circleColor: lineColor,
                          circleRadius: 5,
                          lineWidth: 80,
                          lineColor: lineColor,
                          isReversed: true,
                        ),
                      ],
                    ),
                  ],
                ),
                Positioned(
                  right: 20,
                  left: 20,
                  bottom: -5,
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10,
                          color: AppColors.grey.withOpacity(0.2),
                          offset: const Offset(0, 3),
                          spreadRadius: 10,
                        ),
                      ],
                      shape: BoxShape.circle,
                      color: AppColors.white,
                    ),
                    child: const Center(
                      child: Text(
                        "3",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Text(
              subtitle,
              style: const TextStyle(
                color: AppColors.darkBlueText,
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              licenses,
              style: const TextStyle(
                color: AppColors.darkBlueText,
                fontSize: 10,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Features:',
              style: TextStyle(
                color: AppColors.darkBlueText,
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 5),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.all(10),
                shrinkWrap: true,
                itemBuilder: (context, index) =>
                    CustomTextWidget(text: features[index]),
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 10),
                itemCount: features.length,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Center(
              child: CustomAnimatedButton(
                bgButtonColor: AppColors.darkOrangeColor,
                text: 'Contact Us',
                buttonWidth: 120,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
