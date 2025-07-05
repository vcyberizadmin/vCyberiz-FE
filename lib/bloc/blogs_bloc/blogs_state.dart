part of 'blogs_bloc.dart';

enum MobileNoStatus { initial, success, failure }

final class BlogsState extends Equatable {
  final String error;
  final bool loading;
  final int currentPageIndex;
  final String selectedCategory;
  final List<BlogTag> selectedTags;
  final int pagesCount;
  final List<BlogsListData>? paginatedList;
  final BlogsData? data;
  final BlogsHeaderData? headerData;
  final List<BlogsListData>? blogsList;
  final BlogMarketingData? blogMarketingList;
  final CategoryData? categoriesList;
  final BlogTagsData? tagsList;
  final BlogArticleData? blogArticleData;
  final List<RelatedBlogs>? relatedBlogs;
  const BlogsState({
    this.error = '',
    this.selectedCategory = '',
    this.loading = false,
    this.currentPageIndex = 0,
    this.pagesCount = 0,
    this.paginatedList,
    this.selectedTags = const [],
    this.data,
    this.headerData,
    this.blogsList,
    this.blogMarketingList,
    this.categoriesList,
    this.tagsList,
    this.blogArticleData,
    this.relatedBlogs,
  });

  BlogsState copyWith({
    final String? error,
    final String? selectedCategory,
    final bool? loading,
    final int? currentPageIndex,
    final int? pagesCount,
    final List<BlogsListData>? paginatedList,
    final List<BlogTag>? selectedTags,
    final BlogsData? data,
    final BlogsHeaderData? headerData,
    final List<BlogsListData>? blogsList,
    final BlogMarketingData? blogMarketingList,
    final List<RelatedBlogs>? relatedBlogs,
    final CategoryData? categoriesList,
    final BlogTagsData? tagsList,
    final BlogArticleData? blogArticleData,
  }) {
    return BlogsState(
      error: error ?? this.error,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      loading: loading ?? this.loading,
      currentPageIndex: currentPageIndex ?? this.currentPageIndex,
      pagesCount: pagesCount ?? this.pagesCount,
      paginatedList: paginatedList ?? this.paginatedList,
      selectedTags: selectedTags ?? this.selectedTags,
      blogMarketingList: blogMarketingList ?? this.blogMarketingList,
      data: data ?? this.data,
      headerData: headerData ?? this.headerData,
      blogsList: blogsList ?? this.blogsList,
      categoriesList: categoriesList ?? this.categoriesList,
      tagsList: tagsList ?? this.tagsList,
      blogArticleData: blogArticleData ?? this.blogArticleData,
      relatedBlogs: relatedBlogs ?? this.relatedBlogs,
    );
  }

  @override
  List<Object> get props => <Object>[
        error,
        selectedCategory,
        loading,
        data ?? '',
        pagesCount,
        currentPageIndex,
        relatedBlogs ?? [],
        paginatedList ?? [],
        selectedTags,
        headerData ?? '',
        blogsList ?? [],
        blogMarketingList ?? [],
        categoriesList ?? [],
        tagsList ?? [],
        blogArticleData ?? [],
      ];
}
