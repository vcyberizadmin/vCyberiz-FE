import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:vcyberiz/data/model/blogs_model/blog_marketing_model.dart';
import 'package:vcyberiz/data/model/blogs_model/related_blogs_model.dart';
import 'package:vcyberiz/data/model/ebook_model/ebook_model.dart';
import 'package:vcyberiz/data/model/news_model/news_article_model.dart';
import 'package:vcyberiz/data/model/news_model/news_header_model.dart';
import 'package:vcyberiz/data/model/news_model/news_list_model.dart';
import 'package:vcyberiz/data/repositories/news_repo.dart';

import '../../data/model/blogs_model/blog_category_model.dart';
import '../../data/model/blogs_model/blog_tags_model.dart';
import '../../data/model/blogs_model/blogs_model.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc(
    this._repository,
  ) : super(const NewsState()) {
    on<GetNewsHeaderEvent>(_getNewsHeaderData);
    on<GetNewsListEvent>(_getNewsListData);
    on<GetEbookListEvent>(_getEbookListData);
    on<GetCategoryEvent>(_getBlogCategoryData);
    on<GetAllTagsEvent>(_getBlogTagsApi);
    on<GetPaginationDataEvent>(_getPaginationData);
    on<GetTagsEvent>(_getTagsData);
    on<GetRelatedBlogsEvent>(_getRelatedBlogsApi);
    on<GetNewsArticleEvent>(_getNewsArticleApi);
    on<GetMarketingEvent>(_getMarketingEvent);
  }
  final NewsRepository _repository;
  FutureOr<void> _getTagsData(
    GetTagsEvent event,
    Emitter<NewsState> emit,
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

  FutureOr<void> _getPaginationData(
    GetPaginationDataEvent event,
    Emitter<NewsState> emit,
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
    List<NewsListData> filteredList = event.dataList ?? [];

    // Apply search filter
    if (event.searchText.isNotEmpty) {
      filteredList = filteredList.where((blog) {
        return blog.title!
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
      Set<NewsListData> tempFilteredSet = {};

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

  FutureOr<void> _getNewsHeaderData(
    GetNewsHeaderEvent event,
    Emitter<NewsState> emit,
  ) async {
    emit(
      state.copyWith(loading: true),
    );
    try {
      NewsHeaderModel response = await _repository.getNewHeaderApi();
      if (response.data != null) {
        emit(
          state.copyWith(loading: false, headerData: response.data),
        );
      } else {
        emit(
          state.copyWith(error: "no data found"),
        );
      }
    } catch (e) {
      return emit(
        state.copyWith(error: e.toString()),
      );
    }
  }

  FutureOr<void> _getNewsListData(
    GetNewsListEvent event,
    Emitter<NewsState> emit,
  ) async {
    emit(state.copyWith(loading: true));

    try {
      NewsListModel response = await _repository.getNewsListApi();
      if (response.data != null) {
        emit(
          state.copyWith(
            loading: false,
            newsList: response.data,
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

  FutureOr<void> _getEbookListData(
    GetEbookListEvent event,
    Emitter<NewsState> emit,
  ) async {
    emit(state.copyWith(loading: true));

    try {
      EbookModel response = await _repository.getEbookListApi();
      if (response.data != null) {
        emit(
          state.copyWith(
            loading: false,
            ebookList: response.data?.eBookCard,
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

  FutureOr<void> _getBlogCategoryData(
    GetCategoryEvent event,
    Emitter<NewsState> emit,
  ) async {
    emit(state.copyWith(loading: true));

    try {
      CategoriesModel response = await _repository.getBlogCategoryApi();
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

  FutureOr<void> _getBlogTagsApi(
    GetAllTagsEvent event,
    Emitter<NewsState> emit,
  ) async {
    emit(state.copyWith(loading: true));

    try {
      TagsModel response = await _repository.getNewTagsApi();
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

  FutureOr<void> _getMarketingEvent(
    GetMarketingEvent event,
    Emitter<NewsState> emit,
  ) async {
    emit(state.copyWith(loading: true));

    try {
      BlogMarketingModel response = await _repository.getMarketingApi();
      if (response.data != null) {
        emit(
          state.copyWith(
            loading: false,
            blogMarketingList: response.data,
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

  FutureOr<void> _getNewsArticleApi(
    GetNewsArticleEvent event,
    Emitter<NewsState> emit,
  ) async {
    emit(state.copyWith(loading: true));

    try {
      NewsArtilceModel response =
          await _repository.getNewsArticlesApi(event.documentId);
      if (response.data != null) {
        emit(
          state.copyWith(
            loading: false,
            newsArticleData: response.data,
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

  FutureOr<void> _getRelatedBlogsApi(
    GetRelatedBlogsEvent event,
    Emitter<NewsState> emit,
  ) async {
    emit(state.copyWith(loading: true));

    try {
      RelatedBlogsModel response = await _repository.getRelatedNewsApi();
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
