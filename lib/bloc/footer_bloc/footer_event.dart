part of 'footer_bloc.dart';

class FooterEvent extends Equatable {
  const FooterEvent();

  @override
  List<Object> get props => <Object>[];
}

final class GetFooterEvent extends FooterEvent {
  const GetFooterEvent();
}

final class SubscribeEvent extends FooterEvent {
  final String email;
  const SubscribeEvent(this.email);

  @override
  List<Object> get props => <Object>[email];
}
