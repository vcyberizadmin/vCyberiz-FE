import 'dart:html' as html;
import 'package:chewie/chewie.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:vcyberiz/bloc/video_player_bloc/video_player_bloc.dart';
import 'package:vcyberiz/bloc/video_player_bloc/video_player_event.dart';
import 'package:vcyberiz/bloc/video_player_bloc/video_player_state.dart';
import 'package:vcyberiz/core/utils/constants/constants.dart';

class KnowMoreVideo extends StatefulWidget {
  final String videoUrl;
  final String secondaryVideoUrl;
  final BoxFit fit;
  final Widget? placeholderWidget;

  const KnowMoreVideo({
    required this.videoUrl,
    required this.secondaryVideoUrl,
    this.fit = BoxFit.cover,
    this.placeholderWidget,
    super.key,
  });

  @override
  State<KnowMoreVideo> createState() => _KnowMoreVideoState();
}

class _KnowMoreVideoState extends State<KnowMoreVideo> {
  String? _finalVideoUrl;
  late final VideoPlayerBloc _videoBloc;

  @override
  void initState() {
    super.initState();
    _videoBloc = VideoPlayerBloc();
    _detectBrowserAndSetUrl();

    // Disable PiP for Safari
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

  Future<void> _detectBrowserAndSetUrl() async {
    final base = dotenv.env[Constants.assetBaseURL] ?? '';
    String finalUrl = widget.videoUrl;

    if (kIsWeb) {
      final deviceInfo = DeviceInfoPlugin();
      final webInfo = await deviceInfo.webBrowserInfo;
      if (webInfo.browserName.name.toLowerCase().contains('safari')) {
        finalUrl = widget.secondaryVideoUrl;
      }
    }

    _finalVideoUrl = base + finalUrl;

    _videoBloc.add(
      InitializeKnowMoreVideoPlayer(
        videoUrl: _finalVideoUrl!,
        autoPlay: true,
        looping: true,
        showControls: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
            VideoPlayerError() => Center(child: SizedBox()),
            Object() => const SizedBox.shrink(),
          };
        },
      ),
    );
  }

  @override
  void dispose() {
    _videoBloc.close();
    super.dispose();
  }
}
