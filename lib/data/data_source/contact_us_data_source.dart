import 'package:dio/dio.dart';
import 'package:vcyberiz/data/model/contact_us_banner_model/contact_us_banner_model.dart';

import '../../core/error/exceptions.dart';
import '../../main.dart';
import '../model/contact_us_model/contact_us_header_model.dart';
import '../model/contact_us_model/contact_us_locations_model.dart';
import '../services/contact_us_service.dart';

class ContactUsDataSource {
  ContactUsDataSource();
  final ContactUsServices service = autoInjector.get<ContactUsServices>();
  Future<ContactUsHeaderModel> getContactUsHeaderApi() async {
    try {
      final Response? response = await service.getContactUsHeaderApi();
      final ContactUsHeaderModel model =
          ContactUsHeaderModel.fromJson(response?.data as Map<String, dynamic>);
      return model;
    } on APIException {
      rethrow;
    } catch (e) {
      throw APIException(
        message: e.toString(),
        statusCode: 505,
      );
    }
  }

  Future<ContactUsBanner> getContactUsHeadingBanner() async {
    try {
      final Response response = await service.getContactUsHeadingBanner();
      final ContactUsBanner model =
          ContactUsBanner.fromJson(response.data as Map<String, dynamic>);
      return model;
    } on APIException {
      rethrow;
    } catch (e) {
      throw APIException(
        message: e.toString(),
        statusCode: 505,
      );
    }
  }

  Future<ContactUsLocationModel> getOurLocationsApi() async {
    try {
      final Response? response = await service.getOurLocationsApi();
      final ContactUsLocationModel model = ContactUsLocationModel.fromJson(
          response?.data as Map<String, dynamic>);
      return model;
    } on APIException {
      rethrow;
    } catch (e) {
      throw APIException(
        message: e.toString(),
        statusCode: 505,
      );
    }
  }

  Future<ContactUsHeaderModel> submitDetails(
    String name,
    String email,
    String companyName,
    String countryName,
    String interest,
    String comment,
  ) async {
    try {
      final Response? response = await service.submitDetails(
        name,
        email,
        companyName,
        countryName,
        interest,
        comment,
      );
      final ContactUsHeaderModel model =
          ContactUsHeaderModel.fromJson(response?.data as Map<String, dynamic>);
      return model;
    } on APIException {
      rethrow;
    } catch (e) {
      throw APIException(
        message: e.toString(),
        statusCode: 505,
      );
    }
  }
}
