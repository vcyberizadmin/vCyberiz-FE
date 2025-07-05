import 'package:dio/dio.dart';
import 'package:vcyberiz/data/model/footer_model/footer_model.dart';
import 'package:vcyberiz/data/services/footer_service.dart';

import '../../core/error/exceptions.dart';
import '../../main.dart';
import '../model/subscribe_model.dart';

class FooterDataSource {
  FooterDataSource();
  final FooterServices service = autoInjector.get<FooterServices>();
  Future<FooterModel> getFooterDataApi() async {
    try {
      final Response? response = await service.getFooterDataApi();
      final FooterModel model =
          FooterModel.fromJson(response?.data as Map<String, dynamic>);
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

  Future<SubscribeModel> getSubscribeApi(String email) async {
    try {
      final Response? response = await service.getSubscribeApi(email);
      final SubscribeModel model =
          SubscribeModel.fromJson(response?.data as Map<String, dynamic>);
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
