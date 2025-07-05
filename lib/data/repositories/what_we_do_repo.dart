import 'package:logger/logger.dart';
import 'package:vcyberiz/data/data_source/what_we_do_data_source.dart';

import '../../core/error/exceptions.dart';
import '../../core/helper/logger.dart';
import '../model/what_we_do_model/what_we_do_model.dart';

class WhatWeDoRepository {
  final WhatWeDoDataSource _dataSource;

  WhatWeDoRepository({
    required WhatWeDoDataSource dataSource,
  }) : _dataSource = dataSource;
  Future<WhatWeDoModel> getWhatWeDoDataApi() async {
    try {
      final WhatWeDoModel response = (await _dataSource.getWhatWeDoDataApi());
      return response;
    } on APIException catch (e) {
      logger.log(Level.debug, e);
      rethrow;
    }
  }
}
