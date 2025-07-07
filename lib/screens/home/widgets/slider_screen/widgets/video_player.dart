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
import 'package:vcyberiz/core/utils/global_widgets/check_browser.dart';

class VideoPlayerWidget extends StatefulWidget {
  final String videoUrl;
  final String newVideoUrl;
  final BoxFit fit;
  final Widget? placeholderWidget;

  const VideoPlayerWidget({
    required this.videoUrl,
    required this.newVideoUrl,
    this.fit = BoxFit.cover,
    this.placeholderWidget,
    super.key,
  });

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  String? _finalVideoUrl;
  late final VideoPlayerBloc _videoBloc;
  bool _isReadyToBuild = false;

  @override
  void initState() {
    super.initState();
    _videoBloc = VideoPlayerBloc();
    detectBrowserAndInitBloc();

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

  Future<void> detectBrowserAndInitBloc() async {
    final base = dotenv.env[Constants.assetBaseURL] ?? "";
    final isSafari = await checkBrowser();

    _finalVideoUrl = base + (isSafari ? widget.newVideoUrl : widget.videoUrl);

    _videoBloc.add(
      InitializeSliderVideoPlayer(
        videoUrl: _finalVideoUrl!,
        autoPlay: true,
        looping: true,
        showControls: false,
      ),
    );

    setState(() {
      _isReadyToBuild = true;
    });
  }

  @override
  void dispose() {
    _videoBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_isReadyToBuild) {
      return widget.placeholderWidget ?? const Center();
    }

    return BlocProvider.value(
      value: _videoBloc,
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
                child: SizedBox(),
              ),
            Object() => const SizedBox.shrink(),
          };
        },
      ),
    );
  }
}
