import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:vcyberiz/data/model/why_work_with_us_model/why_work_with_us_model.dart';
import 'package:vcyberiz/data/repositories/why_work_with_us_repo.dart';

part 'why_work_with_us_event.dart';
part 'why_work_with_us_state.dart';

class WhyWorkWithUsBloc extends Bloc<WhyWorkWithUsEvent, WhyWorkWithUsState> {
  WhyWorkWithUsBloc(
    this._repository,
  ) : super(const WhyWorkWithUsState()) {
    on<GetWhyWorkUsDataEvent>(_getWhyWorkWithUsData);
  }
  final WhyWorkWithUsRepository _repository;

  Future<void> _getWhyWorkWithUsData(
    GetWhyWorkUsDataEvent event,
    Emitter<WhyWorkWithUsState> emit,
  ) async {
    emit(
      state.copyWith(
        loading: true,
      ),
    );
    try {
      WhyWorkWithUsModel response = await _repository.getWhyWorkWithUsDataApi();
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
