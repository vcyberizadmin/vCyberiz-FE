part of 'our_solutions_bloc.dart';

sealed class OurSolutionsEvent extends Equatable {
  const OurSolutionsEvent();

  @override
  List<Object> get props => <Object>[];
}

//!------------------(fetching Mobile Number Api Section)--------------------
final class GetOurSolutionsDataEvent extends OurSolutionsEvent {
  const GetOurSolutionsDataEvent();
} //!------------------(fetching Mobile Number Api Section)--------------------

class SelectIndexEvent extends OurSolutionsEvent {
  final int index;
  const SelectIndexEvent({required this.index});
}
