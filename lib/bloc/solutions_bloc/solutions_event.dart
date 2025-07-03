part of 'solutions_bloc.dart';

sealed class SolutionsEvent extends Equatable {
  const SolutionsEvent();

  @override
  List<Object> get props => <Object>[];
}

final class GetHeaderEvent extends SolutionsEvent {
  const GetHeaderEvent();
}

final class GetSolutionsHeaderEvent extends SolutionsEvent {
  const GetSolutionsHeaderEvent();
}

final class GetMicrosoftSecurityEvent extends SolutionsEvent {
  const GetMicrosoftSecurityEvent();
}

final class GetEmergencyResponceApiEvent extends SolutionsEvent {
  const GetEmergencyResponceApiEvent();
}

final class GetNeedHelpApiEvent extends SolutionsEvent {
  const GetNeedHelpApiEvent();
}

final class GetWhatWeHaveDoneEvent extends SolutionsEvent {
  const GetWhatWeHaveDoneEvent();
}

final class GetSolutionsWeOfferEvent extends SolutionsEvent {
  const GetSolutionsWeOfferEvent();
}
