part of 'why_work_with_us_bloc.dart';

sealed class WhyWorkWithUsEvent extends Equatable {
  const WhyWorkWithUsEvent();

  @override
  List<Object> get props => <Object>[];
}

//!------------------(get why work data Api Section)--------------------
final class GetWhyWorkUsDataEvent extends WhyWorkWithUsEvent {
  const GetWhyWorkUsDataEvent();
}
