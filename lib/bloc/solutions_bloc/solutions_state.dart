part of 'solutions_bloc.dart';

enum MobileNoStatus { initial, success, failure }

final class SolutionsState extends Equatable {
  final String error;
  final bool loading;
  final HeaderData? headerData;

  final SolutionsWeOfferData? solutionsWeOffer;
  final WhatWeHaveDoneData? whatWeHaveDoneData;
  final SolutionsHeaderData? solutionsHeaderData;
  final MicrosoftSecurityData? microsoftSecurityData;
  final EmergencyResponceData? emergencyResponceData;
  final NeedHelpData? needHelpData;
  const SolutionsState({
    this.error = '',
    this.loading = false,
    this.headerData,
    this.solutionsWeOffer,
    this.whatWeHaveDoneData,
    this.solutionsHeaderData,
    this.microsoftSecurityData,
    this.emergencyResponceData,
    this.needHelpData,
  });

  SolutionsState copyWith({
    final String? error,
    final bool? loading,
    final HeaderData? headerData,
    final SolutionsWeOfferData? solutionsWeOffer,
    final WhatWeHaveDoneData? whatWeHaveDoneData,
    final SolutionsHeaderData? solutionsHeaderData,
    final MicrosoftSecurityData? microsoftSecurityData,
    final EmergencyResponceData? emergencyResponceData,
    final NeedHelpData? needHelpData,
  }) {
    return SolutionsState(
      error: error ?? this.error,
      loading: loading ?? this.loading,
      headerData: headerData ?? this.headerData,
      solutionsWeOffer: solutionsWeOffer ?? this.solutionsWeOffer,
      whatWeHaveDoneData: whatWeHaveDoneData ?? this.whatWeHaveDoneData,
      solutionsHeaderData: solutionsHeaderData ?? this.solutionsHeaderData,
      microsoftSecurityData:
          microsoftSecurityData ?? this.microsoftSecurityData,
      emergencyResponceData:
          emergencyResponceData ?? this.emergencyResponceData,
      needHelpData: needHelpData ?? this.needHelpData,
    );
  }

  @override
  List<Object> get props => <Object>[
        error,
        loading,
        headerData ?? '',
        whatWeHaveDoneData ?? '',
        solutionsWeOffer ?? '',
        solutionsHeaderData ?? '',
        microsoftSecurityData ?? '',
        emergencyResponceData ?? '',
        needHelpData ?? '',
      ];
}
