import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:vcyberiz/bloc/events_bloc/events_bloc.dart';
import 'package:vcyberiz/core/utils/config/config.dart';
import 'package:vcyberiz/core/utils/constants/constants.dart';
import 'package:vcyberiz/core/utils/global_widgets/custom_animated_button.dart';
import 'package:vcyberiz/core/utils/styles/app_colors.dart';

class EventsSecurityMaturitySection extends StatelessWidget {
  const EventsSecurityMaturitySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Constants.width,
      child: Center(
        child: BlocConsumer<EventsBloc, EventsState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Container(
              height: 350,
              width: getValueForScreenType<double>(
                context: context,
                mobile: Constants.width * .96,
                tablet: Constants.width * .92,
                desktop: Constants.desktopBreakPoint,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: CachedNetworkImageProvider(
                    state.relatedEvents?.secCard?.secBg?.url ?? '',
                  ),
                  fit: BoxFit.fill,
                ),
              ),
              child: Container(
                height: 350,
                padding: const EdgeInsets.only(
                  left: 100,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    kStyle.bold(
                      text: state.relatedEvents?.secCard?.secHeader ?? '',
                      size: getValueForScreenType(
                          context: context, mobile: 8, desktop: 20, tablet: 12),
                      color: AppColors.white,
                    ),
                    Gap(getValueForScreenType(
                        context: context, mobile: 10, desktop: 30, tablet: 20)),
                    kStyle.bold(
                      text: state.relatedEvents?.secCard?.subHeader ?? '',
                      size: getValueForScreenType(
                          context: context, mobile: 5, desktop: 10, tablet: 8),
                      color: AppColors.white,
                    ),
                    Gap(
                      getValueForScreenType(
                          context: context,
                          mobile: 10,
                          desktop: 30,
                          tablet: 20),
                    ),
                    CustomAnimatedButton(
                      isWhiteBg: false,
                      borderColor: AppColors.orangeBorderColor,
                      bgButtonColor: AppColors.transparent,
                      text: state
                              .relatedEvents?.secCard?.secButton?.label?.name ??
                          '',
                      buttonWidth: getValueForScreenType(
                          context: context,
                          mobile: 100,
                          desktop: 150,
                          tablet: 120),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
