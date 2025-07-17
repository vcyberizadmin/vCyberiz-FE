import 'package:flutter/material.dart';
import 'package:vcyberiz/core/utils/config/config.dart';
import 'package:vcyberiz/core/utils/styles/app_colors.dart';

import '../../../data/model/careers_model/career_details_model.dart';

class SkillsCard extends StatelessWidget {
  final List<EmploymentType> skills;

  const SkillsCard({super.key, required this.skills});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Container(
        padding: const EdgeInsets.all(15),
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.25),
              blurRadius: 10,
              offset: Offset(0, 5),
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            kStyle.med(
              text: "Skills",
              color: AppColors.blue,
              size: 16,
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 12,
              runSpacing: 10,
              children: skills
                  .map(
                    (skill) => Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 8),
                      decoration: BoxDecoration(
                        color: AppColors.antiFlashWhite,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: kStyle.reg(
                        text: skill.secText ?? '',
                        size: 14,
                        color: AppColors.black,
                      ),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
