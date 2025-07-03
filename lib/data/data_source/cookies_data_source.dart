import 'package:dio/dio.dart';

import '../../core/error/exceptions.dart';
import '../../main.dart';
import '../model/cookies_model/cookies_model.dart';
import '../services/cookies_service.dart';

class CookiesDataSource {
  CookiesDataSource();
  final CookiesServices service = autoInjector.get<CookiesServices>();
  Future<CookiesModel> getCookiesDataApi() async {
    try {
      final Response? response = await service.getCookiesDataApi();
      final CookiesModel model =
          CookiesModel.fromJson(response?.data as Map<String, dynamic>);
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
