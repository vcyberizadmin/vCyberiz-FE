part of 'what_we_do_bloc.dart';

sealed class WhatWeDoEvent extends Equatable {
  const WhatWeDoEvent();

  @override
  List<Object> get props => <Object>[];
}

//!------------------(fetching Mobile Number Api Section)--------------------
final class GetWhatWeDoDataEvent extends WhatWeDoEvent {
  const GetWhatWeDoDataEvent();
} //!------------------(fetching Mobile Number Api Section)--------------------
