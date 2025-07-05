import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:vcyberiz/data/repositories/what_we_do_repo.dart';

import '../../data/model/what_we_do_model/what_we_do_model.dart';

part 'what_we_do_event.dart';
part 'what_we_do_state.dart';

class WhatWeDoBloc extends Bloc<WhatWeDoEvent, WhatWeDoState> {
  WhatWeDoBloc(
    this._whatWeDoRepository,
  ) : super(const WhatWeDoState()) {
    on<GetWhatWeDoDataEvent>(_getWhatWeDoData);
  }
  final WhatWeDoRepository _whatWeDoRepository;

//!-------------Mobile Number Api Section---------------

  Future<void> _getWhatWeDoData(
    GetWhatWeDoDataEvent event,
    Emitter<WhatWeDoState> emit,
  ) async {
    emit(
      state.copyWith(
        loading: true,
      ),
    );
    try {
      WhatWeDoModel response = (await _whatWeDoRepository.getWhatWeDoDataApi());
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
}
