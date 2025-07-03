// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:vcyberiz/core/utils/global_widgets/custom_button_widget.dart';
import 'package:vcyberiz/data/model/banner-info-model/banner_info_model.dart';
import 'package:vcyberiz/routes/route_constants.dart';

import '../../../../bloc/slider_bloc/slider_bloc.dart';
import '../../../../bloc/slider_bloc/slider_event.dart';
import '../../../../bloc/slider_bloc/slider_state.dart';
import '../../../../core/utils/config/config.dart';
import '../../../../core/utils/constants/constants.dart';
import '../../../../core/utils/styles/app_colors.dart';
import 'widgets/news_widget.dart';
import 'widgets/video_player.dart';

class SliderWidget extends StatefulWidget {
  const SliderWidget({
    super.key,
  });

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  final CarouselSliderController controller = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SliderBloc, SliderState>(builder: (context, state) {
      if (state.data == null) {
        return SizedBox();
      }

      return Container(
        decoration: BoxDecoration(
          color: AppColors.blue,
        ),
        width: Constants.width,
        child: Center(
          child: SizedBox(
            width: getValueForScreenType(
              context: context,
              mobile: Constants.width,
              tablet: Constants.width,
              desktop: Constants.desktopBreakPoint + 100,
            ),
            child: BlocBuilder<SliderBloc, SliderState>(
              builder: (context, state) {
                return Column(
                  children: [
                    Stack(
                      children: [
                        carouselSliderWidget(
                          context,
                          state.data!,
                        ),
                        if (getDeviceType(MediaQuery.of(context).size) ==
                            DeviceScreenType.desktop)
                          Positioned(
                            right: getValueForScreenType(
                              context: context,
                              mobile: 0,
                              tablet: 0,
                              desktop: 50,
                            ),
                            left: 50,
                            top: 0,
                            bottom: 0,
                            child: slideIndicatorWidget(
                              state.data?.data?.carousel?.length ?? 0,
                              state.sliderIndex,
                            ),
                          )
                        else
                          Positioned(
                            bottom: getValueForScreenType(
                              context: context,
                              mobile: 50,
                              tablet: 50,
                            ),
                            left: 0,
                            right: 0,
                            child: slideIndicatorWidget(
                              state.data?.data?.carousel?.length ?? 0,
                              state.sliderIndex,
                            ),
                          ),
                      ],
                    ),
                    NewsWidget(),
                  ],
                );
              },
            ),
          ),
        ),
      );
    });
  }

  Widget carouselSliderWidget(
    BuildContext context,
    BannerInfoModel data,
  ) {
    return CarouselSlider.builder(
      carouselController: controller,
      itemCount: data.data?.carousel?.length ?? 0,
      options: CarouselOptions(
        viewportFraction: 1.0,
        height: getValueForScreenType(
          context: context,
          mobile: 500,
          tablet: 600,
          desktop: 800,
        ),
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 10),
        enlargeCenterPage: false,
        scrollDirection: Axis.horizontal,
        scrollPhysics: NeverScrollableScrollPhysics(),
        onPageChanged: (index, reason) {
          context.read<SliderBloc>().add(
                SliderChanged(
                  sliderIndex: index,
                ),
              );
        },
      ),
      itemBuilder: (context, index, realIdx) {
        return SizedBox(
          width: Constants.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Stack(
                  children: [
                    VideoPlayerWidget(
                      videoUrl: data.data?.carousel?[index].videoUrl ?? '',
                      fit: getValueForScreenType(
                        context: context,
                        mobile: BoxFit.fitHeight,
                        tablet: BoxFit.fill,
                        desktop: BoxFit.fill,
                      ),
                    ),
                    _carouselContent(context, data, index),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

//Carousel content widgets
  Widget _carouselContent(
      BuildContext context, BannerInfoModel data, int index) {
    return Center(
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 600),
        switchInCurve: Curves.easeInOut,
        switchOutCurve: Curves.easeInOut,
        transitionBuilder: (Widget child, Animation<double> animation) {
          final slide = Tween<Offset>(
            begin: const Offset(0.0, 0.1),
            end: Offset.zero,
          ).animate(animation);

          return FadeTransition(
            opacity: animation,
            child: SlideTransition(position: slide, child: child),
          );
        },
        child: Container(
          key: ValueKey(index), // Important for switch animation
          width: getValueForScreenType<double>(
            context: context,
            mobile: Constants.width * .92,
            tablet: Constants.width * .92,
            desktop: Constants.desktopBreakPoint - 100,
          ),
          child: Padding(
            padding: EdgeInsets.only(
              top: getValueForScreenType<double>(
                context: context,
                mobile: 50,
                tablet: 0,
                desktop: 0,
              ),
            ),
            child: Column(
              mainAxisAlignment: getValueForScreenType(
                context: context,
                mobile: MainAxisAlignment.start,
                tablet: MainAxisAlignment.center,
                desktop: MainAxisAlignment.center,
              ),
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(getValueForScreenType<double>(
                  context: context,
                  mobile: 10,
                  tablet: 0,
                  desktop: 30,
                )),
                Container(
                  width: getValueForScreenType<double>(
                    context: context,
                    mobile: double.infinity,
                    tablet: Constants.width * .7,
                    desktop: Constants.desktopBreakPoint * .5,
                  ),
                  child: kStyle.bold(
                    text: data.data?.carousel?[index].heading ?? "",
                    color: AppColors.white,
                    size: getValueForScreenType<double>(
                      context: context,
                      mobile: 30,
                      tablet: 30,
                      desktop: 50,
                    ),
                    height: 1.2,
                  ),
                ),
                Gap(getValueForScreenType<double>(
                  context: context,
                  mobile: 15,
                  tablet: 10,
                  desktop: 15,
                )),
                SizedBox(
                  width: getValueForScreenType<double>(
                    context: context,
                    mobile: double.infinity,
                    tablet: Constants.width * .7,
                    desktop: Constants.desktopBreakPoint * .5,
                  ),
                  child: kStyle.reg(
                    text: data.data?.carousel?[index].description ?? "",
                    color: AppColors.white,
                    overflow: TextOverflow.visible,
                    size: getValueForScreenType(
                      context: context,
                      mobile: 16,
                      tablet: 18,
                      desktop: 20,
                    ),
                  ),
                ),
                Gap(getValueForScreenType(
                  context: context,
                  mobile: 20,
                  tablet: 20,
                  desktop: 20,
                )),
                Row(
                  children: [
                    CustomButtonWidget(
                      textSize: 14,
                      buttonHeight: 35,
                      text: data.data?.carousel?[index].buttonLabel ?? "",
                      onTap: () {
                        context.goNamed(RouteConstants.servicesPath);
                      },
                    )
                  ],
                ),
                Gap(getValueForScreenType<double>(
                  context: context,
                  mobile: 10,
                  tablet: 20,
                  desktop: 140,
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget slideIndicatorWidget(int carouselLength, int sliderIndex) {
    final dotSize = 10.0;
    final spacing = 30.0;

    return Container(
      height: getValueForScreenType(
        context: context,
        mobile: 400,
        tablet: 500,
        desktop: carouselLength * spacing,
      ),
      width: getValueForScreenType<double>(
        context: context,
        mobile: Constants.width * .95,
        tablet: Constants.width * .92,
        desktop: Constants.desktopBreakPoint,
      ),
      child:
          getDeviceType(MediaQuery.of(context).size) == DeviceScreenType.desktop
              ? Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 100),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(carouselLength, (index) {
                        final isActive = index == sliderIndex;

                        return InkWell(
                          onTap: () {
                            controller.animateToPage(index);
                            context.read<SliderBloc>().add(
                                  SliderChanged(sliderIndex: index),
                                );
                          },
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 600),
                            curve: Curves.easeInOut,
                            margin: EdgeInsets.symmetric(vertical: 8),
                            height: isActive ? dotSize + 4 : dotSize,
                            width: isActive ? dotSize + 4 : dotSize,
                            decoration: BoxDecoration(
                              color: isActive
                                  ? AppColors.orangeTextColor
                                  : AppColors.backGroundColor,
                              shape: BoxShape.circle,
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(carouselLength, (index) {
                    final isActive = index == sliderIndex;

                    return InkWell(
                      onTap: () {
                        controller.animateToPage(index);
                        context.read<SliderBloc>().add(
                              SliderChanged(sliderIndex: index),
                            );
                      },
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 600),
                        curve: Curves.easeInOut,
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        height: isActive ? dotSize + 4 : dotSize,
                        width: isActive ? dotSize + 4 : dotSize,
                        decoration: BoxDecoration(
                          color: isActive
                              ? AppColors.orangeTextColor
                              : AppColors.backGroundColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                    );
                  }),
                ),
    );
  }
}
