part of 'headers_bloc.dart';

final class HeadersState extends Equatable {
  final String error;
  final bool loading;
  final bool expandService;
  final bool expandSolution;
  final bool expandAboutUs;
  final HeaderData? data;
  final List<Datum>? loadingData;

  const HeadersState({
    this.error = '',
    this.loading = false,
    this.expandService = false,
    this.expandSolution = false,
    this.expandAboutUs = false,
    this.data,
    this.loadingData,
  });

  HeadersState copyWith({
    final String? error,
    final bool? loading,
    final bool? expandService,
    final bool? expandSolution,
    final bool? expandAboutUs,
    final HeaderData? data,
    final List<Datum>? loadingData,
  }) {
    return HeadersState(
      error: error ?? this.error,
      loading: loading ?? this.loading,
      expandService: expandService ?? this.expandService,
      expandSolution: expandSolution ?? this.expandSolution,
      expandAboutUs: expandAboutUs ?? this.expandAboutUs,
      data: data ?? this.data,
      loadingData: loadingData ?? this.loadingData,
    );
  }

  @override
  List<Object> get props => <Object>[
        error,
        expandService,
        expandSolution,
        expandAboutUs,
        loading,
        data ?? '',
        loadingData ?? [],
      ];
}
