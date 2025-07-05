import 'package:dio/dio.dart';
import 'package:vcyberiz/data/model/partners_model/partners_header_model.dart';
import 'package:vcyberiz/data/model/partners_model/partners_technology_model.dart';
import 'package:vcyberiz/data/services/partner_service.dart';

import '../../core/error/exceptions.dart';
import '../../main.dart';
import '../model/partners_model/secure_stronger_future.dart';

class PartnersDataSource {
  PartnersDataSource();
  final PartnersServices service = autoInjector.get<PartnersServices>();
  Future<PartnersHeaderModel> getPartnerHeaderApi() async {
    try {
      final Response? response = await service.getPartnerHeaderApi();
      final PartnersHeaderModel model =
          PartnersHeaderModel.fromJson(response?.data as Map<String, dynamic>);
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

  Future<PartnersTechnologyModel> getTechnologyParntnersApi() async {
    try {
      final Response? response = await service.getTechnologyParntnersApi();

      final PartnersTechnologyModel model = PartnersTechnologyModel.fromJson(
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

  Future<SecureStrongerFutureModel> getPartnerSecureFutureApi() async {
    try {
      final Response? response = await service.getPartnerSecureFutureApi();

      final SecureStrongerFutureModel model =
          SecureStrongerFutureModel.fromJson(
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
