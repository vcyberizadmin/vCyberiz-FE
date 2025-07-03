part of 'our_solutions_bloc.dart';

enum MobileNoStatus { initial, success, failure }

final class OurSolutionsState extends Equatable {
  final String error;
  final bool loading;
  final OurSolutionsData? data;
  final String currentImageUrl;
  final int selectedIndex;
  const OurSolutionsState({
    this.error = '',
    this.loading = false,
    this.data,
    this.currentImageUrl = "",
    this.selectedIndex = 0,
  });

  OurSolutionsState copyWith({
    final String? error,
    final bool? loading,
    final OurSolutionsData? data,
    String? currentImageUrl,
    int? selectedIndex,
  }) {
    return OurSolutionsState(
      error: error ?? this.error,
      loading: loading ?? this.loading,
      data: data ?? this.data,
      currentImageUrl: currentImageUrl ?? this.currentImageUrl,
      selectedIndex: selectedIndex ?? this.selectedIndex,
    );
  }

  @override
  List<Object> get props => <Object>[
        error,
        loading,
        data ?? '',
        currentImageUrl,
        selectedIndex,
      ];
}
