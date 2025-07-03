part of 'cookies_bloc.dart';

enum MobileNoStatus { initial, success, failure }

final class CookiesState extends Equatable {
  final String error;
  final bool loading;
  final int index;
  final CookiesData? data;

  const CookiesState({
    this.error = '',
    this.loading = false,
    this.index = 1,
    this.data,
  });

  CookiesState copyWith({
    final String? error,
    final bool? loading,
    final int? index,
    final CookiesData? data,
  }) {
    return CookiesState(
      error: error ?? this.error,
      loading: loading ?? this.loading,
      index: index ?? this.index,
      data: data ?? this.data,
    );
  }

  @override
  List<Object> get props => <Object>[
        error,
        index,
        loading,
        data ?? '',
      ];
}
