import 'package:logger/logger.dart';
import 'package:vcyberiz/data/model/cookies_model/cookies_model.dart';

import '../../core/error/exceptions.dart';
import '../../core/helper/logger.dart';
import '../data_source/cookies_data_source.dart';

class CookiesRepository {
  final CookiesDataSource _dataSource;

  CookiesRepository({
    required CookiesDataSource dataSource,
  }) : _dataSource = dataSource;
  Future<CookiesModel> getCookiesDataApi() async {
    try {
      final CookiesModel response = await _dataSource.getCookiesDataApi();
      return response;
    } on APIException catch (e) {
      logger.log(Level.debug, e);
      rethrow;
    }
  }
}
