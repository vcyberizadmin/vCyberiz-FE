// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:vcyberiz/core/utils/hover/hover.dart';
import 'package:vcyberiz/core/utils/styles/app_colors.dart';
import '../../../../bloc/methodology_bloc/methodology_bloc.dart';
import '../../../../core/utils/config/config.dart';
import '../../../../core/utils/constants/constants.dart';
import '../../../../data/model/methodlogy_model/methodology_model.dart';

import 'widget/video_player.dart';

class MethodologyWidget extends StatelessWidget {
  const MethodologyWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: AppColors.blueGradiant,
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      width: Constants.width,
      child: BlocBuilder<MethodologyBloc, MethodologyState>(
        builder: (context, state) {
          return SizedBox(
            width: getValueForScreenType(
              context: context,
              mobile: Constants.width * .92,
              tablet: Constants.width * .92,
              desktop: Constants.desktopBreakPoint,
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: getValueForScreenType(
                context: context,
                mobile: 20,
                tablet: 20,
                desktop: 30,
              )),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //!-----(heading)
                  SizedBox(
                    width: 500,
                    child: kStyle.med(
                      text: state.data?.sectionHeader?.header ?? '',
                      color: Colors.white,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.visible,
                      size: getValueForScreenType(
                        context: context,
                        mobile: 25,
                        tablet: 30,
                        desktop: 35,
                      ),
                    ),
                  ),
                  Gap(10),
                  //!-----(description)
                  SizedBox(
                    width: 600,
                    child: kStyle.reg(
                      text: state.data?.sectionHeader?.content ?? '',
                      color: Colors.white,
                      size: getValueForScreenType(
                        context: context,
                        mobile: 16,
                        tablet: 16,
                        desktop: 20,
                      ),
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.visible,
                    ),
                  ),
                  Gap(
                    getValueForScreenType(
                      context: context,
                      mobile: 0,
                      tablet: 0,
                      desktop: 30,
                    ),
                  ),
                  //!-----(loop image)
                  ResponsiveBuilder(builder: (
                    context,
                    sizingInformation,
                  ) {
                    if (sizingInformation.isMobile) {
                      return loopMobileWidget(context, state);
                    } else if (sizingInformation.isTablet) {
                      return stackTabWidget(context, state);
                    } else {
                      return stackWidget(context, state);
                    }
                  }),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget stackWidget(
    BuildContext context,
    MethodologyState state,
  ) {
    double centerOfTheVideoPlayer = Constants.desktopBreakPoint / 2;
    return Stack(
      children: [
        SizedBox(
          height: 550,
          width: Constants.desktopBreakPoint,
          child: VideoPlayerWidget(
            videoUrl: state.data?.bgImg ?? '',
            secondaryVideoUrl: state.data?.secondaryVideoUrl ?? '',
            placeholderWidget: Container(),
            fit: BoxFit.fitHeight,
          ),
        ),
        //!-------------(text 1(left))

        Positioned(
          top: 250,
          left: centerOfTheVideoPlayer - 165,
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: kStyle.bold(
              text: state.data?.imgOverlayText1 ?? '',
              color: AppColors.white,
              size: getValueForScreenType(
                context: context,
                mobile: 14,
                tablet: 16,
                desktop: 18,
              ),
              overflow: TextOverflow.visible,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        //!-------------(text 2(right))
        Positioned(
          top: 250,
          right: centerOfTheVideoPlayer - 165,
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: kStyle.bold(
              text: state.data?.imgOverlayText2 ?? '',
              color: AppColors.white,
              size: getValueForScreenType(
                context: context,
                mobile: 14,
                tablet: 16,
                desktop: 18,
              ),
              overflow: TextOverflow.visible,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        //!-------------(top left card)
        Positioned(
            top: 0,
            left: 150,
            child: positionedWidget(
              context,
              state.data?.methodologies?[0].header ?? '',
              state.data?.methodologies?[0].content ?? '',
            )),
        //!-------------(center left card)
        Positioned(
            top: 210,
            left: Constants.width < 1200
                ? 30
                : Constants.width < 1300
                    ? 50
                    : Constants.width < 1400
                        ? 120
                        : 130,
            child: positionedWidget(
              context,
              state.data?.methodologies?[1].header ?? '',
              state.data?.methodologies?[1].content ?? '',
            )),
        //!-------------(bottom left card)
        Positioned(
            bottom: 0,
            left: 150,
            child: positionedWidget(
              context,
              state.data?.methodologies?[2].header ?? '',
              state.data?.methodologies?[2].content ?? '',
            )),
        //!-------------(top right card)
        Positioned(
            top: 0,
            right: 150,
            child: positionedWidget(
              context,
              state.data?.methodologies?[3].header ?? '',
              state.data?.methodologies?[3].content ?? '',
            )),

        //!-------------(center right card)
        Positioned(
          top: 210,
          right: Constants.width < 1200
              ? 30
              : Constants.width < 1300
                  ? 50
                  : Constants.width < 1400
                      ? 120
                      : 130,
          child: positionedWidget(
            context,
            state.data?.methodologies?[4].header ?? '',
            state.data?.methodologies?[4].content ?? '',
          ),
        ),

        //!-------------(bottom right card)
        Positioned(
            bottom: 0,
            right: 150,
            child: positionedWidget(
              context,
              state.data?.methodologies?[5].header ?? '',
              state.data?.methodologies?[5].content ?? '',
            )),
      ],
    );
  }

  Widget stackTabWidget(
    BuildContext context,
    MethodologyState state,
  ) {
    double centerOfTheVideoPlayer = Constants.desktopBreakPoint / 2;
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: 550,
              width: Constants.desktopBreakPoint,
              child: VideoPlayerWidget(
                videoUrl: state.data?.bgImg ?? '',
                secondaryVideoUrl: state.data?.secondaryVideoUrl ?? '',
                placeholderWidget: Container(),
                fit: BoxFit.fitHeight,
              ),
            ),
            //!-------------(text 1(left))

            Positioned(
              top: 250,
              left: centerOfTheVideoPlayer - 165,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: kStyle.bold(
                  text: state.data?.imgOverlayText1 ?? '',
                  color: AppColors.white,
                  size: 18,
                  overflow: TextOverflow.visible,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            //!-------------(text 2(right))
            Positioned(
              top: 250,
              right: centerOfTheVideoPlayer - 165,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: kStyle.bold(
                  text: state.data?.imgOverlayText2 ?? '',
                  color: AppColors.white,
                  size: 18,
                  overflow: TextOverflow.visible,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
        Gap(20),
        gridWidget(context, state),
      ],
    );
  }

  Widget gridWidget(
    BuildContext context,
    MethodologyState state,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getValueForScreenType(
          context: context,
          mobile: 15,
          tablet: 30,
        ),
      ),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: getValueForScreenType(
            context: context,
            mobile: 1,
            tablet: 2,
            desktop: 3,
          ),
          crossAxisSpacing: getValueForScreenType(
            context: context,
            mobile: 15,
            tablet: 20,
          ),
          mainAxisSpacing: getValueForScreenType(
            context: context,
            mobile: 15,
            tablet: 20,
          ),
          childAspectRatio: getValueForScreenType(
            context: context,
            mobile: 2.2,
            tablet: 2.5,
          ),
        ),
        shrinkWrap: true,
        itemCount: (state.data?.methodologies ?? []).length,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          SectionHeader? data = state.data?.methodologies?[index];
          return positionedWidget(
            context,
            data?.header ?? '',
            data?.content ?? '',
          );
        },
      ),
    );
  }

  Widget loopMobileWidget(
    BuildContext context,
    MethodologyState state,
  ) {
    double centerOfTheVideoPlayer = Constants.desktopBreakPoint / 2;
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: 350,
              width: Constants.desktopBreakPoint,
              child: VideoPlayerWidget(
                videoUrl: state.data?.bgImg ?? '',
                secondaryVideoUrl: state.data?.secondaryVideoUrl ?? '',
                placeholderWidget: Container(),
                fit: BoxFit.fitHeight,
              ),
            ),
            //!-------------(text 1(left))

            Positioned(
              top: 160,
              left: centerOfTheVideoPlayer - 110,
              child: SizedBox(
                child: kStyle.bold(
                  text: state.data?.imgOverlayText1 ?? '',
                  color: AppColors.white,
                  size: 16,
                  overflow: TextOverflow.visible,
                  textAlign: TextAlign.start,
                ),
              ),
            ),
            //!-------------(text 2(right))
            Positioned(
              top: 160,
              right: centerOfTheVideoPlayer - 110,
              child: SizedBox(
                child: kStyle.bold(
                  text: state.data?.imgOverlayText2 ?? '',
                  color: AppColors.white,
                  size: 16,
                  overflow: TextOverflow.visible,
                  textAlign: TextAlign.end,
                ),
              ),
            ),
          ],
        ),
        Gap(20),
        gridWidget(context, state),
      ],
    );
  }
}

Widget positionedWidget(
  BuildContext context,
  String heading,
  String description,
) {
  return HoverView(
    builder: (isHover) {
      return AnimatedContainer(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        width: getValueForScreenType(
          context: context,
          mobile: Constants.width * .9,
          tablet: Constants.width * .45,
          desktop: isHover ? 290 : 270,
        ),
        height: getValueForScreenType(
          context: context,
          mobile: 110,
          tablet: 110,
          desktop: 130,
        ),
        decoration: BoxDecoration(
          color: AppColors.blue,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: getValueForScreenType(
            context: context,
            mobile: 10,
            tablet: 10,
            desktop: isHover ? 15 : 10,
          ),
          vertical: getValueForScreenType(
            context: context,
            mobile: 10,
            tablet: 10,
            desktop: isHover ? 10 : 5,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: getValueForScreenType(
            context: context,
            mobile: CrossAxisAlignment.start,
            tablet: CrossAxisAlignment.start,
            desktop: CrossAxisAlignment.center,
          ),
          children: [
            kStyle.med(
              text: heading,
              size: 18,
              color: AppColors.orange,
              overflow: TextOverflow.visible,
              textAlign: TextAlign.center,
            ),
            Gap(10),
            kStyle.reg(
              text: description,
              size: getValueForScreenType(
                context: context,
                mobile: 14,
                tablet: 16,
                desktop: isHover ? 16 : 14,
              ),
              color: AppColors.white,
              overflow: TextOverflow.ellipsis,
              textAlign: getValueForScreenType(
                context: context,
                mobile: TextAlign.left,
                tablet: TextAlign.left,
                desktop: TextAlign.center,
              ),
              maxLines: 3,
            ),
          ],
        ),
      );
    },
  );
}
