// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:vcyberiz/core/utils/config/config.dart';
import 'package:vcyberiz/core/utils/constants/constants.dart';
import 'package:vcyberiz/core/utils/styles/app_colors.dart';

import '../../../bloc/about_us_bloc/about_us_bloc.dart';
import '../../../data/model/about_us_model/about_us_our_vision_service.dart';
import 'video_player.dart';

class AboutVisionSection extends StatelessWidget {
  const AboutVisionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AboutUsBloc, AboutUsState>(
      builder: (context, state) {
        if (state.loading) {
          return const SizedBox();
        }
        return ResponsiveBuilder(
          builder: (context, sizingInformation) {
            if (sizingInformation.isDesktop) {
              return Container(
                width: Constants.width,
                color: AppColors.white,
                child: Center(
                  child: SizedBox(
                    width: Constants.videoBreakPoint,
                    child: Center(
                      child: SizedBox(
                        width: getValueForScreenType<double>(
                          context: context,
                          mobile: Constants.width * .96,
                          tablet: Constants.width * .92,
                          desktop: Constants.desktopBreakPoint,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 50,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: getValueForScreenType(
                                  context: context,
                                  mobile: 300,
                                  tablet: 450,
                                  desktop: 400,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    left: 75,
                                    right: 50,
                                  ),
                                  child: bodyWidget(context, state),
                                ),
                              ),
                              videoWidget(context, state),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            } else {
              return SizedBox(
                width: getValueForScreenType<double>(
                  context: context,
                  mobile: Constants.width * .94,
                  tablet: Constants.width * .94,
                ),
                child: Column(
                  children: [
                    Gap(20),
                    bodyWidget(context, state),
                    Gap(24),
                    videoWidget(context, state),
                    Gap(40),
                  ],
                ),
              );
            }
          },
        );
      },
    );
  }

  Widget videoWidget(BuildContext context, AboutUsState state) {
    if ((state.ourVisionData?.secBg?.url ?? '').isEmpty) {
      return Container();
    }
    return SizedBox(
      width: getValueForScreenType(
        context: context,
        mobile: Constants.width,
        tablet: Constants.width,
        desktop: (Constants.desktopBreakPoint - 50) / 2,
      ),
      height: getValueForScreenType(
        context: context,
        mobile: 250,
        tablet: 400,
        desktop: 400,
      ),
      child: VideoPlayerWidget(
        videoUrl: state.ourVisionData?.secBg?.url ?? '',
        fit: BoxFit.fill,
        placeholderWidget: Container(),
      ),
    );
  }

  Widget bodyWidget(BuildContext context, AboutUsState state) {
    return Column(
      spacing: 5,
      mainAxisAlignment: getValueForScreenType(
        context: context,
        mobile: MainAxisAlignment.start,
        tablet: MainAxisAlignment.start,
        desktop: MainAxisAlignment.center,
      ),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...(state.ourVisionData?.secWritings ?? []).map(
          (SecWriting data) => DescriptionCard(
            titleText: data.secHeader ?? '',
            descriptionText: data.secDescription ?? '',
          ),
        ),
      ],
    );
  }
}

class DescriptionCard extends StatelessWidget {
  final String titleText;
  final String descriptionText;

  const DescriptionCard({
    super.key,
    required this.titleText,
    required this.descriptionText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kStyle.med(
          overflow: TextOverflow.visible,
          textAlign: TextAlign.left,
          color: AppColors.textBlueColor,
          text: titleText,
          size: getValueForScreenType(
            context: context,
            mobile: 25,
            desktop: 35,
            tablet: 30,
          ),
        ),
        const Gap(10),
        SizedBox(
          width: getValueForScreenType<double>(
            context: context,
            mobile: Constants.width * .92,
            tablet: Constants.width * .92,
            desktop: Constants.desktopBreakPoint / 2.5,
          ),
          child: Center(
            child: kStyle.reg(
              overflow: TextOverflow.visible,
              textAlign: TextAlign.left,
              text: descriptionText,
              color: AppColors.black,
              size: getValueForScreenType(
                context: context,
                mobile: 16,
                desktop: 16,
                tablet: 18,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
