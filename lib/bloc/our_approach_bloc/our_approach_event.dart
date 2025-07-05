part of 'our_approach_bloc.dart';

sealed class OurApproachEvent extends Equatable {
  const OurApproachEvent();

  @override
  List<Object> get props => <Object>[];
}

//!------------------(fetching Mobile Number Api Section)--------------------
final class GetOurApproachDataEvent extends OurApproachEvent {
  const GetOurApproachDataEvent();
} //!------------------(fetching Mobile Number Api Section)--------------------

final class GetCategoryDataEvent extends OurApproachEvent {
  const GetCategoryDataEvent();
}

//!------------------------(Who We Are)--------------
final class WhoWeAreEvent extends OurApproachEvent {
  const WhoWeAreEvent();
}
