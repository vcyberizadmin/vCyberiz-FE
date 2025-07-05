part of 'news_bloc.dart';

enum MobileNoStatus { initial, success, failure }

final class NewsState extends Equatable {
  final String error;
  final bool loading;
  final int currentPageIndex;
  final String selectedCategory;
  final List<BlogTag> selectedTags;
  final int pagesCount;
  final List<NewsListData>? paginatedList;
  final BlogsData? data;
  final NewsHeaderData? headerData;
  final List<NewsListData>? newsList;
  final List<EBookCard>? ebookList;
  final BlogMarketingData? blogMarketingList;
  final CategoryData? categoriesList;
  final BlogTagsData? tagsList;
  final NewsArticleData? newsArticleData;
  final List<RelatedBlogs>? relatedBlogs;
  const NewsState({
    this.error = '',
    this.selectedCategory = '',
    this.loading = false,
    this.currentPageIndex = 0,
    this.pagesCount = 0,
    this.paginatedList,
    this.selectedTags = const [],
    this.data,
    this.headerData,
    this.ebookList,
    this.newsList,
    this.blogMarketingList,
    this.categoriesList,
    this.tagsList,
    this.newsArticleData,
    this.relatedBlogs,
  });

  NewsState copyWith({
    final String? error,
    final String? selectedCategory,
    final bool? loading,
    final int? currentPageIndex,
    final int? pagesCount,
    final List<NewsListData>? paginatedList,
    final List<BlogTag>? selectedTags,
    final BlogsData? data,
    final NewsHeaderData? headerData,
    final List<NewsListData>? newsList,
    final List<EBookCard>? ebookList,
    final BlogMarketingData? blogMarketingList,
    final List<RelatedBlogs>? relatedBlogs,
    final CategoryData? categoriesList,
    final BlogTagsData? tagsList,
    final NewsArticleData? newsArticleData,
  }) {
    return NewsState(
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
      newsList: newsList ?? this.newsList,
      categoriesList: categoriesList ?? this.categoriesList,
      tagsList: tagsList ?? this.tagsList,
      newsArticleData: newsArticleData ?? this.newsArticleData,
      relatedBlogs: relatedBlogs ?? this.relatedBlogs,
      ebookList: ebookList ?? this.ebookList,
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
        newsList ?? [],
        blogMarketingList ?? [],
        categoriesList ?? [],
        tagsList ?? [],
        newsArticleData ?? [],
        ebookList ?? []
      ];
}
