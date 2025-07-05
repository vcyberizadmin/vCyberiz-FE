part of 'careers_bloc.dart';

sealed class CareersEvent extends Equatable {
  const CareersEvent();

  @override
  List<Object> get props => <Object>[];
}

final class GetCareersHeaderEvent extends CareersEvent {
  const GetCareersHeaderEvent();
}

final class GetCareerFilterDataEvent extends CareersEvent {
  const GetCareerFilterDataEvent();
}

final class GetCareerListEvent extends CareersEvent {
  final int itemCount;

  const GetCareerListEvent({required this.itemCount});
}

final class GetCareerDetailsEvent extends CareersEvent {
  final String documentId;

  const GetCareerDetailsEvent({required this.documentId});
}

final class SelectFilterEvent extends CareersEvent {
  final String text;
  final String header;

  const SelectFilterEvent({
    required this.text,
    required this.header,
  });
}

final class ClearFilterEvent extends CareersEvent {
  const ClearFilterEvent();
}

final class UploadPdfEvent extends CareersEvent {
  final PlatformFile? file;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String linkedIn;

  const UploadPdfEvent({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.linkedIn,
    required this.file,
  });
}

final class SubmitEvent extends CareersEvent {
  final String url;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String linkedIn;
  const SubmitEvent({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.linkedIn,
    required this.url,
  });
}

final class GetPaginationDataEvent extends CareersEvent {
  final int currentIndex;
  final int itemCount;
  final List<CareerListData>? dataList;
  final String search;
  final String locationSearch;

  const GetPaginationDataEvent({
    required this.currentIndex,
    required this.itemCount,
    this.dataList,
    required this.search,
    required this.locationSearch,
  });
}
