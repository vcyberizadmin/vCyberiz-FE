import 'package:dio/dio.dart';
import 'package:vcyberiz/data/model/solutions_model/emergency_responce_model.dart';
import 'package:vcyberiz/data/model/solutions_model/microsoft_security_model.dart';
import 'package:vcyberiz/data/model/solutions_model/need_help_model.dart';
import 'package:vcyberiz/data/model/solutions_model/solutions_header_data_model.dart';
import 'package:vcyberiz/data/services/solutions_service.dart';

import '../../core/error/exceptions.dart';
import '../../main.dart';
import '../model/solutions_model/solutions_header_model.dart';
import '../model/solutions_model/solutions_we_offer_model.dart';
import '../model/solutions_model/what_we_have_done_model.dart';

class SolutionsDataSource {
  SolutionsDataSource();
  final SolutionsServices service = autoInjector.get<SolutionsServices>();
  Future<SolutionsHeaderModel> getHeaderApi() async {
    try {
      final Response? response = await service.getHeaderApi();
      final SolutionsHeaderModel model =
          SolutionsHeaderModel.fromJson(response?.data as Map<String, dynamic>);
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

  Future<SolutionsHeaderDataModel> getSolutionsHeaderApi() async {
    try {
      final Response? response = await service.getSolutionsHeaderApi();
      final SolutionsHeaderDataModel model = SolutionsHeaderDataModel.fromJson(
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

  Future<MicrosoftSecurityModel> getMicrosoftSecurityApi() async {
    try {
      final Response? response = await service.getMicrosoftSecurityApi();
      final MicrosoftSecurityModel model = MicrosoftSecurityModel.fromJson(
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

  Future<EmergencyResponceModel> getEmergencyResponceApi() async {
    try {
      final Response? response = await service.getEmergencyResponceApi();
      final EmergencyResponceModel model = EmergencyResponceModel.fromJson(
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

  Future<NeedHelpModel> getNeedHelpApi() async {
    try {
      final Response? response = await service.getNeedHelpApi();
      final NeedHelpModel model =
          NeedHelpModel.fromJson(response?.data as Map<String, dynamic>);
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

  Future<SolutionsWeOfferModel> getSolutionsWeOfferApi() async {
    try {
      final Response? response = await service.getSolutionsWeOfferApi();
      final SolutionsWeOfferModel model = SolutionsWeOfferModel.fromJson(
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

  Future<WhatWeHaveDoneModel> getWhatWeHaveDone() async {
    try {
      final Response? response = await service.getWhatWeHaveDone();
      final WhatWeHaveDoneModel model =
          WhatWeHaveDoneModel.fromJson(response?.data as Map<String, dynamic>);
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
