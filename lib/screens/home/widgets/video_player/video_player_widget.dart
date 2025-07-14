// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:vcyberiz/core/utils/constants/constants.dart';

import '../../../../bloc/home_video_bloc/home_video_bloc.dart';
import '../../../../core/utils/styles/app_colors.dart';
import 'widget/video_player.dart';

class VideoWidget extends StatefulWidget {
  const VideoWidget({super.key});

  @override
  State<VideoWidget> createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  @override
  Widget build(BuildContext context) {
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   context.read<HomeVideoBloc>().add(const GetVideoDataEvent());
    // });

    return BlocBuilder<HomeVideoBloc, HomeVideoState>(
      builder: (context, state) {
        return Container(
          width: Constants.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: AppColors.blueGradiant,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Center(
            child: state.loading
                ? const SizedBox()
                : SizedBox(
                    width: getValueForScreenType(
                      context: context,
                      mobile: Constants.width,
                      tablet: Constants.width,
                      desktop: Constants.desktopBreakPoint + 100,
                    ),
                    height: getValueForScreenType(
                      context: context,
                      mobile: 300,
                      tablet: 500,
                      desktop: 800,
                    ),
                    child: VideoPlayerWidget(
                      videoUrl: state.data?.videoUrl ?? "",
                      newVideoUrl: state.data?.secondaryVideoUrl ?? "",
                      fit: BoxFit.fill,
                    ),
                  ),
          ),
        );
      },
    );
  }
}
