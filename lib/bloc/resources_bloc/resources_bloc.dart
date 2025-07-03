import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:vcyberiz/data/model/resource_model/resource_header_model.dart';
import 'package:vcyberiz/data/repositories/resources_repo.dart';

import '../../data/model/header_loading_model/header_loading_model.dart';

part 'resources_event.dart';
part 'resoures_state.dart';

class ResourcesBloc extends Bloc<ResourcesEvent, ResourcesState> {
  ResourcesBloc(
    this._repository,
  ) : super(const ResourcesState()) {
    on<GetResourceHeaderDataEvent>(_getHeaderData);
    on<GetHeaderLoadingEvent>(_getHeaderLoadingData);
  }
  final ResourcesRepository _repository;

//!-------------Mobile Number Api Section---------------

  Future<void> _getHeaderData(
    GetResourceHeaderDataEvent event,
    Emitter<ResourcesState> emit,
  ) async {
    emit(
      state.copyWith(
        loading: true,
      ),
    );
    try {
      ResourceHeaderModel response = await _repository.getHeaderDataApi();
      if (response.data != null) {
        emit(
          state.copyWith(headerData: response.data),
        );
        await Future.delayed(
            const Duration(
              seconds: 1,
            ), () {
          return emit(
            state.copyWith(loading: false, headerData: response.data),
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

  Future<void> _getHeaderLoadingData(
    GetHeaderLoadingEvent event,
    Emitter<ResourcesState> emit,
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
