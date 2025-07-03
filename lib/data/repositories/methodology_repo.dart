import 'package:logger/logger.dart';

import '../../core/error/exceptions.dart';
import '../../core/helper/logger.dart';
import '../data_source/methodology_data_source.dart';
import '../model/methodlogy_model/methodology_model.dart';

class MethodologyRepository {
  final MethodologyDataSource _dataSource;

  MethodologyRepository({
    required MethodologyDataSource dataSource,
  }) : _dataSource = dataSource;
  Future<MethodologyModel> getMethodologyDataApi() async {
    try {
      final MethodologyModel response =
          await _dataSource.getMethodologyDataApi();
      return response;
    } on APIException catch (e) {
      logger.log(Level.debug, e);
      rethrow;
    }
  }
}
