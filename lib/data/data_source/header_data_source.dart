import 'package:dio/dio.dart';

import '../../core/error/exceptions.dart';
import '../../main.dart';

import '../model/header_loading_model/header_loading_model.dart';
import '../model/headers_model/headers_model.dart';
import '../services/header_service.dart';

class HeaderDataSource {
  HeaderDataSource();
  final HeaderServices service = autoInjector.get<HeaderServices>();
  Future<HeaderModel> getHeaderDataApi() async {
    try {
      final Response? response = await service.getHeaderDataApi();
      final HeaderModel model =
          HeaderModel.fromJson(response?.data as Map<String, dynamic>);
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

  Future<HeaderLoadingModel> getHeaderLoadingDataApi() async {
    try {
      final Response? response = await service.getHeaderLoadingDataApi();
      final HeaderLoadingModel model =
          HeaderLoadingModel.fromJson(response?.data as Map<String, dynamic>);
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
