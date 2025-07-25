// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:vcyberiz/bloc/careers_bloc/careers_bloc.dart';
import 'package:vcyberiz/core/utils/constants/asset_constants.dart';
import 'package:vcyberiz/core/utils/styles/app_colors.dart';
import '../../../core/utils/constants/constants.dart';
import '../../../core/utils/config/config.dart';

class JobTitleCard extends StatelessWidget {
  final CareersState state;
  const JobTitleCard({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final data = state.careerData;

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
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.25),
                blurRadius: 10,
                offset: Offset(0, 5),
              )
            ],
          ),
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Title
              getValueForScreenType(
                context: context,
                mobile: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    kStyle.bold(
                      text: "Job Description",
                      size: getValueForScreenType(
                        context: context,
                        mobile: 16,
                        tablet: 16,
                        desktop: 18,
                      ),
                      color: AppColors.darkBlueText,
                    ),
                    Wrap(
                      children: data?.employmentTypes
                              ?.map((e) => Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 12, vertical: 5),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                          color: _hexToColor(
                                              e.colorIdentifier ?? "#000000"),
                                        ),
                                      ),
                                      child: kStyle.reg(
                                        text: e.secText ?? '',
                                        size: getValueForScreenType(
                                          context: context,
                                          mobile: 14,
                                          tablet: 15,
                                          desktop: 16,
                                        ),
                                        color: _hexToColor(
                                            e.colorIdentifier ?? "#000000"),
                                      ),
                                    ),
                                  ))
                              .toList() ??
                          [],
                    )
                  ],
                ),
                tablet: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    kStyle.bold(
                      text: "Job Description",
                      size: getValueForScreenType(
                        context: context,
                        mobile: 14,
                        tablet: 15,
                        desktop: 16,
                      ),
                      color: AppColors.darkBlueText,
                    ),
                    Wrap(
                      children: data?.employmentTypes
                              ?.map((e) => Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 12, vertical: 5),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                          color: _hexToColor(
                                              e.colorIdentifier ?? "#000000"),
                                        ),
                                      ),
                                      child: kStyle.reg(
                                        text: e.secText ?? '',
                                        size: getValueForScreenType(
                                          context: context,
                                          mobile: 14,
                                          tablet: 15,
                                          desktop: 16,
                                        ),
                                        color: _hexToColor(
                                            e.colorIdentifier ?? "#000000"),
                                      ),
                                    ),
                                  ))
                              .toList() ??
                          [],
                    )
                  ],
                ),
                desktop: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    kStyle.bold(
                      text: "Job Description",
                      size: 16,
                      color: AppColors.darkBlueText,
                    ),
                    Wrap(
                      children: data?.employmentTypes
                              ?.map((e) => Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 12, vertical: 5),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                          color: _hexToColor(
                                              e.colorIdentifier ?? "#000000"),
                                        ),
                                      ),
                                      child: kStyle.reg(
                                        text: e.secText ?? '',
                                        size: 12,
                                        color: _hexToColor(
                                            e.colorIdentifier ?? "#000000"),
                                      ),
                                    ),
                                  ))
                              .toList() ??
                          [],
                    )
                  ],
                ),
              ),
              Gap(5),

              /// Location row
              Row(
                children: [
                  SvgPicture.asset(
                    AssetConst.location,
                    width: 18,
                    color: AppColors.davysGray,
                  ),
                  Gap(5),
                  kStyle.reg(
                    text: data?.countries?.first.text.toString() ?? "",
                    color: AppColors.davysGray,
                    size: getValueForScreenType(
                      context: context,
                      mobile: 14,
                      tablet: 15,
                      desktop: 16,
                    ),
                  )
                ],
              ),
              Gap(12),

              /// Team
              _labelWithValue(context, "Team", data?.team),

              /// Designation
              _labelWithValue(context, "Designation", data?.secHeader),

              /// Job Role
              _labelWithValue(context, "Job Role", data?.secDescription),

              /// Experience
              _labelWithValue(context, "Experience", data?.experience),

              /// Job Location
              _labelWithValue(
                  context, "Job Location", data?.jobLocation?.toString()),

              /// Shifts
              _labelWithValue(context, "Shifts", data?.shift),
            ],
          ),
        ),
      ),
    );
  }

  /// Widget for label-value row
  Widget _labelWithValue(BuildContext context, String label, String? value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: RichText(
        text: TextSpan(
          text: "$label : ",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: getValueForScreenType(
              context: context,
              mobile: 14,
              tablet: 15,
              desktop: 16,
            ),
            color: AppColors.blue,
            fontFamily: Constants.font,
          ),
          children: [
            TextSpan(
              text: value ?? "-",
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: getValueForScreenType(
                  context: context,
                  mobile: 14,
                  tablet: 15,
                  desktop: 16,
                ),
                color: AppColors.black,
                fontFamily: Constants.font,
              ),
            )
          ],
        ),
      ),
    );
  }

  Color _hexToColor(String hexCode) {
    final hex = hexCode.replaceAll("#", "");
    return Color(int.parse("FF$hex", radix: 16));
  }
}
