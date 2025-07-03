part of 'headers_bloc.dart';

sealed class HeadersEvent extends Equatable {
  const HeadersEvent();

  @override
  List<Object> get props => <Object>[];
}

final class GetHeaderDataEvent extends HeadersEvent {
  const GetHeaderDataEvent();
}

final class ServiceOnTapEvent extends HeadersEvent {
  const ServiceOnTapEvent();
}

final class SolutionOnTapEvent extends HeadersEvent {
  const SolutionOnTapEvent();
}

final class AboutUsOnTapEvent extends HeadersEvent {
  const AboutUsOnTapEvent();
}

final class CloseEvent extends HeadersEvent {
  const CloseEvent();
}

final class GetHeaderLoadingEvent extends HeadersEvent {
  const GetHeaderLoadingEvent();
}
