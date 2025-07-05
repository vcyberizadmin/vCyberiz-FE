part of 'events_bloc.dart';

enum RegisterStatus { initial, success, failure }

final class EventsState extends Equatable {
  final String error;
  final bool loading;
  final int currentPageIndex;
  final String selectedCategory;
  final List<BlogTag> selectedTags;
  final int pagesCount;
  final List<EventsListData>? paginatedList;
  final BlogsData? data;
  final EventsData? headerData;
  final RegisterDetailsData? registerDetailsData;
  final List<EventsListData>? eventsList;
  final CategoryData? categoriesList;
  final BlogTagsData? tagsList;
  final RelatedEventsData? relatedEvents;
  final EventDetailsData? eventDetailsData;
  final RegisterStatus registerStatus;

  const EventsState({
    this.error = '',
    this.selectedCategory = '',
    this.loading = false,
    this.currentPageIndex = 0,
    this.pagesCount = 0,
    this.paginatedList,
    this.selectedTags = const [],
    this.data,
    this.headerData,
    this.registerDetailsData,
    this.eventsList,
    this.categoriesList,
    this.tagsList,
    this.relatedEvents,
    this.eventDetailsData,
    this.registerStatus = RegisterStatus.initial,
  });

  EventsState copyWith(
      {final String? error,
      final String? selectedCategory,
      final bool? loading,
      final int? currentPageIndex,
      final int? pagesCount,
      final List<EventsListData>? paginatedList,
      final List<BlogTag>? selectedTags,
      final BlogsData? data,
      final RegisterDetailsData? registerDetailsData,
      final EventsData? headerData,
      final List<EventsListData>? eventsList,
      final RelatedEventsData? relatedBlogs,
      final CategoryData? categoriesList,
      final BlogTagsData? tagsList,
      final EventDetailsData? eventDetailsData,
      final RegisterStatus? registerStatus}) {
    return EventsState(
        error: error ?? this.error,
        selectedCategory: selectedCategory ?? this.selectedCategory,
        loading: loading ?? this.loading,
        currentPageIndex: currentPageIndex ?? this.currentPageIndex,
        pagesCount: pagesCount ?? this.pagesCount,
        paginatedList: paginatedList ?? this.paginatedList,
        selectedTags: selectedTags ?? this.selectedTags,
        data: data ?? this.data,
        headerData: headerData ?? this.headerData,
        registerDetailsData: registerDetailsData ?? this.registerDetailsData,
        eventsList: eventsList ?? this.eventsList,
        categoriesList: categoriesList ?? this.categoriesList,
        tagsList: tagsList ?? this.tagsList,
        relatedEvents: relatedBlogs ?? this.relatedEvents,
        eventDetailsData: eventDetailsData ?? this.eventDetailsData,
        registerStatus: registerStatus ?? this.registerStatus);
  }

  @override
  List<Object> get props => <Object>[
        error,
        selectedCategory,
        loading,
        data ?? '',
        pagesCount,
        currentPageIndex,
        relatedEvents ?? [],
        paginatedList ?? [],
        selectedTags,
        headerData ?? '',
        registerDetailsData ?? '',
        eventsList ?? [],
        eventDetailsData ?? [],
        categoriesList ?? [],
        tagsList ?? [],
        registerStatus
      ];
}
