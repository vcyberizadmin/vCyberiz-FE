import 'package:chewie/chewie.dart';

abstract class VideoPlayerState {
  const VideoPlayerState();
}

class VideoPlayerInitial extends VideoPlayerState {
  const VideoPlayerInitial();
}

class VideoPlayerLoading extends VideoPlayerState {
  const VideoPlayerLoading();
}

class VideoPlayerReady extends VideoPlayerState {
  final ChewieController chewieController;

  const VideoPlayerReady(this.chewieController);
}

class VideoPlayerError extends VideoPlayerState {
  final String error;

  const VideoPlayerError(this.error);
}
