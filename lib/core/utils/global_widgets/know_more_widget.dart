import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:vcyberiz/bloc/solutions_bloc/solutions_bloc.dart';
import 'package:vcyberiz/core/utils/constants/constants.dart';
import 'package:vcyberiz/core/utils/global_widgets/custom_button_widget.dart';
import 'package:vcyberiz/core/utils/styles/app_colors.dart';
import 'package:vcyberiz/core/utils/styles/text_styles.dart';

import 'know_more_video.dart';

class KnowMoreWidget extends StatelessWidget {
  final String videoUrl;
  final String header;
  final String buttonText;
  final Function()? onTap;
  const KnowMoreWidget({
    super.key,
    required this.videoUrl,
    required this.header,
    required this.buttonText,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SolutionsBloc, SolutionsState>(
      builder: (context, state) {
        return Container(
          color: AppColors.darkBlueText,
          width: Constants.width,
          child: Center(
            child: SizedBox(
              width: getValueForScreenType<double>(
                context: context,
                mobile: Constants.width,
                tablet: Constants.width,
                desktop: Constants.videoBreakPoint,
              ),
              child: Stack(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: getValueForScreenType<double>(
                      context: context,
                      mobile: 200,
                      tablet: 250,
                      desktop: 300,
                    ),
                    child: videoUrl.isEmpty
                        ? SizedBox()
                        : KnowMoreVideo(
                            videoUrl: videoUrl,
                            placeholderWidget: Container(),
                            fit: BoxFit.fill,
                          ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    top: 0,
                    bottom: 0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Kstyles().med(
                          text: header,
                          size: getValueForScreenType(
                              context: context,
                              mobile: 25,
                              desktop: 35,
                              tablet: 30),
                          color: AppColors.white,
                          overflow: TextOverflow.visible,
                          textAlign: TextAlign.center,
                        ),
                        const Gap(10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomButtonWidget(
                              onTap: onTap,
                              showIcon: true,
                              bgButtonColor: AppColors.orange,
                              textColor: AppColors.white,
                              text: buttonText,
                              textSize: 16,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
