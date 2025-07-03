part of 'partners_bloc.dart';

final class PartnersState extends Equatable {
  final PartnersHeaderData? headerData;
  final TechnologyData? technology;
  final SecureFuture? secureFuture;
  final String error;
  final bool loading;
  final int selectedItem;

  const PartnersState({
    this.headerData,
    this.technology,
    this.secureFuture,
    this.error = '',
    this.loading = false,
    this.selectedItem = 0,
  });

  PartnersState copyWith({
    final PartnersHeaderData? headerData,
    final TechnologyData? technology,
    final SecureFuture? secureFuture,
    final String? error,
    final bool? loading,
    final int? selectedItem,
  }) {
    return PartnersState(
      headerData: headerData ?? this.headerData,
      technology: technology ?? this.technology,
      secureFuture: secureFuture ?? this.secureFuture,
      error: error ?? this.error,
      loading: loading ?? this.loading,
      selectedItem: selectedItem ?? this.selectedItem,
    );
  }

  @override
  List<Object> get props => <Object>[
        error,
        loading,
        headerData ?? '',
        technology ?? '',
        secureFuture ?? '',
        selectedItem,
      ];
}
