import 'package:logger/logger.dart';

import '../../core/error/exceptions.dart';
import '../../core/helper/logger.dart';
import '../data_source/header_data_source.dart';
import '../model/header_loading_model/header_loading_model.dart';
import '../model/headers_model/headers_model.dart';

class HeaderRepository {
  final HeaderDataSource _dataSource;

  HeaderRepository({
    required HeaderDataSource dataSource,
  }) : _dataSource = dataSource;
  Future<HeaderModel> getHeaderDataApi() async {
    try {
      final HeaderModel response = (await _dataSource.getHeaderDataApi());
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
