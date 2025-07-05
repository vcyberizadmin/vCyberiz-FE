import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:vcyberiz/core/utils/config/config.dart';
import 'package:vcyberiz/core/utils/styles/app_colors.dart';

class AddressTile extends StatelessWidget {
  final String headingText;
  final String addressText;
  final String locationText;
  final double height;

  const AddressTile({
    super.key,
    required this.headingText,
    required this.addressText,
    required this.locationText,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          10,
        ),
        border: Border.all(
          color: AppColors.blue,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.white.withOpacity(
              0.8,
            ),
          ),
        ],
      ),
      height: height,
      width: 260,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 5,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                kStyle.med(
                  text: headingText,
                  size: 14,
                  color: AppColors.darkBlueText,
                ),
                const Gap(5),
                if (locationText != '')
                  Container(
                    height: 15,
                    width: 2,
                    color: AppColors.darkBlueText,
                  ),
                const Gap(5),
                kStyle.med(
                  text: locationText,
                  size: 14,
                  color: AppColors.darkBlueText,
                ),
              ],
            ),
            const Gap(10),
            kStyle.reg(
              text: addressText,
              size: 14,
              overflow: TextOverflow.visible,
              color: AppColors.darkBlueText,
              maxLines: 6,
            ),
          ],
        ),
      ),
    );
  }
}
