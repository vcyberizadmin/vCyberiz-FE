// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:vcyberiz/bloc/careers_bloc/careers_bloc.dart';
import 'package:vcyberiz/core/utils/config/config.dart';
import 'package:vcyberiz/core/utils/constants/asset_constants.dart';
import 'package:vcyberiz/core/utils/styles/app_colors.dart';

import '../../../core/utils/constants/constants.dart';

class JobTitleCard extends StatelessWidget {
  final CareersState state;
  const JobTitleCard({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
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
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                blurRadius: 10,
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(
                  15,
                ),
                child: Column(
                  spacing: 10,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        kStyle.med(
                          text: state.careerData?.secHeader ?? '',
                          size: getValueForScreenType(
                            context: context,
                            mobile: 16,
                            tablet: 16,
                            desktop: 18,
                          ),
                          color: AppColors.darkBlueText,
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.visible,
                        ),
                        const Gap(5),
                        Wrap(
                          spacing: 10,
                          runSpacing: 10,
                          children: (state.careerData?.employmentTypes ?? [])
                              .map((employmentType) {
                            final colorHex =
                                employmentType.colorIdentifier ?? '';
                            final color = _hexToColor(colorHex);
                            return Container(
                              width: 70,
                              height: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(color: color),
                              ),
                              child: Center(
                                child: kStyle.bold(
                                  color: color,
                                  text: employmentType.secText ?? '',
                                  size: getValueForScreenType(
                                    context: context,
                                    mobile: 7,
                                    tablet: 8,
                                    desktop: 10,
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          AssetConst.location,
                          width: 20,
                          color: AppColors.davysGray,
                        ),
                        Gap(5),
                        kStyle.reg(
                          text: state.careerData?.zipCode?.state?.name ?? '',
                          color: AppColors.davysGray,
                          size: 14,
                        )
                      ],
                    ),
                    kStyle.reg(
                      maxLines: 3,
                      color: AppColors.black,
                      text: state.careerData?.secDescription ?? '',
                      size: getValueForScreenType(
                        context: context,
                        mobile: 14,
                        tablet: 16,
                        desktop: 16,
                      ),
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.visible,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _hexToColor(String hexCode) {
    final hex = hexCode.replaceAll("#", "");
    return Color(int.parse("FF$hex", radix: 16));
  }
}
