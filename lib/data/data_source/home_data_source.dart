import 'package:dio/dio.dart';
import 'package:vcyberiz/data/model/search_model/search_model.dart';

import '../../core/error/exceptions.dart';
import '../../main.dart';
import '../model/pop_up_model/pop_up_model.dart';
import '../model/sections-model.dart';
import '../services/home_service.dart';

class HomeDataSource {
  HomeDataSource();
  final HomeServices service = autoInjector.get<HomeServices>();
  Future<SearchModel> getSearchApi(String query) async {
    try {
      final Response? response = await service.getSearchApi(query);
      final SearchModel model =
          SearchModel.fromJson(response?.data as Map<String, dynamic>);
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

  Future<SectionModel> getSections() async {
    try {
      final Response? response = await service.getSections();
      final SectionModel model =
          SectionModel.fromJson(response?.data as Map<String, dynamic>);
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

  Future<PopUpModel> getPopUpApi() async {
    try {
      final Response? response = await service.getPopUpApi();
      final PopUpModel model =
          PopUpModel.fromJson(response?.data as Map<String, dynamic>);
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
