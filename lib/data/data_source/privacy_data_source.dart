import 'package:dio/dio.dart';

import '../../core/error/exceptions.dart';
import '../../main.dart';
import '../model/privacy_model/privacy_model.dart';
import '../services/privacy_service.dart';

class PrivacyDataSource {
  PrivacyDataSource();
  final PrivacyServices service = autoInjector.get<PrivacyServices>();
  Future<PrivacyModel> getPrivacyDataApi() async {
    try {
      final Response? response = await service.getPrivacyDataApi();
      final PrivacyModel model =
          PrivacyModel.fromJson(response?.data as Map<String, dynamic>);
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
