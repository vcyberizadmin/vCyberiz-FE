part of 'careers_bloc.dart';

enum SubmitResumeStatus { initial, success, failure }

final class CareersState extends Equatable {
  final String error;
  final String sortText;
  final String filterText;
  final String functionText;
  final String locationText;
  final String locationSearch;
  final String searchText;
  final bool loading;
  final CareerHeaderData? headerData;
  final CareerFilterData? filterData;
  final List<CareerListData>? careerList;
  final List<CareerListData>? eventList;
  final CareerData? careerData;
  final int pagesCount;
  final int currentPageIndex;
  final SubmitResumeStatus submitResumeStatus;
  const CareersState({
    this.error = '',
    this.loading = false,
    this.headerData,
    this.filterData,
    this.careerList,
    this.careerData,
    this.eventList,
    this.currentPageIndex = 0,
    this.pagesCount = 0,
    this.sortText = '',
    this.filterText = '',
    this.functionText = '',
    this.locationText = '',
    this.locationSearch = '',
    this.searchText = '',
    this.submitResumeStatus = SubmitResumeStatus.initial,
  });

  CareersState copyWith({
    final String? error,
    final String? sortText,
    final String? filerText,
    final String? functionText,
    final String? locationText,
    final String? filterText,
    final String? searchText,
    final String? locationSearch,
    final bool? loading,
    final CareerHeaderData? headerData,
    final CareerFilterData? filterData,
    final List<CareerListData>? careerList,
    final int? currentPageIndex,
    final int? pagesCount,
    final List<CareerListData>? eventList,
    final CareerData? careerData,
    final SubmitResumeStatus? submitResumeStatus,
  }) {
    return CareersState(
      error: error ?? this.error,
      sortText: sortText ?? this.sortText,
      filterText: filerText ?? this.filterText,
      functionText: functionText ?? this.functionText,
      locationText: locationText ?? this.locationText,
      loading: loading ?? this.loading,
      headerData: headerData ?? this.headerData,
      filterData: filterData ?? this.filterData,
      careerList: careerList ?? this.careerList,
      careerData: careerData ?? this.careerData,
      eventList: eventList ?? this.eventList,
      currentPageIndex: currentPageIndex ?? this.currentPageIndex,
      pagesCount: pagesCount ?? this.pagesCount,
      searchText: searchText ?? this.searchText,
      locationSearch: locationSearch ?? this.locationSearch,
      submitResumeStatus: submitResumeStatus ?? this.submitResumeStatus,
    );
  }

  @override
  List<Object> get props => <Object>[
        error,
        sortText,
        filterText,
        functionText,
        locationText,
        searchText,
        locationSearch,
        loading,
        headerData ?? '',
        filterData ?? '',
        careerList ?? [],
        eventList ?? [],
        careerData ?? [],
        currentPageIndex,
        pagesCount,
        submitResumeStatus,
      ];
}
