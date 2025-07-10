import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vcyberiz/bloc/events_bloc/events_bloc.dart';
import 'package:vcyberiz/core/utils/config/config.dart';
import 'package:vcyberiz/core/utils/constants/constants.dart';
import 'package:vcyberiz/core/utils/global_widgets/custom_button_widget.dart';
import 'package:vcyberiz/core/utils/global_widgets/image_widget.dart';
import 'package:vcyberiz/core/utils/styles/app_colors.dart';

import '../../../data/model/events_model/event_details_model.dart';
import 'register_popup_widget.dart';

class DetailsWidget extends StatelessWidget {
  const DetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EventsBloc, EventsState>(
      builder: (context, state) {
        return Container(
          width: Constants.width,
          color: AppColors.antiFlashWhite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Gap(getValueForScreenType(
                  context: context, mobile: 0, tablet: 0, desktop: 60)),
              SizedBox(
                width: getValueForScreenType(
                  context: context,
                  mobile: null,
                  tablet: null,
                  desktop: Constants.desktopBreakPoint,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                    getValueForScreenType<double>(
                        context: context, mobile: 0, tablet: 0, desktop: 16),
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      ShaderMask(
                        shaderCallback: (bounds) {
                          return const LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              Colors.black,
                              Colors.black54,
                              Colors.black45,
                            ],
                          ).createShader(bounds);
                        },
                        blendMode: BlendMode.srcATop,
                        child: SizedBox(
                          height: getValueForScreenType<double>(
                            context: context,
                            mobile: 300,
                            tablet: 350,
                            desktop: 400,
                          ),
                          width: double.infinity,
                          child: ImageWidget(
                            imageUrl: state.eventDetailsData?.secImg?.url ?? '',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: kStyle.med(
                          text: state.eventDetailsData?.eventContent?.first
                                  .secHeader ??
                              '',
                          size: getValueForScreenType(
                            context: context,
                            mobile: 20,
                            tablet: 25,
                            desktop: 30,
                          ),
                          color: Colors.white,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.visible,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Gap(getValueForScreenType(
                  context: context, mobile: 24, tablet: 32, desktop: 60)),
              SizedBox(
                width: getValueForScreenType<double>(
                  context: context,
                  mobile: Constants.width * .96,
                  tablet: Constants.width * .96,
                  desktop: Constants.desktopBreakPoint,
                ),
                child: ResponsiveBuilder(builder: (context, sizingInformation) {
                  if (sizingInformation.isMobile) {
                    return Column(
                      spacing: 10,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        dateWidget(state.eventDetailsData?.publicationDate ??
                            DateTime.now()),
                        locationWidget(state.eventDetailsData?.eventContent
                                ?.first.secLocation ??
                            ''),
                        descriptionWidget(state, context),
                        const Gap(16),
                        buttonWidget(context, state),
                        const Gap(16),
                        shareWidget(state),
                      ],
                    );
                  } else if (sizingInformation.isTablet) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                dateWidget(
                                    state.eventDetailsData?.publicationDate ??
                                        DateTime.now()),
                                const Gap(20),
                                locationWidget(state.eventDetailsData
                                        ?.eventContent?.first.secLocation ??
                                    ''),
                              ],
                            ),
                            buttonWidget(context, state),
                          ],
                        ),
                        descriptionWidget(state, context),
                        const Gap(20),
                        shareWidget(state)
                      ],
                    );
                  } else {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  dateWidget(
                                      state.eventDetailsData?.publicationDate ??
                                          DateTime.now()),
                                  const Gap(20),
                                  locationWidget(state.eventDetailsData
                                          ?.eventContent?.first.secLocation ??
                                      ''),
                                ],
                              ),
                              descriptionWidget(state, context),
                            ],
                          ),
                        ),
                        const Spacer(),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            buttonWidget(context, state),
                            const Gap(24),
                            shareWidget(state),
                          ],
                        )
                      ],
                    );
                  }
                }),
              ),
              const Gap(30),
            ],
          ),
        );
      },
    );
  }

  Widget buttonWidget(BuildContext context, EventsState state) {
    return CustomButtonWidget(
      onTap: () {
        registrationDialog(context);
      },
      text: state.eventDetailsData?.eventContent?.first.secCta?.label ?? '',
    );
  }

  Widget descriptionWidget(
    EventsState state,
    BuildContext context,
  ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Gap(20),

        // Overview Title
        kStyle.reg(
          text: state.eventDetailsData?.eventContent?.first.secSubHeader ?? '',
          size: getValueForScreenType(
            context: context,
            mobile: 16,
            tablet: 18,
            desktop: 18,
          ),
          color: AppColors.black,
          overflow: TextOverflow.visible,
        ),
        const Gap(10),

        // Overview Description
        kStyle.med(
          text:
              state.eventDetailsData?.eventContent?.first.secDescription ?? '',
          size: 14,
          color: Colors.black,
          overflow: TextOverflow.visible,
        ),
      ],
    );
  }

  Widget shareWidget(EventsState state) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kStyle.med(
            text:
                state.eventDetailsData?.shareWithFriends?.first.secHeader ?? '',
            size: 16,
            color: AppColors.fontBlack),
        const Gap(10),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ...(state.eventDetailsData?.shareWithFriends?.first.secBody ?? [])
                .map(
              (SecBody data) {
                log(data.secLogo?.first.url ?? "");
                return InkWell(
                  onTap: () {
                    launchSocialShareUrl(
                        Uri.base.toString(), data.link?.label ?? '');
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: CircleAvatar(
                      backgroundColor: AppColors.transparent,
                      radius: 15,
                      child: ImageWidget(
                        imageUrl: data.secLogo?.first.url ?? "",
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget dateWidget(DateTime date) {
    return Row(
      children: [
        const Icon(Icons.calendar_today, size: 18, color: AppColors.grey),
        const Gap(5),
        kStyle.med(
            text: DateFormat('EEEE - dd MMMM yyyy').format(date),
            size: 14,
            color: AppColors.grey),
      ],
    );
  }

  Widget locationWidget(String text) {
    return Row(
      children: [
        const Icon(Icons.location_on, size: 18, color: AppColors.grey),
        const Gap(5),
        kStyle.med(text: text, size: 14, color: AppColors.grey),
      ],
    );
  }

  Future<void> launchSocialShareUrl(String url, String text) async {
    String shareUrl = '';
    if (text == 'LinkedIn') {
      shareUrl = "https://www.linkedin.com/sharing/share-offsite/?url=$url";
    } else if (text == 'facebook') {
      shareUrl = "https://www.facebook.com/sharer/sharer.php?u=$url";
    } else if (text == 'x') {
      shareUrl = "https://twitter.com/intent/tweet?url=$url";
    }
    final uri = Uri.parse(shareUrl);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $shareUrl';
    }
  }
}
