import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/model/our_approach_model/our_approach_model.dart';
import '../../data/repositories/our_approach_repo.dart';

part 'our_approach_event.dart';
part 'our_approach_state.dart';

class OurApproachBloc extends Bloc<OurApproachEvent, OurApproachState> {
  OurApproachBloc(
    this._repository,
  ) : super(const OurApproachState()) {
    on<GetOurApproachDataEvent>(_getOurApproachData);
  }
  final OurApproachRepository _repository;

//!-------------Mobile Number Api Section---------------

  Future<void> _getOurApproachData(
    GetOurApproachDataEvent event,
    Emitter<OurApproachState> emit,
  ) async {
    emit(
      state.copyWith(
        loading: true,
      ),
    );
    try {
      OurApproachModel response = await _repository.getOurApproachDataApi();
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
