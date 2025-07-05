part of 'methodology_bloc.dart';

enum MobileNoStatus { initial, success, failure }

final class MethodologyState extends Equatable {
  final String error;
  final bool loading;
  final MethodologyData? data;

  const MethodologyState({
    this.error = '',
    this.loading = false,
    this.data,
  });

  MethodologyState copyWith({
    final String? error,
    final bool? loading,
    final MethodologyData? data,
  }) {
    return MethodologyState(
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
