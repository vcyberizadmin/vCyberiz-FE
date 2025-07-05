part of 'cookies_bloc.dart';

sealed class CookiesEvent extends Equatable {
  const CookiesEvent();

  @override
  List<Object> get props => <Object>[];
}

//!------------------(fetching Mobile Number Api Section)--------------------
final class GetCookiesDataEvent extends CookiesEvent {
  const GetCookiesDataEvent();
} //!------------------(fetching Mobile Number Api Section)--------------------

class UpdateIndexEvent extends CookiesEvent {
  final int index;

  const UpdateIndexEvent(this.index);

  @override
  List<Object> get props => [index];
}
