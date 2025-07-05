abstract class VideoPlayerEvent {
  const VideoPlayerEvent();
}

class InitializeSliderVideoPlayer extends VideoPlayerEvent {
  final String videoUrl;
  final bool autoPlay;
  final bool looping;
  final bool showControls;

  const InitializeSliderVideoPlayer({
    required this.videoUrl,
    this.autoPlay = true,
    this.looping = true,
    this.showControls = false,
  });
}

class InitializeHomeVideoPlayer extends VideoPlayerEvent {
  final String videoUrl;
  final bool autoPlay;
  final bool looping;
  final bool showControls;

  const InitializeHomeVideoPlayer({
    required this.videoUrl,
    this.autoPlay = true,
    this.looping = true,
    this.showControls = false,
  });
}

class InitializeServiceVideoPlayer extends VideoPlayerEvent {
  final String videoUrl;
  final bool autoPlay;
  final bool looping;
  final bool showControls;

  const InitializeServiceVideoPlayer({
    required this.videoUrl,
    this.autoPlay = true,
    this.looping = true,
    this.showControls = false,
  });
}

class InitializeMethodologyVideoPlayer extends VideoPlayerEvent {
  final String videoUrl;
  final bool autoPlay;
  final bool looping;
  final bool showControls;

  const InitializeMethodologyVideoPlayer({
    required this.videoUrl,
    this.autoPlay = true,
    this.looping = true,
    this.showControls = false,
  });
}

class InitializeKnowMoreVideoPlayer extends VideoPlayerEvent {
  final String videoUrl;
  final bool autoPlay;
  final bool looping;
  final bool showControls;

  const InitializeKnowMoreVideoPlayer({
    required this.videoUrl,
    this.autoPlay = true,
    this.looping = true,
    this.showControls = false,
  });
}

class InitializeVisionVideoPlayer extends VideoPlayerEvent {
  final String videoUrl;
  final bool autoPlay;
  final bool looping;
  final bool showControls;

  const InitializeVisionVideoPlayer({
    required this.videoUrl,
    this.autoPlay = true,
    this.looping = true,
    this.showControls = false,
  });
}

class InitializeApproachCardBgVideoPlayer extends VideoPlayerEvent {
  final String videoUrl;
  final bool autoPlay;
  final bool looping;
  final bool showControls;

  const InitializeApproachCardBgVideoPlayer({
    required this.videoUrl,
    this.autoPlay = true,
    this.looping = true,
    this.showControls = false,
  });
}

class DisposeVideoPlayer extends VideoPlayerEvent {
  const DisposeVideoPlayer();
}
