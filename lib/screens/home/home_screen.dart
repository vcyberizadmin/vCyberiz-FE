// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vcyberiz/bloc/about_us_bloc/about_us_bloc.dart';
import 'package:vcyberiz/bloc/blogs_bloc/blogs_bloc.dart';
import 'package:vcyberiz/bloc/home-bloc/home_bloc.dart';
import 'package:vcyberiz/bloc/home-bloc/home_event.dart';
import 'package:vcyberiz/bloc/home_video_bloc/home_video_bloc.dart';
import 'package:vcyberiz/bloc/methodology_bloc/methodology_bloc.dart';
import 'package:vcyberiz/bloc/news_bloc/news_bloc.dart';
import 'package:vcyberiz/bloc/our_approach_bloc/our_approach_bloc.dart';
import 'package:vcyberiz/bloc/our_service_bloc/our_service_bloc.dart';
import 'package:vcyberiz/bloc/our_solutions_bloc/our_solutions_bloc.dart';
import 'package:vcyberiz/bloc/slider_bloc/slider_bloc.dart';
import 'package:vcyberiz/bloc/slider_bloc/slider_event.dart';
import 'package:vcyberiz/bloc/what_we_do_bloc/what_we_do_bloc.dart';
import 'package:vcyberiz/bloc/why_work_with_us_bloc.dart/why_work_with_us_bloc.dart';
import 'package:vcyberiz/core/utils/constants/constants.dart';
import 'package:vcyberiz/screens/base_view/base_view.dart';
import 'package:vcyberiz/screens/home/widgets/our-solution/our_solutions_widget.dart';
import 'package:vcyberiz/screens/home/widgets/slider_screen/slider_widget.dart';
import 'package:vcyberiz/screens/home/widgets/why_work_with_us/why_work_with_us_widget.dart';

import '../../bloc/home-bloc/home_state.dart';
import '../base_view/widget/footer/footer_screen.dart';
import 'widgets/blogs/blogs_widget.dart';
import 'widgets/methodology_screen/methodology_widget.dart';
import 'widgets/our_approach/our_approach_widget.dart';
import 'widgets/our_services/our_service_screen.dart';
import 'widgets/video_player/video_player_widget.dart';
import 'widgets/what_we_do/what_we_do_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  bool isFirstOpen = false;

  @override
  initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HomeBloc>().add(GetSectionsEvent());
      context.read<SliderBloc>().add(GetBannerInfoSectionEvent());
      context.read<MethodologyBloc>().add(const GetMethodologyDataEvent());
      context.read<HomeVideoBloc>().add(const GetVideoDataEvent());
      context.read<WhatWeDoBloc>().add(const GetWhatWeDoDataEvent());
      context.read<AboutUsBloc>().add(const GetAboutUsDataEvent());
      context.read<OurSolutionsBloc>().add(const GetOurSolutionsDataEvent());
      context.read<BlogsBloc>().add(const GetBlogsDataEvent());
      context.read<BlogsBloc>().add(const GetBlogsListEvent());
      context.read<NewsBloc>().add(const GetNewsListEvent());
      context.read<OurApproachBloc>().add(const GetOurApproachDataEvent());
      context.read<WhyWorkWithUsBloc>().add(const GetWhyWorkUsDataEvent());
      context.read<OurServiceBloc>().add(const GetOurServiceDataEvent());
    });

    // Add a listener to the scroll controller
    _scrollController.addListener(() {
      final isVisible = _scrollController.offset <= 70;
      if (isVisible) {
        context.read<HomeBloc>().add(ToggleIsTopContainerVisible(true));
      } else {
        context.read<HomeBloc>().add(ToggleIsTopContainerVisible(false));
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Constants.height = MediaQuery.of(context).size.height;
    Constants.width = MediaQuery.of(context).size.width;

    Constants.videoBreakPoint = MediaQuery.of(context).size.width > 1600
        ? 1500
        : MediaQuery.of(context).size.width;

    return BaseView(
      child: SizedBox(
        width: Constants.width,
        child: Center(
          child: BlocConsumer<HomeBloc, HomeState>(
            listener: (context, state) {
              // SharedPreferences prefs = await SharedPreferences.getInstance();
              // isFirstOpen = prefs.getBool('isFirstOpen') ?? true;
              //   if (isFirstOpen) {
              //     showDialog(
              //       context: context,
              //       builder: (BuildContext context) {
              //         return AlertDialog(
              //           shape: RoundedRectangleBorder(
              //             borderRadius: BorderRadius.circular(5.0),
              //           ),
              //           contentPadding:
              //               EdgeInsets.zero, // Removes any default padding
              //           content: SizedBox(
              //             height: 220,
              //             width: 400,
              //             child: PopUpWidget(),
              //           ),
              //         );
              //       },
              //     );
              //   }
            },
            builder: (context, state) {
              return CustomScrollView(
                controller: _scrollController,
                slivers: [
                  SliverList.builder(
                    itemCount: state.data?.sections?.length ?? 0,
                    itemBuilder: (context, index) {
                      return _buildWidgetForSlug(
                        state.data?.sections?[index].slug ?? '',
                      );
                    },
                  ),
                  SliverToBoxAdapter(
                    child: FooterScreen(),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildWidgetForSlug(String slug) {
    switch (slug) {
      case "banner":
        return SliderWidget();
      case "what-we-do":
        return WhatWeDoWidget();
      case "our-approach":
        return OurApproachWidget();
      case "service":
        return OurServicesWidget();
      case "our-solution":
        return OurSolutionWidget();
      case "video-section":
        return VideoWidget();
      case "methodology":
        return MethodologyWidget();
      case "why-work-with-us":
        return WhyWorkWithUsWidget();
      case "blog":
        return BlogsWidget();
      default:
        return SizedBox();
    }
  }
}
