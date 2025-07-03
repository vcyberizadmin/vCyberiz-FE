part of 'contact_us_bloc.dart';

enum SubmitStatus { initial, success, failure }

final class ContactUsState extends Equatable {
  final String error;
  final String selectedCountry;
  final bool loading;
  final ContactUsHeaderData? headerData;
  final ContactUsBanner? bannerData;
  final ContactUsLocationData? locationsData;
  final SubmitStatus submitStatus;
  const ContactUsState({
    this.error = '',
    this.selectedCountry = '',
    this.loading = false,
    this.headerData,
    this.bannerData,
    this.locationsData,
    this.submitStatus = SubmitStatus.initial,
  });

  ContactUsState copyWith({
    final String? error,
    final String? selectedCountry,
    final bool? loading,
    final ContactUsHeaderData? headerData,
    final ContactUsBanner? bannerData,
    final ContactUsLocationData? locationsData,
    final SubmitStatus? submitStatus,
  }) {
    return ContactUsState(
      error: error ?? this.error,
      selectedCountry: selectedCountry ?? this.selectedCountry,
      loading: loading ?? this.loading,
      headerData: headerData ?? this.headerData,
      bannerData: bannerData ?? this.bannerData,
      locationsData: locationsData ?? this.locationsData,
      submitStatus: submitStatus ?? this.submitStatus,
    );
  }

  @override
  List<Object> get props => <Object>[
        error,
        selectedCountry,
        loading,
        headerData ?? '',
        bannerData ?? '',
        locationsData ?? '',
        submitStatus,
      ];
}
