import 'package:dio/dio.dart';

import '../../core/error/exceptions.dart';
import '../../main.dart';
import '../model/what_we_do_model/what_we_do_model.dart';
import '../services/what_we_do_service.dart';

class WhatWeDoDataSource {
  WhatWeDoDataSource();
  final WhatWeDoServices service = autoInjector.get<WhatWeDoServices>();
  Future<WhatWeDoModel> getWhatWeDoDataApi() async {
    try {
      final Response? response = await service.getWhatWeDoDataApi();
      final WhatWeDoModel model =
          WhatWeDoModel.fromJson(response?.data as Map<String, dynamic>);
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
