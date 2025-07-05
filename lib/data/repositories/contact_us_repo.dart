import 'package:logger/logger.dart';
import 'package:vcyberiz/data/model/contact_us_banner_model/contact_us_banner_model.dart';

import '../../core/error/exceptions.dart';
import '../../core/helper/logger.dart';
import '../data_source/contact_us_data_source.dart';
import '../model/contact_us_model/contact_us_header_model.dart';
import '../model/contact_us_model/contact_us_locations_model.dart';

class ContactUsRepository {
  final ContactUsDataSource _dataSource;

  ContactUsRepository({
    required ContactUsDataSource dataSource,
  }) : _dataSource = dataSource;
  Future<ContactUsHeaderModel> getContactUsHeaderApi() async {
    try {
      final ContactUsHeaderModel response =
          await _dataSource.getContactUsHeaderApi();
      return response;
    } on APIException catch (e) {
      logger.log(Level.debug, e);
      rethrow;
    }
  }

  Future<ContactUsBanner> getContactUsHeadingBanner() async {
    try {
      final ContactUsBanner response =
          await _dataSource.getContactUsHeadingBanner();
      return response;
    } on APIException catch (e) {
      logger.log(Level.debug, e);
      rethrow;
    }
  }

  Future<ContactUsLocationModel> getOurLocationsApi() async {
    try {
      final ContactUsLocationModel response =
          await _dataSource.getOurLocationsApi();
      return response;
    } on APIException catch (e) {
      logger.log(Level.debug, e);
      rethrow;
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
      final ContactUsHeaderModel response = await _dataSource.submitDetails(
        name,
        email,
        companyName,
        countryName,
        interest,
        comment,
      );
      return response;
    } on APIException catch (e) {
      logger.log(Level.debug, e);
      rethrow;
    }
  }
}
