import 'package:logger/logger.dart';
import 'package:vcyberiz/data/data_source/our_service_data_source.dart';
import 'package:vcyberiz/data/model/our_service_model/our_service_header_model.dart';
import 'package:vcyberiz/data/model/our_service_model/our_service_model.dart';
import 'package:vcyberiz/data/model/our_service_model/our_service_tabs_model.dart';
import 'package:vcyberiz/data/model/our_service_model/service_direct_approach_model.dart';
import 'package:vcyberiz/data/model/our_service_model/service_offerrings_model.dart';
import 'package:vcyberiz/data/model/service_details_model/service_details_model.dart';

import '../../core/error/exceptions.dart';
import '../../core/helper/logger.dart';

class OurServiceRepository {
  final OurServiceDataSource _dataSource;

  OurServiceRepository({
    required OurServiceDataSource dataSource,
  }) : _dataSource = dataSource;
  Future<ServiceDetailsModel> getServiceDetailsApi(
      {required String documentId}) async {
    try {
      final ServiceDetailsModel response =
          await _dataSource.getServiceDetailsApi(documentId: documentId);
      return response;
    } on APIException catch (e) {
      logger.log(Level.debug, e);
      rethrow;
    }
  }

  Future<OurServiceModel> getOurServiceDataApi() async {
    try {
      final OurServiceModel response = await _dataSource.getOurServiceDataApi();
      return response;
    } on APIException catch (e) {
      logger.log(Level.debug, e);
      rethrow;
    }
  }

  Future<ServiceOfferingsModel> getServiceOfferingsDataApi(
      {required String documentId}) async {
    try {
      final ServiceOfferingsModel response =
          await _dataSource.getServiceOfferingsDataApi(documentId: documentId);
      return response;
    } on APIException catch (e) {
      logger.log(Level.debug, e);
      rethrow;
    }
  }

  Future<ServiceHeaderModel> getOurServiceHeaderApi() async {
    try {
      final ServiceHeaderModel response =
          await _dataSource.getOurServiceHeaderApi();
      return response;
    } on APIException catch (e) {
      logger.log(Level.debug, e);
      rethrow;
    }
  }

  Future<ServiceDirectApproachModel> getDirectApproachData() async {
    try {
      final ServiceDirectApproachModel response =
          await _dataSource.getDirectApproachData();
      return response;
    } on APIException catch (e) {
      logger.log(Level.debug, e);
      rethrow;
    }
  }

  Future<ServiceTabsModel> getOurServiceTabsData() async {
    try {
      final ServiceTabsModel response =
          await _dataSource.getOurServiceTabsData();
      return response;
    } on APIException catch (e) {
      logger.log(Level.debug, e);
      rethrow;
    }
  }
}
