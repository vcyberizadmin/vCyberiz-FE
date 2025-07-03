import 'package:logger/logger.dart';

import '../../core/error/exceptions.dart';
import '../../core/helper/logger.dart';
import '../data_source/our_solutions_data_source.dart';
import '../model/our_solutions_model/our_solutions_model.dart';

class OurSolutionsRepository {
  final OurSolutionsDataSource _dataSource;

  OurSolutionsRepository({
    required OurSolutionsDataSource dataSource,
  }) : _dataSource = dataSource;
  Future<OurSolutionsModel> getOurSolutionsDataApi() async {
    try {
      final OurSolutionsModel response =
          await _dataSource.getOurSolutionsDataApi();
      return response;
    } on APIException catch (e) {
      logger.log(Level.debug, e);
      rethrow;
    }
  }
}
