part of 'privacy_bloc.dart';

sealed class PrivacyEvent extends Equatable {
  const PrivacyEvent();

  @override
  List<Object> get props => <Object>[];
}

final class GetPrivacyDataEvent extends PrivacyEvent {
  const GetPrivacyDataEvent();
}

class UpdateSelectedItemEvent extends PrivacyEvent {
  final String item;

  const UpdateSelectedItemEvent(this.item);

  @override
  List<Object> get props => [item];
}
