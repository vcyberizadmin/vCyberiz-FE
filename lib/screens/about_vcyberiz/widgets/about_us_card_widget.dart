import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:vcyberiz/core/utils/config/config.dart';
import 'package:vcyberiz/core/utils/constants/constants.dart';
import 'package:vcyberiz/core/utils/global_widgets/image_widget.dart';

import '../../../../../core/utils/styles/app_colors.dart';

class AboutUsCardWidget extends StatefulWidget {
  final String title;
  final String description;
  final String imageUrl;
  final int index;

  const AboutUsCardWidget({
    super.key,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.index,
  });

  @override
  State<AboutUsCardWidget> createState() => _AboutUsCardWidgetState();
}

class _AboutUsCardWidgetState extends State<AboutUsCardWidget> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      child: MouseRegion(
        onEnter: (_) {
          setState(() {
            isHovered = true;
          });
        },
        onExit: (_) {
          setState(() {
            isHovered = false;
          });
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          height: getValueForScreenType(
            context: context,
            mobile: 280,
            desktop: 400,
            tablet: 400,
          ),
          width: getValueForScreenType(
            context: context,
            mobile: 150,
            desktop: 207,
            tablet: 130,
          ),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: AppColors.transparent,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: AppColors.darkOrangeColor,
              width: isHovered ? 2 : 1,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (widget.imageUrl.isNotEmpty)
                Expanded(
                  flex: 3,
                  child: Center(
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      height: isHovered ? 100 : 90,
                      width: isHovered ? 100 : 90,
                      child: ImageWidget(
                        imageUrl: widget.imageUrl,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              // Gap(getValueForScreenType(
              //     context: context, mobile: 2, desktop: 5, tablet: 4)),
              Expanded(
                flex: 1,
                child: AnimatedDefaultTextStyle(
                  duration: const Duration(milliseconds: 300),
                  style: TextStyle(
                    fontFamily: Constants.font,
                    fontSize: isHovered
                        ? getValueForScreenType(
                            context: context,
                            mobile: 32,
                            tablet: 20,
                            desktop: 32,
                          )
                        : getValueForScreenType(
                            context: context,
                            mobile: 30,
                            tablet: 22,
                            desktop: 30,
                          ),
                    color: AppColors.darkBlueText,
                    fontWeight: FontWeight.w700,
                  ),
                  child: kStyle.semiBold(
                    text: widget.title,
                    size: isHovered ? 27 : 25,
                    overflow: TextOverflow.visible,
                    color: AppColors.darkBlueText,
                    align: TextAlign.center,
                  ),
                ),
              ),
              Gap(10),
              Expanded(
                flex: 3,
                child: AnimatedDefaultTextStyle(
                  duration: const Duration(milliseconds: 300),
                  style: TextStyle(
                    fontSize: isHovered ? 18 : 16,
                    color: AppColors.darkBlueText,
                    overflow: TextOverflow.visible,
                    fontWeight: FontWeight.w500,
                  ),
                  child: kStyle.reg(
                    text: widget.description,
                    size: isHovered ? 17 : 16,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.visible,
                    color: AppColors.darkBlueText,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
