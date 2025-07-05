import 'package:dio/dio.dart';
import 'package:vcyberiz/data/model/why_work_with_us_model/why_work_with_us_model.dart';
import 'package:vcyberiz/data/services/why_work_with_us_service.dart';

import '../../core/error/exceptions.dart';
import '../../main.dart';

class WhyWorkWithUsDataSource {
  WhyWorkWithUsDataSource();
  final WhyWorkWithUsServices service =
      autoInjector.get<WhyWorkWithUsServices>();
  Future<WhyWorkWithUsModel> getWhyWorkWithUsDataApi() async {
    try {
      final Response? response = await service.getWhyWorkWithUsDataApi();
      final WhyWorkWithUsModel model =
          WhyWorkWithUsModel.fromJson(response?.data as Map<String, dynamic>);

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
