import 'package:logger/logger.dart';
import 'package:vcyberiz/data/model/pop_up_model/pop_up_model.dart';
import 'package:vcyberiz/data/model/search_model/search_model.dart';

import '../../core/error/exceptions.dart';
import '../../core/helper/logger.dart';
import '../data_source/home_data_source.dart';
import '../model/sections-model.dart';

class HomeRepository {
  final HomeDataSource _dataSource;

  HomeRepository({
    required HomeDataSource dataSource,
  }) : _dataSource = dataSource;
  Future<SearchModel> getSearchApi(String query) async {
    try {
      final SearchModel response = await _dataSource.getSearchApi(query);
      return response;
    } on APIException catch (e) {
      logger.log(Level.debug, e);
      rethrow;
    }
  }

  Future<SectionModel> getSections() async {
    try {
      final SectionModel response = await _dataSource.getSections();
      return response;
    } on APIException catch (e) {
      logger.log(Level.debug, e);
      rethrow;
    }
  }

  Future<PopUpModel> getPopUpApi() async {
    try {
      final PopUpModel response = await _dataSource.getPopUpApi();
      return response;
    } on APIException catch (e) {
      logger.log(Level.debug, e);
      rethrow;
    }
  }
}
