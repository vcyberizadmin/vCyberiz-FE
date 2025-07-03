import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:vcyberiz/core/utils/constants/constants.dart';
import 'package:vcyberiz/core/utils/styles/text_styles.dart';

import '../styles/app_colors.dart';

class HeadingWidget extends StatelessWidget {
  final String text;
  final String image;
  const HeadingWidget({
    super.key,
    required this.text,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Constants.width,
      height: getValueForScreenType(
        context: context,
        mobile: 200,
        desktop: 400,
        tablet: 300,
      ),
      color: AppColors.blue,
      child: Center(
        child: Container(
          // width: Constants.videoBreakPoint,
          decoration: BoxDecoration(
              image: DecorationImage(
            fit: BoxFit.fill,
            image: CachedNetworkImageProvider(
              image,
            ),
          )),
          child: Center(
            child: SizedBox(
                width: getValueForScreenType<double>(
                  context: context,
                  mobile: Constants.width,
                  tablet: Constants.width * .92,
                  desktop: Constants.desktopBreakPoint,
                ),
                child: Center(
                  child: Kstyles().bold(
                    text: text,
                    size: getValueForScreenType(
                      context: context,
                      mobile: 40,
                      tablet: 40,
                      desktop: 50,
                    ),
                    color: AppColors.white,
                    textAlign: TextAlign.left,
                  ),
                )),
          ),
        ),
      ),
    );
  }
}
