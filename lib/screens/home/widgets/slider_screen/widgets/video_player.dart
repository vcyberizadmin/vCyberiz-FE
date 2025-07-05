import 'dart:html' as html;
import 'package:chewie/chewie.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:vcyberiz/bloc/video_player_bloc/video_player_bloc.dart';
import 'package:vcyberiz/bloc/video_player_bloc/video_player_event.dart';
import 'package:vcyberiz/bloc/video_player_bloc/video_player_state.dart';
import 'package:vcyberiz/core/utils/constants/constants.dart';

class VideoPlayerWidget extends StatefulWidget {
  final String videoUrl;
  final BoxFit fit;
  final Widget? placeholderWidget;

  const VideoPlayerWidget({
    required this.videoUrl,
    this.fit = BoxFit.cover,
    this.placeholderWidget,
    super.key,
  });

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  @override
  void initState() {
    super.initState();

    // Disable PiP in web browsers (like Safari)
    if (kIsWeb) {
      Future.delayed(const Duration(milliseconds: 500), () {
        final videoElements = html.document.getElementsByTagName('video');
        for (final video in videoElements) {
          final v = video as html.VideoElement;
          v.setAttribute('disablePictureInPicture', '');
          v.setAttribute(
              'controlsList', 'nodownload nofullscreen noremoteplayback');
          v.controls = false;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VideoPlayerBloc()
        ..add(
          InitializeSliderVideoPlayer(
            videoUrl: (dotenv.env[Constants.baseURL] ?? "") + widget.videoUrl,
            autoPlay: true,
            looping: true,
            showControls: false,
          ),
        ),
      child: BlocBuilder<VideoPlayerBloc, VideoPlayerState>(
        builder: (context, state) {
          return switch (state) {
            VideoPlayerInitial() => widget.placeholderWidget ?? Container(),
            VideoPlayerLoading() => widget.placeholderWidget ?? const Center(),
            VideoPlayerReady(chewieController: final controller) =>
              SizedBox.expand(
                child: FittedBox(
                  fit: widget.fit,
                  child: SizedBox(
                    width: controller.videoPlayerController.value.size.width,
                    height: controller.videoPlayerController.value.size.height,
                    child: Chewie(controller: controller),
                  ),
                ),
              ),
            VideoPlayerError() => Center(
                child: Text('Error: ${state.error}'),
              ),
            Object() => throw UnimplementedError(),
          };
        },
      ),
    );
  }
}
