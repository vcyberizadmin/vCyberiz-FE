part of 'partners_bloc.dart';

sealed class PartnersEvent extends Equatable {
  const PartnersEvent();

  @override
  List<Object> get props => <Object>[];
}

final class GetPartnersHeaderEvent extends PartnersEvent {
  const GetPartnersHeaderEvent();
}

final class GetTechnologyPartnersEvent extends PartnersEvent {
  const GetTechnologyPartnersEvent();
}

final class GetSecureStrongFutureEvent extends PartnersEvent {
  const GetSecureStrongFutureEvent();
}

class TabClickEvent extends PartnersEvent {
  final int selectedItem;
  const TabClickEvent(this.selectedItem);
}
