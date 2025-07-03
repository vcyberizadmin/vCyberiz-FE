import 'package:equatable/equatable.dart';

import '../our_service_bloc/our_service_bloc.dart';

sealed class HomeEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class ToggleIsTopContainerVisible extends HomeEvent {
  final bool value;
  ToggleIsTopContainerVisible(this.value);
  @override
  List<Object> get props => [value];
}

// class ToggleIsErsExpanded extends HomeEvent {}

class TabClickEvent extends HomeEvent {
  final ServiceTab selectedItem;
  TabClickEvent(this.selectedItem);
  @override
  List<Object> get props => [selectedItem];
}

class ShowChatContainer extends HomeEvent {
  final bool value;
  ShowChatContainer(this.value);
}

class ApiStarted extends HomeEvent {
  final String apiName;

  ApiStarted(this.apiName);
}

class ApiSuccess extends HomeEvent {
  final String apiName;

  ApiSuccess(this.apiName);
}

class ApiFailure extends HomeEvent {
  final String apiName;
  final String errorMessage;

  ApiFailure(this.apiName, this.errorMessage);
}

class GetSectionsEvent extends HomeEvent {
  GetSectionsEvent();
}

class PopUpEvent extends HomeEvent {
  PopUpEvent();
}

class GetSearchEvent extends HomeEvent {
  final String searchText;

  GetSearchEvent({required this.searchText});
}
