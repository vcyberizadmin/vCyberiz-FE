import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:vcyberiz/core/utils/config/config.dart';
import 'package:vcyberiz/core/utils/constants/constants.dart';
import 'package:vcyberiz/core/utils/global_widgets/image_widget.dart';
import 'package:vcyberiz/core/utils/styles/app_colors.dart';

import '../../../bloc/solutions_bloc/solutions_bloc.dart';

class WhatWeHaveDoneScreen extends StatelessWidget {
  WhatWeHaveDoneScreen({super.key});

  final List solutions = [
    {
      'tileCount': '01',
      'description':
          "Tailored for Microsoft A1, F1, and Basic licenses, vShield provides essential protection across Data, Identity, and Endpoint realms and features 8*5 alert monitoring & response for proactive threat management.",
      'subdescription':
          'vShield is the foundational defense your business must have to survive in the digital landscape.',
      'icon': Icons.cloud,
    },
    {
      'tileCount': '02',
      'description':
          "Designed for Microsoft A3, F3, Standard, and E3 licenses, vArmor offers experience-enhanced Data, Identity, and Endpoint protection, augmented by an AI-powered dashboard for real-time insights.",
      'subdescription':
          'With 24*5 alert monitoring & response, vArmor ensures a proactive approach to threat management.',
      'icon': Icons.data_usage,
    },
    {
      'tileCount': '03',
      'description':
          "vCyberiz complements Microsoft licensing with proprietary, tailored solution packages, offering comprehensive services.",
      'subdescription':
          'Fortify your organization beyond the vProtect solution with AI-powered workbooks, SOC as a Service, SOAR with playbooks, UEBA for IT, and VIP monitoring.',
      'icon': Icons.security,
    },
    {
      'tileCount': '04',
      'description':
          "Tailored for Microsoft A5, F5, Premium, and E5 licenses, vProtect sets a new standard of security excellence. vProtect offers comprehensive coverage across Data, Identity, Endpoint, and Cloud protection.",
      'subdescription':
          'Featuring an AI-powered dashboard, 24*7 alert monitoring & response, XDR, Advanced Incident Response, and Threat-hunting capabilities, vProtect is the ultimate choice for organizations seeking premium cybersecurity defenses.',
      'icon': Icons.warning_amber_rounded,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.darkBlue,
      width: Constants.width,
      child: Center(
        child: SizedBox(
          width: getValueForScreenType<double>(
            context: context,
            mobile: Constants.width * .96,
            tablet: Constants.width * .92,
            desktop: Constants.desktopBreakPoint,
          ),
          child: BlocBuilder<SolutionsBloc, SolutionsState>(
            builder: (context, state) {
              return Column(
                children: [
                  Gap(50),

                  // Header Section
                  headerWidget(context, state),
                  Gap(50),

                  gridWidget(context, state),
                  Gap(50),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget headerWidget(
    BuildContext context,
    SolutionsState state,
  ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        kStyle.bold(
          text: state.whatWeHaveDoneData?.body?.secHeader ?? '',
          color: AppColors.orangeTextColor,
          size: 14,
        ),
        Gap(10),
        SizedBox(
          width: getValueForScreenType(
            context: context,
            mobile: Constants.width,
            tablet: Constants.width,
            desktop: Constants.width * .7,
          ),
          child: kStyle.reg(
            text: state.whatWeHaveDoneData?.body?.description ?? '',
            textAlign: TextAlign.center,
            overflow: TextOverflow.visible,
            size: 12,
            color: Colors.white,
          ),
        ),
        Gap(10),
      ],
    );
  }

  Widget gridWidget(
    BuildContext context,
    SolutionsState state,
  ) {
    return SizedBox(
      width: getValueForScreenType<double>(
        context: context,
        mobile: Constants.width,
        tablet: Constants.width,
        desktop: Constants.width * .7,
      ),
      child: GridView.builder(
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: getValueForScreenType<int>(
            context: context,
            mobile: 1,
            tablet: 2,
            desktop: 2,
          ),
          crossAxisSpacing: 30,
          mainAxisSpacing: 30,
          childAspectRatio: 3 / 2,
        ),
        itemCount: state.whatWeHaveDoneData?.body?.solutionCard?.length ?? 0,
        itemBuilder: (context, index) {
          final solution = state.whatWeHaveDoneData?.body?.solutionCard?[index];
          return SolutionCard(
            description: solution?.secHeader ?? '',
            subDescription: solution?.description ?? '',
            icon: solution?.logoImg?.url ?? '',
          );
        },
      ),
    );
  }
}

class SolutionCard extends StatelessWidget {
  final String description;
  final String subDescription;
  final String icon;

  const SolutionCard({
    super.key,
    required this.subDescription,
    required this.description,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: AppColors.blackGrey,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              kStyle.bold(
                size: 35,
                text: description,
                color: AppColors.grey,
              ),
              ImageWidget(
                imageUrl: icon,
                width: 100,
                color: AppColors.grey,
              ),
            ],
          ),
          Gap(10),
          kStyle.reg(
            text: subDescription,
            textAlign: TextAlign.justify,
            maxLines: getValueForScreenType(
              context: context,
              mobile: 8,
              tablet: 9,
              desktop: 12,
            ),
            overflow: TextOverflow.ellipsis,
            size: getValueForScreenType<double>(
              context: context,
              mobile: 10,
              tablet: 10,
              desktop: 12,
            ),
            color: AppColors.grey,
          ),
        ],
      ),
    );
  }
}
