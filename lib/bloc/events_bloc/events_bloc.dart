import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:vcyberiz/data/model/blogs_model/blog_category_model.dart';
import 'package:vcyberiz/data/model/blogs_model/blog_tags_model.dart';
import 'package:vcyberiz/data/model/blogs_model/blogs_model.dart';
import 'package:vcyberiz/data/model/events_model/event_details_model.dart';
import 'package:vcyberiz/data/model/events_model/event_header_model.dart';
import 'package:vcyberiz/data/model/events_model/events_model.dart';
import 'package:vcyberiz/data/model/events_model/register_details_model.dart';
import 'package:vcyberiz/data/model/events_model/register_responce_model.dart';
import 'package:vcyberiz/data/model/events_model/related_event_list_model.dart';
import 'package:vcyberiz/data/repositories/events_repo.dart';

part 'events_event.dart';
part 'events_state.dart';

class EventsBloc extends Bloc<EventsEvent, EventsState> {
  EventsBloc(
    this._repository,
  ) : super(const EventsState()) {
    on<GetEventsHeaderEvent>(_getEventsHeader);
    on<GetRegisterDetailsEvent>(_getRegisterDetailsEvent);

    on<RegisterEventsEvent>(_registerEventsEvent);
    on<GetEventsListEvent>(_getEventsList);

    on<GetCategoryEvent>(_getCategoryData);
    on<GetEventTagsEvent>(_getEventTagsApi);
    on<GetPaginationDataEvent>(_getPaginationData);
    on<GetTagsEvent>(_getTagsData);
    on<GetRelatedEventsEvent>(_getRelatedBlogsApi);
    on<GetEventdetailsEvent>(_getEventDetailsData);
  }
  final EventsRepository _repository;

//!-------------Events Header---------------

  Future<void> _getEventsHeader(
    GetEventsHeaderEvent event,
    Emitter<EventsState> emit,
  ) async {
    emit(
      state.copyWith(
        loading: true,
      ),
    );
    try {
      EventsHeaderModel response = await _repository.getEventsHeaderApi();
      if (response.data != null) {
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
  //!-------------AboutUs schield---------------

  Future<void> _getEventsList(
    GetEventsListEvent event,
    Emitter<EventsState> emit,
  ) async {
    emit(
      state.copyWith(
        loading: true,
      ),
    );
    try {
      EventsListModel response = await _repository.getEventsListApi();
      if (response.data != null) {
        await Future.delayed(
            const Duration(
              seconds: 1,
            ), () {
          return emit(
            state.copyWith(
              loading: false,
              eventsList: response.data,
            ),
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

  Future<void> _registerEventsEvent(
    RegisterEventsEvent event,
    Emitter<EventsState> emit,
  ) async {
    emit(
      state.copyWith(
        loading: true,
      ),
    );
    try {
      registerResponceData? response = await _repository.registerEvents(
        name: event.name,
        email: event.email,
        mobile: event.mobile,
        eventId: event.eventId,
        eventName: event.eventName,
      );
      if (response != null) {
        emit(state.copyWith(
          registerStatus: RegisterStatus.success,
        ));
        await Future.delayed(
            const Duration(
              seconds: 2,
            ), () {
          return emit(
            state.copyWith(
                loading: false, registerStatus: RegisterStatus.initial),
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

  Future<void> _getRegisterDetailsEvent(
    GetRegisterDetailsEvent event,
    Emitter<EventsState> emit,
  ) async {
    emit(
      state.copyWith(
        loading: true,
      ),
    );
    try {
      RegisterDetailsModel response = await _repository.getRegisterDetailsApi();
      if (response.data != null) {
        await Future.delayed(
            const Duration(
              seconds: 1,
            ), () {
          return emit(
            state.copyWith(
              loading: false,
              registerDetailsData: response.data,
            ),
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

  FutureOr<void> _getTagsData(
    GetTagsEvent event,
    Emitter<EventsState> emit,
  ) async {
    final list = List<BlogTag>.from(state.selectedTags);

    final value = (event.selectedTags);
    if (list.contains(value)) {
      list.remove(value);
    } else {
      list.add(value);
    }

    emit(
      state.copyWith(selectedTags: list),
    );
    add(GetPaginationDataEvent(
      itemCount: event.itemCount,
      currentIndex: 0,
      searchText: '',
      selectedTags: list,
      selectedCategory: state.selectedCategory,
    ));
  }

  FutureOr<void> _getCategoryData(
    GetCategoryEvent event,
    Emitter<EventsState> emit,
  ) async {
    emit(state.copyWith(loading: true));

    try {
      CategoriesModel response = await _repository.getCategoryApi();
      if (response.data != null) {
        emit(
          state.copyWith(
            loading: false,
            categoriesList: response.data,
          ),
        );
      } else {
        emit(
          state.copyWith(error: "no data found"),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(error: e.toString()),
      );
    }
  }

  FutureOr<void> _getEventTagsApi(
    GetEventTagsEvent event,
    Emitter<EventsState> emit,
  ) async {
    emit(state.copyWith(loading: true));

    try {
      TagsModel response = await _repository.getEventTagsApi();
      if (response.data != null) {
        emit(
          state.copyWith(
            loading: false,
            tagsList: response.data,
          ),
        );
      } else {
        emit(
          state.copyWith(error: "no data found"),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(error: e.toString()),
      );
    }
  }

  FutureOr<void> _getPaginationData(
    GetPaginationDataEvent event,
    Emitter<EventsState> emit,
  ) async {
    int itemsPerPage = event.itemCount;

    // Ensure data list is not null or empty
    if (event.dataList == null || event.dataList!.isEmpty) {
      emit(state.copyWith(
          currentPageIndex: 0,
          pagesCount: 0,
          paginatedList: [],
          selectedTags: state.selectedTags));
      return;
    }

    // Start with the full list
    List<EventsListData> filteredList = event.dataList ?? [];

    // Apply search filter
    if (event.searchText.isNotEmpty) {
      filteredList = filteredList.where((blog) {
        return blog.eventTitle!
            .toUpperCase()
            .contains(event.searchText.toUpperCase());
      }).toList();
    }

    // Handle empty filtered list after search
    if (filteredList.isEmpty) {
      emit(state.copyWith(
          selectedCategory: '',
          currentPageIndex: 0,
          pagesCount: 0,
          paginatedList: [],
          selectedTags: []));
      return;
    }

    // Apply selectedCategory filter
    if (event.selectedCategory.isNotEmpty) {
      // log(filteredList.first.toString(), name: 'list');
      filteredList = filteredList.where((blog) {
        // Convert the selected category to uppercase for case-insensitive comparison
        final selectedCategory = event.selectedCategory.toUpperCase();

        // Check if any category in blog.blogCategories matches the selected category
        return blog.blogCategories?.any((category) =>
                category.name?.toUpperCase() == selectedCategory) ??
            false;
      }).toList();
    } // Apply selectedCategory filter
    if (state.selectedTags.isNotEmpty) {
      Set<EventsListData> tempFilteredSet = {};

      for (var blog in filteredList) {
        // Check if any tag in event.selectedTags matches the liItem of any tag in blog.tags
        final anyTagMatches = state.selectedTags.any((selectedTag) {
          return blog.blogTags?.any((blogTag) {
                // Compare liItem of Tag objects
                return selectedTag.tid == blogTag.tid;
              }) ??
              false;
        });

        if (anyTagMatches) {
          tempFilteredSet.add(blog);
        }
      }

// Update filteredList with the filtered results from the set
      filteredList = tempFilteredSet.toList();
    }

    // Handle empty filtered list after category filter
    if (filteredList.isEmpty) {
      emit(state.copyWith(
        selectedCategory: event.selectedCategory,
        currentPageIndex: 0,
        pagesCount: 0,
        paginatedList: [],
        selectedTags: state.selectedTags,
      ));
      return;
    }

    // Calculate total pages
    final totalPages = (filteredList.length / itemsPerPage).ceil();

    // Adjust for out-of-bounds current index
    if (event.currentIndex < 0 || event.currentIndex >= totalPages) {
      emit(state.copyWith(
        selectedCategory: event.selectedCategory,
        currentPageIndex: 0,
        pagesCount: totalPages,
        paginatedList: filteredList.sublist(0, itemsPerPage),
        selectedTags: state.selectedTags,
      ));
      return;
    }

    // Calculate paginated items
    final startIndex = event.currentIndex * itemsPerPage;
    final endIndex =
        (event.currentIndex + 1) * itemsPerPage > filteredList.length
            ? filteredList.length
            : (event.currentIndex + 1) * itemsPerPage;
    final paginatedItems = filteredList.sublist(startIndex, endIndex);

    // Emit the updated state
    emit(
      state.copyWith(
          selectedCategory: event.selectedCategory,
          currentPageIndex: event.currentIndex,
          pagesCount: totalPages,
          paginatedList: paginatedItems,
          selectedTags: state.selectedTags),
    );
  }

  Future<void> _getEventDetailsData(
    GetEventdetailsEvent event,
    Emitter<EventsState> emit,
  ) async {
    emit(
      state.copyWith(
        loading: true,
      ),
    );
    try {
      EventDetailsModel response = await _repository.getEventDetailsApi(
        documentId: event.documentId,
      );
      if (response.data != null) {
        await Future.delayed(
            const Duration(
              seconds: 1,
            ), () {
          return emit(
            state.copyWith(
              loading: false,
              eventDetailsData: response.data,
            ),
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

  FutureOr<void> _getRelatedBlogsApi(
    GetRelatedEventsEvent event,
    Emitter<EventsState> emit,
  ) async {
    emit(state.copyWith(loading: true));

    try {
      RelatedEventsListModel response = await _repository.getRelatedEventsApi();
      if (response.data != null) {
        emit(
          state.copyWith(
            loading: false,
            relatedBlogs: response.data,
          ),
        );
      } else {
        emit(
          state.copyWith(error: "no data found"),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(error: e.toString()),
      );
    }
  }
}
