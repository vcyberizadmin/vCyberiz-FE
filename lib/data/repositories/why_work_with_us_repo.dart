import 'package:logger/logger.dart';
import 'package:vcyberiz/data/data_source/why_work_with_us_data_source.dart';
import 'package:vcyberiz/data/model/why_work_with_us_model/why_work_with_us_model.dart';

import '../../core/error/exceptions.dart';
import '../../core/helper/logger.dart';

class WhyWorkWithUsRepository {
  final WhyWorkWithUsDataSource _dataSource;

  WhyWorkWithUsRepository({
    required WhyWorkWithUsDataSource dataSource,
  }) : _dataSource = dataSource;
  Future<WhyWorkWithUsModel> getWhyWorkWithUsDataApi() async {
    try {
      final WhyWorkWithUsModel response =
          await _dataSource.getWhyWorkWithUsDataApi();
      return response;
    } on APIException catch (e) {
      logger.log(Level.debug, e);
      rethrow;
    }
  }
}
