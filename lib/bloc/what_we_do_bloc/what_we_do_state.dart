part of 'what_we_do_bloc.dart';

enum MobileNoStatus { initial, success, failure }

final class WhatWeDoState extends Equatable {
  final String error;
  final bool loading;
  final WhatWeDoData? data;

  const WhatWeDoState({
    this.error = '',
    this.loading = false,
    this.data,
  });

  WhatWeDoState copyWith({
    final String? error,
    final bool? loading,
    final WhatWeDoData? data,
  }) {
    return WhatWeDoState(
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
