import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:vcyberiz/bloc/home-bloc/home_bloc.dart';

import '../../data/model/header_loading_model/header_loading_model.dart';
import '../../data/model/headers_model/headers_model.dart';
import '../../data/repositories/header_repo.dart';
import '../home-bloc/home_event.dart';

part 'headers_event.dart';
part 'headers_state.dart';

class HeadersBloc extends Bloc<HeadersEvent, HeadersState> {
  final HomeBloc apiMonitorBloc;

  HeadersBloc(
    this._repository,
    this.apiMonitorBloc,
  ) : super(const HeadersState()) {
    on<GetHeaderDataEvent>(_getHeaderData);
    on<ServiceOnTapEvent>(_serviceOnTapEvent);
    on<SolutionOnTapEvent>(_solutionOnTapEvent);
    on<AboutUsOnTapEvent>(_aboutUsOnTapEvent);

    on<GetHeaderLoadingEvent>(_getHeaderLoadingData);
    on<CloseEvent>(_closeEvent);
  }
  final HeaderRepository _repository;

  Future<void> _getHeaderData(
    GetHeaderDataEvent event,
    Emitter<HeadersState> emit,
  ) async {
    emit(
      state.copyWith(
        loading: true,
      ),
    );
    apiMonitorBloc.add(ApiStarted("headerApi"));
    try {
      HeaderModel response = (await _repository.getHeaderDataApi());
      if (response.data != null) {
        apiMonitorBloc.add(ApiSuccess("headerApi"));
        emit(
          state.copyWith(data: response.data),
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
        apiMonitorBloc.add(ApiFailure("headerApi", 'no data found'));

        emit(
          state.copyWith(
            error: 'no data found',
          ),
        );
      }
    } catch (e) {
      apiMonitorBloc.add(ApiFailure("headerApi", e.toString()));

      return emit(
        state.copyWith(
          error: e.toString(),
        ),
      );
    }
  }

  Future<void> _serviceOnTapEvent(
    ServiceOnTapEvent event,
    Emitter<HeadersState> emit,
  ) async {
    return emit(
      state.copyWith(
        expandService: !state.expandService,
        expandSolution: false,
        expandAboutUs: false,
      ),
    );
  }

  Future<void> _closeEvent(
    CloseEvent event,
    Emitter<HeadersState> emit,
  ) async {
    return emit(
      state.copyWith(
        expandService: false,
        expandSolution: false,
        expandAboutUs: false,
      ),
    );
  }

  Future<void> _solutionOnTapEvent(
    SolutionOnTapEvent event,
    Emitter<HeadersState> emit,
  ) async {
    return emit(
      state.copyWith(
        expandService: false,
        expandAboutUs: false,
        expandSolution: !state.expandSolution,
      ),
    );
  }

  Future<void> _aboutUsOnTapEvent(
    AboutUsOnTapEvent event,
    Emitter<HeadersState> emit,
  ) async {
    return emit(
      state.copyWith(
        expandService: false,
        expandSolution: false,
        expandAboutUs: !state.expandAboutUs,
      ),
    );
  }

  Future<void> _getHeaderLoadingData(
    GetHeaderLoadingEvent event,
    Emitter<HeadersState> emit,
  ) async {
    emit(
      state.copyWith(
        loading: true,
      ),
    );
    try {
      HeaderLoadingModel response =
          (await _repository.getHeaderLoadingDataApi());
      if (response.data != null) {
        await Future.delayed(
            const Duration(
              seconds: 1,
            ), () {
          return emit(
            state.copyWith(loading: false, loadingData: response.data),
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
