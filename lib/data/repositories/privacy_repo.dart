import 'package:logger/logger.dart';

import '../../core/error/exceptions.dart';
import '../../core/helper/logger.dart';
import '../data_source/privacy_data_source.dart';
import '../model/privacy_model/privacy_model.dart';

class PrivacyRepository {
  final PrivacyDataSource _dataSource;

  PrivacyRepository({
    required PrivacyDataSource dataSource,
  }) : _dataSource = dataSource;
  Future<PrivacyModel> getPrivacyDataApi() async {
    try {
      final PrivacyModel response = await _dataSource.getPrivacyDataApi();
      return response;
    } on APIException catch (e) {
      logger.log(Level.debug, e);
      rethrow;
    }
  }
}
