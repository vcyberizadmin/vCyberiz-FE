// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:vcyberiz/core/utils/config/config.dart';
import 'package:vcyberiz/core/utils/constants/asset_constants.dart';
import 'package:vcyberiz/core/utils/global_widgets/custom_button_widget.dart';
import 'package:vcyberiz/core/utils/styles/app_colors.dart';
import 'package:vcyberiz/data/model/careers_model/career_list_model.dart';
import 'package:vcyberiz/routes/route_constants.dart';

class CareerCard extends StatelessWidget {
  final CareerListData? data;

  const CareerCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          10,
        ),
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
      ),
      padding: const EdgeInsets.all(
        15,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          kStyle.med(
            text: data?.secHeader ?? '',
            size: getValueForScreenType(
              context: context,
              mobile: 16,
              tablet: 18,
              desktop: 18,
            ),
            color: AppColors.textBlueColor,
          ),
          const Gap(10),
          //!----------(Job type )
          Wrap(
            children: [
              ...(data?.employmentTypes ?? []).map(
                (Functions data) => jobTypeText(
                  data.secText ?? '',
                  _hexToColor(data.colorIdentifier ?? ''),
                ),
              ),
            ],
          ),
          const Gap(8),
          Expanded(
            flex: 1,
            //!----------(Description text)
            child: kStyle.reg(
              text: data?.secDescription ?? '',
              size: 14,
              color: AppColors.black,
              maxLines: getValueForScreenType(
                  context: context, mobile: 4, desktop: 3, tablet: 4),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const Gap(8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    AssetConst.location,
                    width: 20,
                    color: AppColors.davysGray,
                  ),
                  Gap(5),
                  kStyle.reg(
                    text: data?.countries?.first.text ?? '',
                    size: 14,
                    color: AppColors.davysGray,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
              CustomButtonWidget(
                text: 'Apply Now',
                bgButtonColor: AppColors.darkOrangeColor,
                onTap: () {
                  context.goNamed(
                    RouteConstants.careerDetailsScreenPath,
                    queryParameters: {
                      'id': data?.documentId ?? '',
                    },
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget jobTypeText(String text, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 5,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: color, width: 1.5),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 6,
            vertical: 2,
          ),
          child: kStyle.reg(
            text: text,
            color: color,
            size: 14,
          ),
        ),
      ),
    );
  }

  Color _hexToColor(String hexCode) {
    final hex = hexCode.replaceAll("#", ""); // Remove the "#" if present
    return Color(int.parse("FF$hex", radix: 16)); // Add "FF" for full opacity
  }
}

class JobCardData {
  final String title;
  final Icon icon;
  final String jobType;
  final String description;
  final String company;
  final String location;

  JobCardData({
    required this.title,
    required this.jobType,
    required this.icon,
    required this.description,
    required this.company,
    required this.location,
  });
}
