part of 'home_video_bloc.dart';

enum MobileNoStatus { initial, success, failure }

final class HomeVideoState extends Equatable {
  final String error;
  final bool loading;
  final VideoData? data;
  final bool showFullScreen;

  const HomeVideoState({
    this.error = '',
    this.loading = false,
    this.data,
    this.showFullScreen = false,
  });

  HomeVideoState copyWith({
    final String? error,
    final bool? loading,
    final VideoData? data,
    final bool? showFullScreen,
  }) {
    return HomeVideoState(
      error: error ?? this.error,
      loading: loading ?? this.loading,
      data: data ?? this.data,
      showFullScreen: showFullScreen ?? this.showFullScreen,
    );
  }

  @override
  List<Object> get props => <Object>[
        error,
        loading,
        data ?? '',
        showFullScreen,
      ];
}
