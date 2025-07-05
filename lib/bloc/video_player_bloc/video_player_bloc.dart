import 'package:chewie/chewie.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';

import 'video_player_event.dart';
import 'video_player_state.dart';

class VideoPlayerBloc extends Bloc<VideoPlayerEvent, VideoPlayerState> {
  VideoPlayerController? _sliderController;
  VideoPlayerController? _approachCardBgController;
  VideoPlayerController? _methodologyController;
  VideoPlayerController? _serviceController;
  VideoPlayerController? _knowMoreController;
  VideoPlayerController? _visionController;
  ChewieController? _chewieController;
  VideoPlayerController? _homeVideoController;
  ChewieController? _homeVideoChewieController;
  ChewieController? _sliderChewieController;
  ChewieController? _metodologyChewieController;
  ChewieController? _approachCardBgChewieController;
  ChewieController? _serviceChewieController;
  ChewieController? _visionChewieController;
  ChewieController? _knowMoreChewieController;
  VideoPlayerBloc() : super(const VideoPlayerInitial()) {
    on<InitializeSliderVideoPlayer>(_onInitializeVideoPlayer);
    on<InitializeHomeVideoPlayer>(_onInitializeHomeVideoPlayer);
    on<InitializeApproachCardBgVideoPlayer>(_onInitializeApproachCardBgPlayer);
    on<InitializeMethodologyVideoPlayer>(_onInitializeMethodologyPlayer);
    on<InitializeServiceVideoPlayer>(_onInitializeServicePlayer);
    on<DisposeVideoPlayer>(_onDisposeVideoPlayer);
    on<InitializeKnowMoreVideoPlayer>(_onInitializeknowMorePlayer);
    on<InitializeVisionVideoPlayer>(_onInitializeVisionPlayer);
  }

  Future<void> _onInitializeVideoPlayer(
    InitializeSliderVideoPlayer event,
    Emitter<VideoPlayerState> emit,
  ) async {
    try {
      emit(const VideoPlayerLoading());

      // Dispose existing controllers if any
      await _disposeControllers();

      // Initialize new video controller
      _sliderController = VideoPlayerController.networkUrl(
        Uri.parse(event.videoUrl),
      );

      await _sliderController!.initialize();
      await _sliderController!.setVolume(0.0); // 🔇 Mute video

      // Initialize Chewie controller
      _sliderChewieController = ChewieController(
        videoPlayerController: _sliderController!,
        autoPlay: event.autoPlay,
        looping: event.looping,
        showControls: event.showControls,
      );

      emit(VideoPlayerReady(_sliderChewieController!));
    } catch (e) {
      emit(VideoPlayerError(e.toString()));
    }
  }

  Future<void> _onInitializeHomeVideoPlayer(
    InitializeHomeVideoPlayer event,
    Emitter<VideoPlayerState> emit,
  ) async {
    try {
      emit(const VideoPlayerLoading());

      // Dispose existing controllers if any
      await _disposeControllers();

      // Initialize new video controller
      _homeVideoController = VideoPlayerController.networkUrl(
        Uri.parse(event.videoUrl),
      );

      await _homeVideoController!.initialize();
      await _homeVideoController!.setVolume(0.0); // 🔇 Mute video

      // Initialize Chewie controller
      _homeVideoChewieController = ChewieController(
        videoPlayerController: _homeVideoController!,
        autoPlay: event.autoPlay,
        looping: event.looping,
        showControls: event.showControls,
      );

      emit(VideoPlayerReady(_homeVideoChewieController!));
    } catch (e) {
      emit(VideoPlayerError(e.toString()));
    }
  }

  Future<void> _onInitializeApproachCardBgPlayer(
    InitializeApproachCardBgVideoPlayer event,
    Emitter<VideoPlayerState> emit,
  ) async {
    try {
      emit(const VideoPlayerLoading());

      // Dispose existing controllers if any
      await _disposeControllers();

      // Initialize new video controller
      _approachCardBgController = VideoPlayerController.networkUrl(
        Uri.parse(event.videoUrl),
      );

      await _approachCardBgController!.initialize();
      await _approachCardBgController!.setVolume(0.0); // 🔇 Mute video

      // Initialize Chewie controller
      _approachCardBgChewieController = ChewieController(
        videoPlayerController: _approachCardBgController!,
        autoPlay: event.autoPlay,
        looping: event.looping,
        showControls: event.showControls,
      );

      emit(VideoPlayerReady(_approachCardBgChewieController!));
    } catch (e) {
      emit(VideoPlayerError(e.toString()));
    }
  }

  Future<void> _onInitializeMethodologyPlayer(
    InitializeMethodologyVideoPlayer event,
    Emitter<VideoPlayerState> emit,
  ) async {
    try {
      emit(const VideoPlayerLoading());

      // Dispose existing controllers if any
      await _disposeControllers();

      // Initialize new video controller
      _methodologyController = VideoPlayerController.networkUrl(
        Uri.parse(event.videoUrl),
      );

      await _methodologyController!.initialize();
      await _methodologyController!.setVolume(0.0); // 🔇 Mute video

      // Initialize Chewie controller
      _metodologyChewieController = ChewieController(
        videoPlayerController: _methodologyController!,
        autoPlay: event.autoPlay,
        looping: event.looping,
        showControls: event.showControls,
      );

      emit(VideoPlayerReady(_metodologyChewieController!));
    } catch (e) {
      emit(VideoPlayerError(e.toString()));
    }
  }

  Future<void> _onInitializeServicePlayer(
    InitializeServiceVideoPlayer event,
    Emitter<VideoPlayerState> emit,
  ) async {
    try {
      emit(const VideoPlayerLoading());

      // Dispose existing controllers if any
      await _disposeControllers();

      // Initialize new video controller
      _serviceController = VideoPlayerController.networkUrl(
        Uri.parse(event.videoUrl),
      );

      await _serviceController!.initialize();
      await _serviceController!.setVolume(0.0); // 🔇 Mute video

      // Initialize Chewie controller
      _serviceChewieController = ChewieController(
        videoPlayerController: _serviceController!,
        autoPlay: event.autoPlay,
        looping: event.looping,
        showControls: event.showControls,
      );

      emit(VideoPlayerReady(_serviceChewieController!));
    } catch (e) {
      emit(VideoPlayerError(e.toString()));
    }
  }

  Future<void> _onInitializeknowMorePlayer(
    InitializeKnowMoreVideoPlayer event,
    Emitter<VideoPlayerState> emit,
  ) async {
    try {
      emit(const VideoPlayerLoading());

      // Dispose existing controllers if any
      await _disposeControllers();

      // Initialize new video controller
      _knowMoreController = VideoPlayerController.networkUrl(
        Uri.parse(event.videoUrl),
      );

      await _knowMoreController!.initialize();
      await _knowMoreController!.setVolume(0.0); // 🔇 Mute video

      // Initialize Chewie controller
      _knowMoreChewieController = ChewieController(
        videoPlayerController: _knowMoreController!,
        autoPlay: event.autoPlay,
        looping: event.looping,
        showControls: event.showControls,
      );

      emit(VideoPlayerReady(_knowMoreChewieController!));
    } catch (e) {
      emit(VideoPlayerError(e.toString()));
    }
  }

  Future<void> _onInitializeVisionPlayer(
    InitializeVisionVideoPlayer event,
    Emitter<VideoPlayerState> emit,
  ) async {
    try {
      emit(const VideoPlayerLoading());

      // Dispose existing controllers if any
      await _disposeControllers();

      // Initialize new video controller
      _visionController = VideoPlayerController.networkUrl(
        Uri.parse(event.videoUrl),
      );

      await _visionController!.initialize();
      await _visionController!.setVolume(0.0); // 🔇 Mute video

      // Initialize Chewie controller
      _visionChewieController = ChewieController(
        videoPlayerController: _visionController!,
        autoPlay: event.autoPlay,
        looping: event.looping,
        showControls: event.showControls,
      );

      emit(VideoPlayerReady(_visionChewieController!));
    } catch (e) {
      emit(VideoPlayerError(e.toString()));
    }
  }

  Future<void> _onDisposeVideoPlayer(
    DisposeVideoPlayer event,
    Emitter<VideoPlayerState> emit,
  ) async {
    await _disposeControllers();
    emit(const VideoPlayerInitial());
  }

  Future<void> _disposeControllers() async {
    if (_chewieController != null) {
      _chewieController!.dispose();
      _chewieController = null;
    }
    if (_sliderController != null) {
      _sliderController!.dispose();
      _sliderController = null;
    }
    if (_serviceChewieController != null) {}
  }

  @override
  Future<void> close() async {
    await _disposeControllers();
    return super.close();
  }
}
