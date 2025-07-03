part of 'resources_bloc.dart';

enum MobileNoStatus { initial, success, failure }

final class ResourcesState extends Equatable {
  final String error;
  final bool loading;
  final ResourceHeaderData? headerData;
  final List<Datum>? loadingData;

  const ResourcesState({
    this.error = '',
    this.loading = false,
    this.headerData,
    this.loadingData,
  });

  ResourcesState copyWith({
    final String? error,
    final bool? loading,
    final ResourceHeaderData? headerData,
    final List<Datum>? loadingData,
  }) {
    return ResourcesState(
      error: error ?? this.error,
      loading: loading ?? this.loading,
      headerData: headerData ?? this.headerData,
      loadingData: loadingData ?? this.loadingData,
    );
  }

  @override
  List<Object> get props => <Object>[
        error,
        loading,
        headerData ?? '',
        loadingData ?? [],
      ];
}
