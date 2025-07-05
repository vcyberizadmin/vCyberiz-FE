part of 'about_us_bloc.dart';

enum MobileNoStatus { initial, success, failure }

final class AboutUsState extends Equatable {
  final String error;
  final bool loading;
  final AboutUsData? homeData;
  final AboutUsHeaderData? headerData;
  final AboutUsOurShieldData? ourShieldData;
  final AboutUsOurSecretData? ourSecretData;
  final AboutUsOurVisionData? ourVisionData;
  final AboutUsOurValuesData? ourValuesData;

  // final AboutUsHeader? homeData;

  const AboutUsState({
    this.error = '',
    this.loading = false,
    this.homeData,
    this.headerData,
    this.ourShieldData,
    this.ourSecretData,
    this.ourVisionData,
    this.ourValuesData,
  });

  AboutUsState copyWith({
    final String? error,
    final bool? loading,
    final AboutUsData? homeAboutUsData,
    final AboutUsHeaderData? headerData,
    final AboutUsOurShieldData? ourShieldData,
    final AboutUsOurSecretData? ourSecretData,
    final AboutUsOurVisionData? ourVisionData,
    final AboutUsOurValuesData? ourValuesData,
  }) {
    return AboutUsState(
      error: error ?? this.error,
      loading: loading ?? this.loading,
      homeData: homeAboutUsData ?? homeData,
      headerData: headerData ?? this.headerData,
      ourShieldData: ourShieldData ?? this.ourShieldData,
      ourSecretData: ourSecretData ?? this.ourSecretData,
      ourVisionData: ourVisionData ?? this.ourVisionData,
      ourValuesData: ourValuesData ?? this.ourValuesData,
    );
  }

  @override
  List<Object> get props => <Object>[
        error,
        loading,
        homeData ?? '',
        headerData ?? '',
        ourShieldData ?? '',
        ourSecretData ?? '',
        ourVisionData ?? '',
        ourValuesData ?? '',
      ];
}
