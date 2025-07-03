part of 'why_work_with_us_bloc.dart';

enum MobileNoStatus { initial, success, failure }

final class WhyWorkWithUsState extends Equatable {
  final String error;
  final bool loading;
  final WhyWorkData? data;

  const WhyWorkWithUsState({
    this.error = '',
    this.loading = false,
    this.data,
  });

  WhyWorkWithUsState copyWith({
    final String? error,
    final bool? loading,
    final WhyWorkData? data,
  }) {
    return WhyWorkWithUsState(
      error: error ?? this.error,
      loading: loading ?? this.loading,
      data: data ?? this.data,
    );
  }

  @override
  List<Object> get props => <Object>[
        error,
        loading,
        data ?? '',
      ];
}
