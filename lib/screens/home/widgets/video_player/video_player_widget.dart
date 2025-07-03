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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HomeVideoBloc>().add(const GetVideoDataEvent());
    });

    return BlocBuilder<HomeVideoBloc, HomeVideoState>(
      builder: (context, state) {
        if (state.loading) {
          return const SizedBox();
        }
        return Container(
          width: Constants.width,
          height: getValueForScreenType(
            context: context,
            mobile: 200,
            tablet: 500,
            desktop: 800,
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: AppColors.blueGradiant,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Center(
            child: Container(
              width: getValueForScreenType(
                context: context,
                mobile: Constants.width,
                tablet: Constants.width,
                desktop: Constants.desktopBreakPoint + 100,
              ),
              child: VideoPlayerWidget(
                videoUrl: state.data?.videoUrl ?? "",
                fit: BoxFit.fill,
              ),
            ),
          ),
        );
      },
    );
  }
}
