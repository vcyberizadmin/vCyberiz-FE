import 'package:dio/dio.dart';

import '../../core/error/exceptions.dart';
import '../../main.dart';

import '../model/our_approach_model/our_approach_model.dart';
import '../services/our_approach_service.dart';

class OurApproachDataSource {
  OurApproachDataSource();
  final OurApproachServices service = autoInjector.get<OurApproachServices>();
  Future<OurApproachModel> getOurApproachDataApi() async {
    try {
      final Response? response = await service.getOurApproachDataApi();
      final OurApproachModel model =
          OurApproachModel.fromJson(response?.data as Map<String, dynamic>);
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
