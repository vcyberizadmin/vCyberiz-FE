part of 'our_approach_bloc.dart';

enum MobileNoStatus { initial, success, failure }

final class OurApproachState extends Equatable {
  final String error;
  final bool loading;
  final ApproachData? data;

  const OurApproachState({
    this.error = '',
    this.loading = false,
    this.data,
  });

  OurApproachState copyWith({
    final String? error,
    final bool? loading,
    final ApproachData? data,
  }) {
    return OurApproachState(
      error: error ?? this.error,
      loading: loading ?? this.loading,
      data: data ?? this.data,
    );
  }

  @override
  List<Object> get props => <Object>[
        error,
        loading,
        data ?? [],
      ];
}
