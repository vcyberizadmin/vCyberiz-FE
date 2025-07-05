part of 'footer_bloc.dart';

final class FooterState extends Equatable {
  final String error;
  final bool loading;
  final bool subscribed;
  final FooterData? data;

  const FooterState({
    this.error = '',
    this.loading = false,
    this.subscribed = false,
    this.data,
  });

  FooterState copyWith({
    final String? error,
    final bool? loading,
    final bool? subscribed,
    final FooterData? data,
  }) {
    return FooterState(
      error: error ?? this.error,
      loading: loading ?? this.loading,
      subscribed: subscribed ?? this.subscribed,
      data: data ?? this.data,
    );
  }

  @override
  List<Object> get props => <Object>[
        error,
        loading,
        subscribed,
        data ?? '',
      ];
}
