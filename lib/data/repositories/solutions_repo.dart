import 'package:logger/logger.dart';
import 'package:vcyberiz/data/model/solutions_model/emergency_responce_model.dart';
import 'package:vcyberiz/data/model/solutions_model/microsoft_security_model.dart';
import 'package:vcyberiz/data/model/solutions_model/need_help_model.dart';
import 'package:vcyberiz/data/model/solutions_model/solutions_header_data_model.dart';

import '../../core/error/exceptions.dart';
import '../../core/helper/logger.dart';
import '../data_source/solutions_data_source.dart';
import '../model/solutions_model/solutions_header_model.dart';
import '../model/solutions_model/solutions_we_offer_model.dart';
import '../model/solutions_model/what_we_have_done_model.dart';

class SolutionsRepository {
  final SolutionsDataSource _dataSource;

  SolutionsRepository({
    required SolutionsDataSource dataSource,
  }) : _dataSource = dataSource;
  Future<SolutionsHeaderModel> getHeaderApi() async {
    try {
      final SolutionsHeaderModel response = await _dataSource.getHeaderApi();
      return response;
    } on APIException catch (e) {
      logger.log(Level.debug, e);
      rethrow;
    }
  }

  Future<SolutionsHeaderDataModel> getSolutionsHeaderApi() async {
    try {
      final SolutionsHeaderDataModel response =
          await _dataSource.getSolutionsHeaderApi();
      return response;
    } on APIException catch (e) {
      logger.log(Level.debug, e);
      rethrow;
    }
  }

  Future<MicrosoftSecurityModel> getMicrosoftSecurityApi() async {
    try {
      final MicrosoftSecurityModel response =
          await _dataSource.getMicrosoftSecurityApi();
      return response;
    } on APIException catch (e) {
      logger.log(Level.debug, e);
      rethrow;
    }
  }

  Future<EmergencyResponceModel> getEmergencyResponceApi() async {
    try {
      final EmergencyResponceModel response =
          await _dataSource.getEmergencyResponceApi();
      return response;
    } on APIException catch (e) {
      logger.log(Level.debug, e);
      rethrow;
    }
  }

  Future<NeedHelpModel> getNeedHelpApi() async {
    try {
      final NeedHelpModel response = await _dataSource.getNeedHelpApi();
      return response;
    } on APIException catch (e) {
      logger.log(Level.debug, e);
      rethrow;
    }
  }

  Future<SolutionsWeOfferModel> getSolutionsWeOfferApi() async {
    try {
      final SolutionsWeOfferModel response =
          await _dataSource.getSolutionsWeOfferApi();
      return response;
    } on APIException catch (e) {
      logger.log(Level.debug, e);
      rethrow;
    }
  }

  Future<WhatWeHaveDoneModel> getWhatWeHaveDone() async {
    try {
      final WhatWeHaveDoneModel response =
          await _dataSource.getWhatWeHaveDone();
      return response;
    } on APIException catch (e) {
      logger.log(Level.debug, e);
      rethrow;
    }
  }
}
