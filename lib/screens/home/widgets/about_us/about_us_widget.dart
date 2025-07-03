import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../../bloc/about_us_bloc/about_us_bloc.dart';
import '../../../../core/utils/constants/constants.dart';
import '../../../../core/utils/styles/app_colors.dart';
import '../../../../core/utils/styles/text_styles.dart';
import 'video_player.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //!------------(about us card)
    return Container(
      height: 500,
      //height: 600,
      width: Constants.width,
      color: AppColors.bluishGrey,
      child: BlocBuilder<AboutUsBloc, AboutUsState>(
        builder: (context, state) {
          if (state.loading) {
            return const SizedBox();
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: getValueForScreenType<double>(
                  context: context,
                  mobile: Constants.width * .96,
                  tablet: Constants.width * .92,
                  desktop: Constants.desktopBreakPoint,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //!------------(Video player)
                    const VideoPlayer(),

                    //!---(gap)
                    const Gap(20),
                    //!----------------(About us)

                    aboutUsDetailsWidget(context, state),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget aboutUsDetailsWidget(
    BuildContext context,
    AboutUsState state,
  ) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //!-----(heading)
          Kstyles().bold(
            size: 15,
            text: state.homeData?.sectionLabel ?? '',
            color: AppColors.orangeTextColor,
          ),
          //!------(Subtitle)
          Kstyles().med(
            text: state.homeData?.heading ?? '',
            color: AppColors.darkBlueText,
            size: getValueForScreenType<double>(
              context: context,
              mobile: 15,
              tablet: 20,
              desktop: 30,
            ),
          ),
          const Gap(10),
          //!------------(Description)
          Kstyles().med(
            height: 2,
            size: 15,
            overflow: TextOverflow.visible,
            color: AppColors.darkBlueText,
            text: state.homeData?.description ?? '',
            textAlign: TextAlign.justify,
          )
        ],
      ),
    );
  }
}
