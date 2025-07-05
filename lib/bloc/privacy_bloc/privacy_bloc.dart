import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/model/privacy_model/privacy_model.dart';
import '../../data/repositories/privacy_repo.dart';

part 'privacy_event.dart';
part 'privacy_state.dart';

class PrivacyBloc extends Bloc<PrivacyEvent, PrivacyState> {
  PrivacyBloc(
    this._repository,
  ) : super(const PrivacyState()) {
    on<GetPrivacyDataEvent>(_getPrivacyData);
    on<UpdateSelectedItemEvent>(_updateSelectedItem);
  }
  final PrivacyRepository _repository;

  Future<void> _updateSelectedItem(
    UpdateSelectedItemEvent event,
    Emitter<PrivacyState> emit,
  ) async {
    return emit(state.copyWith(selectedItem: event.item));
  }

  Future<void> _getPrivacyData(
    GetPrivacyDataEvent event,
    Emitter<PrivacyState> emit,
  ) async {
    emit(
      state.copyWith(
        loading: true,
      ),
    );
    try {
      PrivacyModel response = await _repository.getPrivacyDataApi();
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
