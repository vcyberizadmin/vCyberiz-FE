// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:vcyberiz/core/utils/styles/app_colors.dart';

import '../../../../bloc/our_approach_bloc/our_approach_bloc.dart';
import '../../../../core/utils/config/config.dart';
import '../../../../core/utils/constants/constants.dart';
import '../../../../core/utils/styles/font_constants.dart';
import '../../../../data/model/our_approach_model/our_approach_model.dart';
import 'widget/video_player2.dart';

class OurApproachWidget extends StatefulWidget {
  const OurApproachWidget({super.key});

  @override
  State<OurApproachWidget> createState() => _OurApproachWidgetState();
}

class _OurApproachWidgetState extends State<OurApproachWidget> {
  int currentIndex = 0;

  double heightIncrement = 10; // Increment for each previous index
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {});
  }

  @override
  void dispose() {
    _scrollController.dispose(); // Clean up the controller
    super.dispose();
  }

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
      child: Center(
        child: SizedBox(
          width: getValueForScreenType(
            context: context,
            mobile: Constants.width,
            tablet: Constants.width,
            desktop: Constants.desktopBreakPoint,
          ),
          child: BlocBuilder<OurApproachBloc, OurApproachState>(
            builder: (context, state) {
              if (state.loading) {
                return SizedBox();
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Gap(30),
                  //!--------------------- Title Section

                  kStyle.med(
                    text: state.data?.approachHeader?.content ?? '',
                    size: getValueForScreenType(
                      context: context,
                      mobile: 25,
                      tablet: 30,
                      desktop: 35,
                    ),
                    color: AppColors.primary,
                    overflow: TextOverflow.visible,
                    textAlign: TextAlign.center,
                  ),

                  const Gap(20),

                  Gap(20),

                  //!--------------------- DIRECT Section
                  headingBoxWidget(state),
                  Gap(30),

                  headingListWidget(state),
                  Gap(10),

                  //!--------------------- (Container 1)
                  containerWidget1(state, currentIndex, heightIncrement),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget headingBoxWidget(
    OurApproachState state,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 50,
          child: Center(
            child: ListView.builder(
                itemCount: state.data?.cardList?.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  CardList? data = state.data?.cardList?[index];
                  return InkWell(
                    onTap: () {
                      setState(() {
                        currentIndex = (index) % 6;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 3,
                      ),
                      child: Container(
                        width: getValueForScreenType(
                          context: context,
                          mobile: 35,
                          tablet: 40,
                          desktop: 40,
                        ),
                        padding: const EdgeInsets.symmetric(
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.white20,
                          border: Border.all(
                              color: currentIndex == index
                                  ? AppColors.orangeTextColor
                                  : AppColors.transparent,
                              width: 1),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Center(
                          child: kStyle.bold(
                            text: data?.highlightText ?? '',
                            color: currentIndex == index
                                ? AppColors.orangeTextColor
                                : AppColors.white,
                            size: getValueForScreenType(
                              context: context,
                              mobile: 20,
                              tablet: 20,
                              desktop: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ),
      ],
    );
  }

  Widget headingListWidget(
    OurApproachState state,
  ) {
    final isMobile = getValueForScreenType<bool>(
      context: context,
      mobile: true,
      tablet: false,
      desktop: false,
    );
    if (isMobile) {
      final items = state.data?.cardNavs ?? [];
      final mainItems = items.length > 1 ? items.sublist(0, items.length) : [];

      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Wrap(
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 4,
            children: [
              for (int i = 0; i < mainItems.length; i++) ...[
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: mainItems[i].title![0],
                        style: TextStyle(
                          fontFamily: Constants.font,
                          color: AppColors.orangeTextColor,
                          fontWeight: FontConst().semiBoldFont,
                          fontSize: 16,
                        ),
                      ),
                      TextSpan(
                        text: mainItems[i].title!.substring(1),
                        style: TextStyle(
                          fontFamily: Constants.font,
                          color: AppColors.white,
                          fontWeight: FontConst().semiBoldFont,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
                if (i != mainItems.length - 1)
                  const Text(
                    "|",
                    style: TextStyle(color: Colors.white),
                  ),
              ],
            ],
          ),
        ],
      );
    }
    return SizedBox(
      height: getValueForScreenType<double>(
        context: context,
        mobile: 25,
        tablet: 35,
        desktop: 45,
      ),
      child: Center(
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: state.data?.cardNavs?.length,
            itemBuilder: (context, index) {
              CardNav? data = state.data?.cardNavs?[index];
              return Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: getValueForScreenType<double>(
                    context: context,
                    mobile: 2,
                    tablet: 5,
                    desktop: 5,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text.rich(
                      textAlign: TextAlign.center,
                      TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: data?.title![0],
                            style: TextStyle(
                              fontFamily: Constants.font,
                              fontSize: getValueForScreenType<double>(
                                context: context,
                                mobile: 18,
                                tablet: 30,
                                desktop: 35,
                              ),
                              color: AppColors.orangeTextColor,
                              fontWeight: FontConst().semiBoldFont,
                            ),
                          ),
                          TextSpan(
                            text: data?.title!.substring(1),
                            style: TextStyle(
                              fontFamily: Constants.font,
                              fontSize: getValueForScreenType<double>(
                                context: context,
                                mobile: 15,
                                tablet: 20,
                                desktop: 25,
                              ),
                              color: AppColors.white,
                              fontWeight: FontConst().semiBoldFont,
                              overflow: TextOverflow.visible,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Gap(
                      getValueForScreenType<double>(
                        context: context,
                        mobile: 2,
                        tablet: 10,
                        desktop: 10,
                      ),
                    ),
                    if ((index + 1) < (state.data?.cardNavs?.length ?? 0))
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          width: 2,
                          height: getValueForScreenType<double>(
                            context: context,
                            mobile: 20,
                            tablet: 20,
                            desktop: 30,
                          ),
                          color: AppColors.white,
                        ),
                      ),
                  ],
                ),
              );
            }),
      ),
    );
  }

  List<int> items =
      List.generate(20, (index) => index); // Initial list of items
  double lastScrollOffset = 0;
  final double scrollThreshold = 250; // Threshold to change index

  Widget containerWidget1(
    OurApproachState state,
    int index,
    double heightIncrement,
  ) {
    final debouncer = Debouncer(Duration(milliseconds: 250));
    return Container(
      height: getValueForScreenType<double>(
        context: context,
        mobile: 300,
        tablet: 350,
        desktop: 420,
      ),
      width: getValueForScreenType<double>(
        context: context,
        mobile: Constants.width * .95,
        tablet: Constants.width * .95,
        desktop: Constants.desktopBreakPoint,
      ),
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Container(
            alignment: Alignment.center,
            height: getValueForScreenType<double>(
              context: context,
              mobile: 300,
              tablet: 350,
              desktop: 420,
            ),
            width: getValueForScreenType<double>(
              context: context,
              mobile: Constants.width * .92,
              tablet: Constants.width * .92,
              desktop: Constants.desktopBreakPoint * .55,
            ),
            child: Stack(
              children: [
                Container(
                  height: 420,
                  child: containerWidget(
                    state,
                    currentIndex,
                    heightIncrement,
                  ),
                ),
                if (currentIndex < 5)
                  Positioned(
                    bottom: getValueForScreenType<double>(
                      context: context,
                      mobile: -250,
                      tablet: -300,
                      desktop: -250,
                    ),
                    left: getValueForScreenType<double>(
                      context: context,
                      mobile: 0,
                      tablet: 5,
                      desktop: 20,
                    ),
                    right: getValueForScreenType<double>(
                      context: context,
                      mobile: 0,
                      tablet: 5,
                      desktop: 20,
                    ),
                    child: stackWidget(
                      highlightData: state.data?.cardList?[currentIndex + 1]
                              .highlightText ??
                          '',
                      headerData: state.data?.cardList?[currentIndex + 1].title
                              ?.substring(1) ??
                          '',
                      description:
                          state.data?.cardList?[currentIndex + 1].description ??
                              '',
                      imageUrl: state.data?.cardList?[currentIndex + 1]
                              .approachCard?.first.url ??
                          '',
                      height: getValueForScreenType(
                            context: context,
                            mobile: 200,
                            tablet: 270,
                            desktop: 270,
                          ) +
                          ((index - currentIndex + 1) * heightIncrement),
                      showMobilePadding: true,
                      state: state,
                    ),
                  ),
              ],
            ),
          ),
          Container(
            color: AppColors.transparent,
            child: NotificationListener<UserScrollNotification>(
              onNotification: (notification) {
                if (notification.direction == ScrollDirection.reverse) {
                  debouncer.run(() {
                    setState(() {
                      if (currentIndex < 5) {
                        currentIndex++;
                      }
                    });
                  });
                } else if (notification.direction == ScrollDirection.forward) {
                  debouncer.run(() {
                    setState(() {
                      if (currentIndex > 0) {
                        currentIndex--;
                      }
                    });
                  });
                }
                return true;
              },
              child: ListView.builder(
                controller: _scrollController,
                itemCount: state.data?.cardList?.length ?? 0,
                itemBuilder: (context, index) {
                  return Container(
                    height: getValueForScreenType(
                      context: context,
                      mobile: 200,
                      tablet: 250,
                      desktop: 300,
                    ), // Fixed height for each container
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    decoration: BoxDecoration(
                      color: AppColors.transparent,
                      borderRadius: BorderRadius.circular(16),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget containerWidget(
    OurApproachState state,
    int index,
    double heightIncrement,
  ) {
    return Container(
      alignment: Alignment.center,
      height: getValueForScreenType<double>(
        context: context,
        mobile: 300,
        tablet: 350,
        desktop: 400,
      ),
      width: getValueForScreenType<double>(
        context: context,
        mobile: Constants.width * .95,
        tablet: Constants.width * .95,
        desktop: Constants.width * .65,
      ),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          for (int i = 0; i < (state.data?.cardList?.length ?? 0); i++)
            AnimatedPositioned(
              duration: Duration(
                milliseconds: 800,
              ),
              curve: Curves.easeInOut, // Animation curve
              bottom: index >= i
                  ? (i * -10.0) <= 0
                      ? 50
                      : (i * -5.0) // Adjust stacking position
                  : -270,

              child: Transform.scale(
                scale: index == i ? 0.9 : 0.899, // Scale effect
                child: stackWidget(
                  highlightData: state.data?.cardList?[i].highlightText ?? '',
                  headerData:
                      state.data?.cardList?[i].title?.substring(1) ?? '',
                  description: state.data?.cardList?[i].description ?? '',
                  imageUrl:
                      state.data?.cardList?[i].approachCard?.first.url ?? '',
                  height: getValueForScreenType(
                        context: context,
                        mobile: 200,
                        tablet: 250,
                        desktop: 290,
                      ) +
                      ((index - i) * heightIncrement),
                  showMobilePadding: true,
                  state: state,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget stackWidget({
    required String highlightData,
    required String headerData,
    required String description,
    required String imageUrl,
    required double height,
    required bool showMobilePadding,
    required OurApproachState state,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getValueForScreenType(
          context: context,
          mobile: 0,
          tablet: 30,
          desktop: 20,
        ),
      ),
      child: Container(
        height: height,
        decoration: BoxDecoration(
          color: AppColors.blue,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: AppColors.darkOrangeBorderColor,
            width: .5,
          ),
        ),
        child: Stack(
          children: [
            Container(
              height: height,
              width: getValueForScreenType(
                context: context,
                mobile: Constants.width,
                tablet: Constants.width * .95,
                desktop: Constants.desktopBreakPoint * .55,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: CardVideoPlayerWidget(
                  videoUrl: "/data/uploads/video/videos/DIRECT-BG-video.av1",
                  secondaryVideoUrl:
                      "/data/uploads/Homepage/videos/MP4/DIRECT BG video.mp4",
                  placeholderWidget: Container(),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: getValueForScreenType(
                      context: context,
                      mobile: 20,
                      tablet: 40,
                      desktop: 40,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 2,
                        child: SizedBox(
                          height: height,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text.rich(
                                TextSpan(
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: highlightData,
                                      style: TextStyle(
                                        fontFamily: Constants.font,
                                        fontSize: getValueForScreenType<double>(
                                          context: context,
                                          mobile: 20,
                                          tablet: 40,
                                          desktop: 45,
                                        ),
                                        color: AppColors.orangeTextColor,
                                        fontWeight: FontConst().boldFont,
                                      ),
                                    ),
                                    TextSpan(
                                      text: headerData,
                                      style: TextStyle(
                                          fontFamily: Constants.font,
                                          fontSize:
                                              getValueForScreenType<double>(
                                            context: context,
                                            mobile: 15,
                                            tablet: 30,
                                            desktop: 35,
                                          ),
                                          color: AppColors.white,
                                          fontWeight: FontConst().boldFont,
                                          overflow: TextOverflow.visible),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 10),
                              kStyle.reg(
                                  text: description,
                                  color: AppColors.white,
                                  overflow: TextOverflow.visible,
                                  size: getValueForScreenType<double>(
                                    context: context,
                                    mobile: 14,
                                    tablet: 18,
                                    desktop: 20,
                                  )),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: SvgPicture.network(
                          (dotenv.env[Constants.assetBaseURL] ?? "") + imageUrl,
                          height: getValueForScreenType<double>(
                            context: context,
                            mobile: 100,
                            tablet: 100,
                            desktop: 120,
                          ),
                          width: getValueForScreenType<double>(
                            context: context,
                            mobile: 100,
                            tablet: 100,
                            desktop: 120,
                          ),
                        ),
                      )
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

class Debouncer {
  final Duration delay;
  Timer? _timer;

  Debouncer(this.delay);

  void run(VoidCallback action) {
    // Cancel the previous timer if it exists
    _timer?.cancel();
    // Start a new timer
    _timer = Timer(delay, action);
  }

  // Optional: Clean up when no longer needed
  void dispose() {
    _timer?.cancel();
    _timer = null;
  }
}
