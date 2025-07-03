import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/model/methodlogy_model/methodology_model.dart';
import '../../data/repositories/methodology_repo.dart';

part 'methodology_event.dart';
part 'methodology_state.dart';

class MethodologyBloc extends Bloc<MethodologyEvent, MethodologyState> {
  MethodologyBloc(
    this._repository,
  ) : super(const MethodologyState()) {
    on<GetMethodologyDataEvent>(_getMethodologyData);
  }
  final MethodologyRepository _repository;

//!-------------Mobile Number Api Section---------------

  Future<void> _getMethodologyData(
    GetMethodologyDataEvent event,
    Emitter<MethodologyState> emit,
  ) async {
    emit(
      state.copyWith(
        loading: true,
      ),
    );
    try {
      MethodologyModel response = await _repository.getMethodologyDataApi();
      if (response.data != null) {
        emit(state.copyWith(data: response.data));
      }
    } catch (e) {
      emit(
        state.copyWith(
          error: e.toString(),
        ),
      );
    }
  }
}
