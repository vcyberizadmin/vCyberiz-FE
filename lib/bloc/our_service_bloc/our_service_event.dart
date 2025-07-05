part of 'our_service_bloc.dart';

sealed class OurServiceEvent extends Equatable {
  const OurServiceEvent();

  @override
  List<Object> get props => <Object>[];
}

final class GetOurServiceDataEvent extends OurServiceEvent {
  const GetOurServiceDataEvent();
}

final class GetSearchEvent extends OurServiceEvent {
  final String searchText;

  const GetSearchEvent({required this.searchText});
}

final class GetServicedetailsEvent extends OurServiceEvent {
  final String documentId;

  const GetServicedetailsEvent({required this.documentId});
}

final class GetServiceOfferingEvent extends OurServiceEvent {
  final String documentId;

  const GetServiceOfferingEvent({required this.documentId});
}

final class GetOurServiceHeaderEvent extends OurServiceEvent {
  const GetOurServiceHeaderEvent();
}

final class GetDirectApproachEvent extends OurServiceEvent {
  const GetDirectApproachEvent();
}

final class GetOurServiceTabsEvent extends OurServiceEvent {
  const GetOurServiceTabsEvent();
}

class TabClickEvent extends OurServiceEvent {
  final int selectedItem;
  TabClickEvent(this.selectedItem);
  @override
  List<Object> get props => [selectedItem];
}

class ToggleScopeSectionEvent extends OurServiceEvent {
  final int index;
  const ToggleScopeSectionEvent(this.index);
}
