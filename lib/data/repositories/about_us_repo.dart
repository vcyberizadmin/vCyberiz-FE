import 'package:logger/logger.dart';
import 'package:vcyberiz/data/model/about_us_model/about_us_model.dart';

import '../../core/error/exceptions.dart';
import '../../core/helper/logger.dart';
import '../data_source/about_us_data_source.dart';
import '../model/about_us_model/about_us_headermodel.dart';
import '../model/about_us_model/about_us_our_secret_model.dart';
import '../model/about_us_model/about_us_our_values_model.dart';
import '../model/about_us_model/about_us_our_vision_service.dart';
import '../model/about_us_model/about_us_shield_model.dart';

class AboutUsRepository {
  final AboutUsDataSource _dataSource;

  AboutUsRepository({
    required AboutUsDataSource dataSource,
  }) : _dataSource = dataSource;

  Future<AboutUsModel> getAboutUsDataApi() async {
    try {
      final AboutUsModel response = (await _dataSource.getAboutUsDataApi());
      return response;
    } on APIException catch (e) {
      logger.log(Level.debug, e);
      rethrow;
    }
  }

  Future<AboutUsHeaderModel> getAboutUsHeaderApi() async {
    try {
      final AboutUsHeaderModel response =
          await _dataSource.getAboutUsHeaderApi();
      return response;
    } on APIException catch (e) {
      logger.log(Level.debug, e);
      rethrow;
    }
  }

  Future<AboutUsOurShieldModel> getAboutUsShieldApi() async {
    try {
      final AboutUsOurShieldModel response =
          (await _dataSource.getAboutUsShieldApi());
      return response;
    } on APIException catch (e) {
      logger.log(Level.debug, e);
      rethrow;
    }
  }

  Future<AboutUsOurSecretModel> getOurSecretsApi() async {
    try {
      final AboutUsOurSecretModel response =
          (await _dataSource.getOurSecretsApi());
      return response;
    } on APIException catch (e) {
      logger.log(Level.debug, e);
      rethrow;
    }
  }

  Future<AboutUsOurVisionModel> getOurVisionApi() async {
    try {
      final AboutUsOurVisionModel response =
          await _dataSource.getOurVisionApi();
      return response;
    } on APIException catch (e) {
      logger.log(Level.debug, e);
      rethrow;
    }
  }

  Future<AboutUsOurValuesModel> getOurValuesApi() async {
    try {
      final AboutUsOurValuesModel response =
          await _dataSource.getOurValuesApi();
      return response;
    } on APIException catch (e) {
      logger.log(Level.debug, e);
      rethrow;
    }
  }
}
