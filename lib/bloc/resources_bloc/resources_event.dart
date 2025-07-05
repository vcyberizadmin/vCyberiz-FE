part of 'resources_bloc.dart';

sealed class ResourcesEvent extends Equatable {
  const ResourcesEvent();

  @override
  List<Object> get props => <Object>[];
}

//!------------------(fetching Mobile Number Api Section)--------------------
final class GetResourceHeaderDataEvent extends ResourcesEvent {
  const GetResourceHeaderDataEvent();
} //!------------------(fetching header  Api Section)--------------------

final class GetHeaderLoadingEvent extends ResourcesEvent {
  const GetHeaderLoadingEvent();
}
