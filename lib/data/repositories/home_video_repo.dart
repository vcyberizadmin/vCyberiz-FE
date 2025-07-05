import 'package:logger/logger.dart';

import '../../core/error/exceptions.dart';
import '../../core/helper/logger.dart';
import '../data_source/home_video_data_source.dart';
import '../model/video_model.dart';

class HomeVideoRepository {
  final HomeVideoDataSource _dataSource;

  HomeVideoRepository({
    required HomeVideoDataSource dataSource,
  }) : _dataSource = dataSource;
  Future<VideoModel> getVideoDataApi() async {
    try {
      final VideoModel response = (await _dataSource.getVideoDataApi());
      return response;
    } on APIException catch (e) {
      logger.log(Level.debug, e);
      rethrow;
    }
  }
}
