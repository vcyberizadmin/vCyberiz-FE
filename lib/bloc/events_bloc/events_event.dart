part of 'events_bloc.dart';

sealed class EventsEvent extends Equatable {
  const EventsEvent();

  @override
  List<Object> get props => <Object>[];
}

final class GetEventsHeaderEvent extends EventsEvent {
  const GetEventsHeaderEvent();
}

final class GetEventsListEvent extends EventsEvent {
  const GetEventsListEvent();
}

final class GetTagsEvent extends EventsEvent {
  final BlogTag selectedTags;
  final int itemCount;

  const GetTagsEvent({
    required this.selectedTags,
    required this.itemCount,
  });
}

final class GetPaginationDataEvent extends EventsEvent {
  final int currentIndex;
  final int itemCount;
  final List<EventsListData>? dataList;
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

final class GetCategoryEvent extends EventsEvent {
  const GetCategoryEvent();
}

final class GetEventTagsEvent extends EventsEvent {
  const GetEventTagsEvent();
}

final class GetMarketingEvent extends EventsEvent {
  const GetMarketingEvent();
}

final class GetRelatedEventsEvent extends EventsEvent {
  const GetRelatedEventsEvent();
}

final class GetRegisterDetailsEvent extends EventsEvent {
  const GetRegisterDetailsEvent();
}

final class RegisterEventsEvent extends EventsEvent {
  final String name;
  final String email;
  final String mobile;
  final String eventName;
  final String eventId;
  const RegisterEventsEvent({
    required this.name,
    required this.email,
    required this.mobile,
    required this.eventName,
    required this.eventId,
  });
}

final class GetEventdetailsEvent extends EventsEvent {
  final String documentId;

  const GetEventdetailsEvent({required this.documentId});
}
