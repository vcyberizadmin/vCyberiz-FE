part of 'contact_us_bloc.dart';

sealed class ContactUsEvent extends Equatable {
  const ContactUsEvent();

  @override
  List<Object> get props => <Object>[];
}

final class GetContactUsHeaderEvent extends ContactUsEvent {
  const GetContactUsHeaderEvent();
}

final class GetContactUsBannerEvent extends ContactUsEvent {
  const GetContactUsBannerEvent();
}

final class GetOurLocationsEvent extends ContactUsEvent {
  const GetOurLocationsEvent();
}

final class SelectCountryEvent extends ContactUsEvent {
  final String country;
  const SelectCountryEvent({
    required this.country,
  });
}

final class GetSubmitDetailsEvent extends ContactUsEvent {
  final String name;
  final String email;
  final String companyName;
  final String countryName;
  final String interest;
  final String comment;

  const GetSubmitDetailsEvent({
    required this.name,
    required this.email,
    required this.companyName,
    required this.countryName,
    required this.interest,
    required this.comment,
  });
}
