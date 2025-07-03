import 'package:dio/dio.dart';

import '../../core/error/exceptions.dart';
import '../../main.dart';
import '../model/about_us_model/about_us_headermodel.dart';
import '../model/about_us_model/about_us_model.dart';
import '../model/about_us_model/about_us_our_secret_model.dart';
import '../model/about_us_model/about_us_our_values_model.dart';
import '../model/about_us_model/about_us_our_vision_service.dart';
import '../model/about_us_model/about_us_shield_model.dart';
import '../services/about_us_service.dart';

class AboutUsDataSource {
  AboutUsDataSource();
  final AboutUsServices service = autoInjector.get<AboutUsServices>();
  Future<AboutUsModel> getAboutUsDataApi() async {
    try {
      final Response? response = await service.getAboutUsDataApi();
      final AboutUsModel model = AboutUsModel.fromJson(
        response?.data as Map<String, dynamic>,
      );
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

  Future<AboutUsHeaderModel> getAboutUsHeaderApi() async {
    try {
      final Response? response = await service.getAboutUsHeaderApi();
      final AboutUsHeaderModel model =
          AboutUsHeaderModel.fromJson(response?.data as Map<String, dynamic>);
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

  Future<AboutUsOurShieldModel> getAboutUsShieldApi() async {
    try {
      final Response? response = await service.getAboutUsShieldApi();
      final AboutUsOurShieldModel model = AboutUsOurShieldModel.fromJson(
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

  Future<AboutUsOurSecretModel> getOurSecretsApi() async {
    try {
      final Response? response = await service.getOurSecretsApi();
      final AboutUsOurSecretModel model = AboutUsOurSecretModel.fromJson(
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

  Future<AboutUsOurVisionModel> getOurVisionApi() async {
    try {
      final Response? response = await service.getOurVisionApi();
      final AboutUsOurVisionModel model = AboutUsOurVisionModel.fromJson(
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

  Future<AboutUsOurValuesModel> getOurValuesApi() async {
    try {
      final Response? response = await service.getOurValuesApi();
      final AboutUsOurValuesModel model = AboutUsOurValuesModel.fromJson(
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
}
