import 'package:equatable/equatable.dart';
import 'package:vcyberiz/data/model/search_model/search_model.dart';

import '../../data/model/sections-model.dart';
import '../our_service_bloc/our_service_bloc.dart';

class HomeState extends Equatable {
  final bool isTopContainerVisible;
  final bool showChatContainer;
  final ServiceTab selectedItem;
  final Map<String, String>? apiStatus;
  final List<Hit> searchResults;
  final String error;
  final String searchText;
  final bool loading;
  final SectionsData? data;

  const HomeState({
    this.isTopContainerVisible = true,
    this.showChatContainer = false,
    this.selectedItem = ServiceTab.global,
    this.apiStatus,
    this.error = '',
    this.searchText = '',
    this.loading = false,
    this.data,
    this.searchResults = const [],
    //  this.PopUPData,
  });
  HomeState copyWith({
    bool? isTopContainerVisible,
    bool? showChatContainer,
    ServiceTab? selectedItem,
    Map<String, String>? apiStatus,
    List<Hit>? searchResults,
    final String? error,
    final String? searchText,
    final bool? loading,
    final SectionsData? data,
    //  final PopUPData? data
  }) {
    return HomeState(
      isTopContainerVisible:
          isTopContainerVisible ?? this.isTopContainerVisible,
      showChatContainer: showChatContainer ?? this.showChatContainer,
      selectedItem: selectedItem ?? this.selectedItem,
      error: error ?? this.error,
      searchText: searchText ?? this.searchText,
      loading: loading ?? this.loading,
      data: data ?? this.data,
      searchResults: searchResults ?? this.searchResults,
    );
  }

  @override
  List<Object?> get props => [
        isTopContainerVisible,
        showChatContainer,
        selectedItem,
        apiStatus,
        searchText,
        error,
        loading,
        data ?? '', searchResults
        //  PopUPData,
      ];
}
