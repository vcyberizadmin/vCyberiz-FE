import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:vcyberiz/core/utils/constants/constants.dart';
import 'package:vcyberiz/core/utils/styles/app_colors.dart';
import 'package:vcyberiz/core/utils/styles/text_styles.dart';

class HeaderCareerSection extends StatelessWidget {
  const HeaderCareerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Constants.width,
      decoration: const BoxDecoration(
        color: AppColors.backGroundBlack,
        image: DecorationImage(
          image: AssetImage("assets/images/careerbgbk.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: Center(
        child: SizedBox(
          height: getValueForScreenType(
            context: context,
            mobile: 200,
            desktop: 500,
            tablet: 400,
          ),
          width: getValueForScreenType<double>(
            context: context,
            mobile: Constants.width,
            tablet: Constants.width * 0.92,
            desktop: Constants.desktopBreakPoint,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Gap(getValueForScreenType(
                      context: context, mobile: 20, desktop: 100, tablet: 50)),
                  Kstyles().bold(
                    text: "Careers",
                    size: getValueForScreenType(
                        context: context, mobile: 15, desktop: 50, tablet: 30),
                    color: AppColors.white,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
