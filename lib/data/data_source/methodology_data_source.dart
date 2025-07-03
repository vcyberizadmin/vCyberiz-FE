import 'package:dio/dio.dart';

import '../../core/error/exceptions.dart';
import '../../main.dart';
import '../model/methodlogy_model/methodology_model.dart';
import '../services/methodology_service.dart';

class MethodologyDataSource {
  MethodologyDataSource();
  final MethodologyServices service = autoInjector.get<MethodologyServices>();
  Future<MethodologyModel> getMethodologyDataApi() async {
    try {
      final Response? response = await service.getMethodologyDataApi();
      final MethodologyModel model =
          MethodologyModel.fromJson(response?.data as Map<String, dynamic>);
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
