import 'package:logger/logger.dart';

import '../../core/error/exceptions.dart';
import '../../core/helper/logger.dart';
import '../data_source/our_approach_data_source.dart';
import '../model/our_approach_model/our_approach_model.dart';

class OurApproachRepository {
  final OurApproachDataSource _dataSource;

  OurApproachRepository({
    required OurApproachDataSource dataSource,
  }) : _dataSource = dataSource;
  Future<OurApproachModel> getOurApproachDataApi() async {
    try {
      final OurApproachModel response =
          await _dataSource.getOurApproachDataApi();
      return response;
    } on APIException catch (e) {
      logger.log(Level.debug, e);
      rethrow;
    }
  }
}
