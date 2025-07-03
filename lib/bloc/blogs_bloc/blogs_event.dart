part of 'blogs_bloc.dart';

sealed class BlogsEvent extends Equatable {
  const BlogsEvent();

  @override
  List<Object> get props => <Object>[];
}

final class GetBlogsDataEvent extends BlogsEvent {
  const GetBlogsDataEvent();
}

final class GetTagsEvent extends BlogsEvent {
  final BlogTag selectedTags;
  final int itemCount;

  const GetTagsEvent({
    required this.selectedTags,
    required this.itemCount,
  });
}

final class GetPaginationDataEvent extends BlogsEvent {
  final int currentIndex;
  final int itemCount;
  final List<BlogsListData>? dataList;
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

final class GetBlogsHeaderEvent extends BlogsEvent {
  const GetBlogsHeaderEvent();
}

final class GetBlogsListEvent extends BlogsEvent {
  const GetBlogsListEvent();
}

final class GetBlogCategoryEvent extends BlogsEvent {
  const GetBlogCategoryEvent();
}

final class GetBlogTagsEvent extends BlogsEvent {
  const GetBlogTagsEvent();
}

final class GetMarketingEvent extends BlogsEvent {
  const GetMarketingEvent();
}

final class GetRelatedBlogsEvent extends BlogsEvent {
  const GetRelatedBlogsEvent();
}

final class GetBlogArticleEvent extends BlogsEvent {
  final String documentId;

  const GetBlogArticleEvent(this.documentId);
}
