part of 'privacy_bloc.dart';

enum MobileNoStatus { initial, success, failure }

final class PrivacyState extends Equatable {
  final String error;
  final bool loading;
  final PrivacyData? data;

  final String selectedItem;

  const PrivacyState({
    this.error = '',
    this.loading = false,
    this.data,
    this.selectedItem = '',
  });

  PrivacyState copyWith({
    final String? error,
    final bool? loading,
    final PrivacyData? data,
    final String? selectedItem,
  }) {
    return PrivacyState(
      error: error ?? this.error,
      loading: loading ?? this.loading,
      data: data ?? this.data,
      selectedItem: selectedItem ?? this.selectedItem,
    );
  }

  @override
  List<Object> get props => <Object>[
        error,
        loading,
        data ?? '',
        selectedItem,
      ];
}
