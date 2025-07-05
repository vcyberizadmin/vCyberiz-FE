import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/model/cookies_model/cookies_model.dart';
import '../../data/repositories/cookies_repo.dart';

part 'cookies_event.dart';
part 'cookies_state.dart';

class CookiesBloc extends Bloc<CookiesEvent, CookiesState> {
  CookiesBloc(
    this._repository,
  ) : super(const CookiesState()) {
    on<GetCookiesDataEvent>(_getCookiesData);
    on<UpdateIndexEvent>(_updateindex);
  }
  final CookiesRepository _repository;

//!-------------Mobile Number Api Section---------------

  Future<void> _getCookiesData(
    GetCookiesDataEvent event,
    Emitter<CookiesState> emit,
  ) async {
    emit(
      state.copyWith(
        loading: true,
      ),
    );
    try {
      CookiesModel response = await _repository.getCookiesDataApi();
      if (response.data != null) {
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

  Future<void> _updateindex(
    UpdateIndexEvent event,
    Emitter<CookiesState> emit,
  ) async {
    return emit(state.copyWith(index: event.index));
  }
}
