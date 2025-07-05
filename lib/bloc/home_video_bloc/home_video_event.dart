part of 'home_video_bloc.dart';

sealed class HomeVideoEvent extends Equatable {
  const HomeVideoEvent();

  @override
  List<Object> get props => <Object>[];
}

final class GetVideoDataEvent extends HomeVideoEvent {
  const GetVideoDataEvent();
}
