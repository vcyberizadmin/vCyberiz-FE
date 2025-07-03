import 'package:dio/dio.dart';

import '../../core/error/exceptions.dart';
import '../../main.dart';
import '../model/our_solutions_model/our_solutions_model.dart';
import '../services/our_solution_service.dart';

class OurSolutionsDataSource {
  OurSolutionsDataSource();
  final OurSolutionsServices service = autoInjector.get<OurSolutionsServices>();
  Future<OurSolutionsModel> getOurSolutionsDataApi() async {
    try {
      final Response? response = await service.getOurSolutionsDataApi();
      final OurSolutionsModel model =
          OurSolutionsModel.fromJson(response?.data as Map<String, dynamic>);
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
