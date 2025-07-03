part of 'about_us_bloc.dart';

sealed class AboutUsEvent extends Equatable {
  const AboutUsEvent();

  @override
  List<Object> get props => <Object>[];
}

final class GetAboutUsDataEvent extends AboutUsEvent {
  const GetAboutUsDataEvent();
}

final class GetAboutUsHeaderEvent extends AboutUsEvent {
  const GetAboutUsHeaderEvent();
}

final class GetAboutUsShieldEvent extends AboutUsEvent {
  const GetAboutUsShieldEvent();
}

final class GetAboutUsOurSecretsEvent extends AboutUsEvent {
  const GetAboutUsOurSecretsEvent();
}

final class GetAboutUsOurVisionEvent extends AboutUsEvent {
  const GetAboutUsOurVisionEvent();
}

final class GetAboutUsOurValuesEvent extends AboutUsEvent {
  const GetAboutUsOurValuesEvent();
}
