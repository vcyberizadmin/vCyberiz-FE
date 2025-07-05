import 'package:dio/dio.dart';
import 'package:vcyberiz/data/model/our_service_model/our_service_header_model.dart';
import 'package:vcyberiz/data/model/our_service_model/our_service_model.dart';
import 'package:vcyberiz/data/model/our_service_model/our_service_tabs_model.dart';
import 'package:vcyberiz/data/model/our_service_model/service_direct_approach_model.dart';
import 'package:vcyberiz/data/model/our_service_model/service_offerrings_model.dart';
import 'package:vcyberiz/data/model/service_details_model/service_details_model.dart';
import 'package:vcyberiz/data/services/our_service_service.dart';

import '../../core/error/exceptions.dart';
import '../../main.dart';

class OurServiceDataSource {
  OurServiceDataSource();
  final OurServiceServices service = autoInjector.get<OurServiceServices>();
  Future<ServiceDetailsModel> getServiceDetailsApi(
      {required String documentId}) async {
    try {
      final Response? response =
          await service.getServiceDetailsApi(documentId: documentId);
      final ServiceDetailsModel model =
          ServiceDetailsModel.fromJson(response?.data as Map<String, dynamic>);

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

  Future<OurServiceModel> getOurServiceDataApi() async {
    try {
      final Response? response = await service.getOurServiceDataApi();

      final OurServiceModel model =
          OurServiceModel.fromJson(response?.data as Map<String, dynamic>);

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

  Future<ServiceOfferingsModel> getServiceOfferingsDataApi(
      {required String documentId}) async {
    try {
      final Response? response =
          await service.getServiceOfferingsDataApi(documentId: documentId);
      final ServiceOfferingsModel model = ServiceOfferingsModel.fromJson(
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

  Future<ServiceHeaderModel> getOurServiceHeaderApi() async {
    try {
      final Response? response = await service.getOurServiceHeaderApi();

      final ServiceHeaderModel model =
          ServiceHeaderModel.fromJson(response?.data as Map<String, dynamic>);

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

  Future<ServiceDirectApproachModel> getDirectApproachData() async {
    try {
      final Response? response = await service.getDirectApproachData();
      final ServiceDirectApproachModel model =
          ServiceDirectApproachModel.fromJson(
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

  Future<ServiceTabsModel> getOurServiceTabsData() async {
    try {
      final Response? response = await service.getOurServiceTabsData();

      final ServiceTabsModel model =
          ServiceTabsModel.fromJson(response?.data as Map<String, dynamic>);

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
