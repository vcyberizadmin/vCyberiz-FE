part of 'methodology_bloc.dart';

sealed class MethodologyEvent extends Equatable {
  const MethodologyEvent();

  @override
  List<Object> get props => <Object>[];
}

//!------------------(fetching Mobile Number Api Section)--------------------
final class GetMethodologyDataEvent extends MethodologyEvent {
  const GetMethodologyDataEvent();
}
