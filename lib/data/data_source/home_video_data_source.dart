import 'package:dio/dio.dart';

import '../../core/error/exceptions.dart';
import '../../main.dart';
import '../model/video_model.dart';
import '../services/home_video_service.dart';

class HomeVideoDataSource {
  HomeVideoDataSource();
  final HomeVideoServices service = autoInjector.get<HomeVideoServices>();
  Future<VideoModel> getVideoDataApi() async {
    try {
      final Response? response = await service.getVideoDataApi();
      final VideoModel model =
          VideoModel.fromJson(response?.data as Map<String, dynamic>);
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
