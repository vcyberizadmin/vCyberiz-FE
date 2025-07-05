import 'package:dio/dio.dart';
import 'package:vcyberiz/data/model/resource_model/resource_header_model.dart';
import 'package:vcyberiz/data/services/resources_service.dart';

import '../../core/error/exceptions.dart';
import '../../main.dart';
import '../model/header_loading_model/header_loading_model.dart';

class ResourcesDataSource {
  ResourcesDataSource();
  final ResourcesServices service = autoInjector.get<ResourcesServices>();
  Future<ResourceHeaderModel> getHeaderDataApi() async {
    try {
      final Response? response = await service.getHeaderDataApi();
      final ResourceHeaderModel model =
          ResourceHeaderModel.fromJson(response?.data as Map<String, dynamic>);
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
