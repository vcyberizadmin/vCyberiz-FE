import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/model/video_model.dart';
import '../../data/repositories/home_video_repo.dart';

part 'home_video_event.dart';
part 'home_video_state.dart';

class HomeVideoBloc extends Bloc<HomeVideoEvent, HomeVideoState> {
  HomeVideoBloc(
    this._repository,
  ) : super(const HomeVideoState()) {
    on<GetVideoDataEvent>(_getVideoData);
  }
  final HomeVideoRepository _repository;

//!-------------Mobile Number Api Section---------------

  Future<void> _getVideoData(
    GetVideoDataEvent event,
    Emitter<HomeVideoState> emit,
  ) async {
    emit(
      state.copyWith(
        loading: true,
      ),
    );
    try {
      VideoModel response = (await _repository.getVideoDataApi());
      if (response.data != null) {
        emit(
          state.copyWith(loading: false, data: response.data),
        );
        await Future.delayed(
            const Duration(
              seconds: 1,
            ), () {
          return emit(
            state.copyWith(loading: false, data: response.data),
          );
        });
      } else {
        emit(
          state.copyWith(
            error: 'no data found',
          ),
        );
      }
    } catch (e) {
      return emit(
        state.copyWith(
          error: e.toString(),
        ),
      );
    }
  }
}
