import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:vcyberiz/data/model/search_model/search_model.dart';

import '../../data/model/sections-model.dart';
import '../../data/repositories/home_repo.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(
    this._repository,
  ) : super(const HomeState()) {
    final Map<String, String> apiStatus = {};

    on<ToggleIsTopContainerVisible>(_toggleIsTopContainerVisible);
    on<GetSearchEvent>(_getSearchData);

    on<ShowChatContainer>(_showChatContainer);
    on<TabClickEvent>(_tabClick);
    on<ApiStarted>((event, emit) {
      apiStatus[event.apiName] = "loading";
      emit(state.copyWith(apiStatus: Map.from(apiStatus)));
    });
    on<GetSectionsEvent>(_getSections);

    on<ApiSuccess>((event, emit) {
      apiStatus[event.apiName] = "success";
      emit(state.copyWith(apiStatus: Map.from(apiStatus)));
    });

    on<ApiFailure>((event, emit) {
      apiStatus[event.apiName] = "failure: ${event.errorMessage}";
      emit(state.copyWith(apiStatus: Map.from(apiStatus)));
    });
  }
  final HomeRepository _repository;
  Future<void> _getSearchData(
    GetSearchEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(loading: true));

    try {
      final SearchModel response =
          await _repository.getSearchApi(event.searchText);

      if (response.results != null) {
        final List<Hit> allHits = [];

        for (Result result in (response.results ?? [])) {
          for (Hit hit in result.hits ?? []) {
            allHits.add(hit);
          }
        }

        emit(state.copyWith(
          searchResults: allHits,
          loading: false,
          searchText: event.searchText,
        ));
      } else {
        emit(state.copyWith(
          error: 'No data found',
          loading: false,
          searchText: event.searchText,
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        error: e.toString(),
        loading: false,
        searchText: event.searchText,
      ));
    }
  }

  Future<void> _getSections(
    GetSectionsEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(
      state.copyWith(
        loading: true,
      ),
    );
    try {
      SectionModel response = await _repository.getSections();
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

  FutureOr<void> _tabClick(
    TabClickEvent event,
    Emitter<HomeState> emit,
  ) {
    emit(state.copyWith(
      selectedItem: event.selectedItem,
    ));
  }

  FutureOr<void> _toggleIsTopContainerVisible(
      ToggleIsTopContainerVisible event, Emitter<HomeState> emit) {
    emit(state.copyWith(
      isTopContainerVisible: event.value,
    ));
  }

  FutureOr<void> _showChatContainer(
      ShowChatContainer event, Emitter<HomeState> emit) {
    emit(state.copyWith(
      showChatContainer: event.value,
    ));
  }
}
