import 'package:logger/logger.dart';
import 'package:vcyberiz/data/data_source/resources_data_source.dart';
import 'package:vcyberiz/data/model/resource_model/resource_header_model.dart';

import '../../core/error/exceptions.dart';
import '../../core/helper/logger.dart';
import '../model/header_loading_model/header_loading_model.dart';

class ResourcesRepository {
  final ResourcesDataSource _dataSource;

  ResourcesRepository({
    required ResourcesDataSource dataSource,
  }) : _dataSource = dataSource;
  Future<ResourceHeaderModel> getHeaderDataApi() async {
    try {
      final ResourceHeaderModel response = await _dataSource.getHeaderDataApi();
      return response;
    } on APIException catch (e) {
      logger.log(Level.debug, e);
      rethrow;
    }
  }

  Future<HeaderLoadingModel> getHeaderLoadingDataApi() async {
    try {
      final HeaderLoadingModel response =
          (await _dataSource.getHeaderLoadingDataApi());
      return response;
    } on APIException catch (e) {
      logger.log(Level.debug, e);
      rethrow;
    }
  }
}
