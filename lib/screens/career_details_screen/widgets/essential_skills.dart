// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:vcyberiz/bloc/careers_bloc/careers_bloc.dart';
import 'package:vcyberiz/core/utils/config/config.dart';
import 'package:vcyberiz/core/utils/constants/constants.dart';
import 'package:vcyberiz/core/utils/styles/app_colors.dart';
import 'package:vcyberiz/data/model/careers_model/career_details_model.dart';

class EsseintialSkillsSection extends StatelessWidget {
  final CareersState state;

  const EsseintialSkillsSection({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    final jobDescriptions = state.careerData?.jobDescription ?? [];

    // Split based on non-technical indicator
    final essentialDescriptions = <JobDescription>[];
    final nonTechnicalDescriptions = <JobDescription>[];

    bool isNonTechnicalStarted = false;

    for (final desc in jobDescriptions) {
      final firstText = desc.children?.first.text?.toLowerCase() ?? '';
      if (firstText.contains('non-technical')) {
        isNonTechnicalStarted = true;
      }

      if (isNonTechnicalStarted) {
        nonTechnicalDescriptions.add(desc);
      } else {
        essentialDescriptions.add(desc);
      }
    }

    return SizedBox(
      width: Constants.width,
      child: Center(
        child: Container(
          width: getValueForScreenType<double>(
            context: context,
            mobile: Constants.width * .96,
            tablet: Constants.width * .92,
            desktop: Constants.desktopBreakPoint,
          ),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// --- ESSENTIAL SKILLS ---
              ..._buildDescriptionSection(context, essentialDescriptions),

              const SizedBox(height: 24),

              /// --- NON-TECHNICAL SKILLS ---
              ..._buildDescriptionSection(context, nonTechnicalDescriptions),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildDescriptionSection(
      BuildContext context, List<JobDescription> descriptions) {
    return descriptions.map((desc) {
      switch (desc.type) {
        case 'paragraph':
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: RichText(
              text: TextSpan(
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: getValueForScreenType(
                    context: context,
                    mobile: 14,
                    tablet: 15,
                    desktop: 16,
                  ),
                  fontFamily: Constants.font,
                ),
                children: desc.children?.map((child) {
                      return TextSpan(
                        text: child.text ?? '',
                        style: TextStyle(
                          fontWeight: child.bold == true
                              ? FontWeight.bold
                              : FontWeight.normal,
                          color: child.bold == true
                              ? AppColors.blue
                              : AppColors.black,
                        ),
                      );
                    }).toList() ??
                    [],
              ),
            ),
          );

        case 'list':
          bool isOrdered = desc.format == 'ordered';
          return Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: desc.children!.asMap().entries.map((entry) {
                final index = entry.key;
                final listItem = entry.value;
                final bullet = isOrdered ? "${index + 1}. " : "• ";

                final fullText =
                    listItem.children?.map((e) => e.text ?? '').join('') ?? '';
                final splitIndex = fullText.indexOf(':');

                final hasHeading = splitIndex != -1;
                final headingText =
                    hasHeading ? fullText.substring(0, splitIndex + 1) : '';
                final remainingText =
                    hasHeading ? fullText.substring(splitIndex + 1) : fullText;

                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      kStyle.reg(
                        text: bullet,
                        color: AppColors.black,
                        size: 14,
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: RichText(
                          text: TextSpan(
                            style: TextStyle(
                              fontSize: getValueForScreenType(
                                context: context,
                                mobile: 14,
                                tablet: 15,
                                desktop: 16,
                              ),
                              fontFamily: Constants.font,
                            ),
                            children: [
                              if (headingText.isNotEmpty)
                                TextSpan(
                                  text: headingText,
                                  style: TextStyle(
                                    fontWeight: isOrdered
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                                    fontFamily: Constants.font,
                                    color: isOrdered
                                        ? AppColors.blue
                                        : AppColors.black,
                                  ),
                                ),
                              TextSpan(
                                text: remainingText,
                                style: const TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontFamily: Constants.font,
                                  color: AppColors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          );

        default:
          return const SizedBox.shrink();
      }
    }).toList();
  }
}
