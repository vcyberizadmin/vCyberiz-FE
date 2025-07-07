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

class CardVideoPlayerWidget extends StatefulWidget {
  final String videoUrl;
  final String secondaryVideoUrl;
  final BoxFit fit;
  final Widget? placeholderWidget;

  const CardVideoPlayerWidget({
    required this.videoUrl,
    required this.secondaryVideoUrl,
    this.fit = BoxFit.cover,
    this.placeholderWidget,
    super.key,
  });

  @override
  State<CardVideoPlayerWidget> createState() => _CardVideoPlayerWidgetState();
}

class _CardVideoPlayerWidgetState extends State<CardVideoPlayerWidget> {
  late final VideoPlayerBloc _bloc;
  String? _finalVideoUrl;
  bool _isReady = false;

  @override
  void initState() {
    super.initState();
    _bloc = VideoPlayerBloc();
    _initVideo();

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

  Future<void> _initVideo() async {
    final base = dotenv.env[Constants.assetBaseURL] ?? '';
    bool isSafari = false;

    try {
      final deviceInfo = DeviceInfoPlugin();
      final webInfo = await deviceInfo.webBrowserInfo;
      isSafari = webInfo.browserName.name.toLowerCase() == 'safari';
    } catch (_) {
      isSafari = false;
    }

    _finalVideoUrl =
        base + (isSafari ? widget.secondaryVideoUrl : widget.videoUrl);

    _bloc.add(
      InitializeApproachCardBgVideoPlayer(
        videoUrl: _finalVideoUrl!,
        autoPlay: true,
        looping: true,
        showControls: false,
      ),
    );

    if (mounted) {
      setState(() {
        _isReady = true;
      });
    }
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_isReady) {
      return widget.placeholderWidget ?? const Center();
    }

    return BlocProvider.value(
      value: _bloc,
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
