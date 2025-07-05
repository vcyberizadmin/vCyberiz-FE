part of 'news_bloc.dart';

sealed class NewsEvent extends Equatable {
  const NewsEvent();

  @override
  List<Object> get props => <Object>[];
}

final class GetTagsEvent extends NewsEvent {
  final BlogTag selectedTags;
  final int itemCount;

  const GetTagsEvent({
    required this.selectedTags,
    required this.itemCount,
  });
}

final class GetPaginationDataEvent extends NewsEvent {
  final int currentIndex;
  final int itemCount;
  final List<NewsListData>? dataList;
  final List<BlogTag> selectedTags;
  final String searchText;
  final String selectedCategory;

  const GetPaginationDataEvent({
    required this.currentIndex,
    required this.itemCount,
    this.dataList,
    required this.searchText,
    required this.selectedTags,
    required this.selectedCategory,
  });
}

final class GetNewsHeaderEvent extends NewsEvent {
  const GetNewsHeaderEvent();
}

final class GetNewsListEvent extends NewsEvent {
  const GetNewsListEvent();
}

final class GetEbookListEvent extends NewsEvent {
  const GetEbookListEvent();
}

final class GetCategoryEvent extends NewsEvent {
  const GetCategoryEvent();
}

final class GetAllTagsEvent extends NewsEvent {
  const GetAllTagsEvent();
}

final class GetMarketingEvent extends NewsEvent {
  const GetMarketingEvent();
}

final class GetRelatedBlogsEvent extends NewsEvent {
  const GetRelatedBlogsEvent();
}

final class GetNewsArticleEvent extends NewsEvent {
  final String documentId;

  const GetNewsArticleEvent(this.documentId);
}
