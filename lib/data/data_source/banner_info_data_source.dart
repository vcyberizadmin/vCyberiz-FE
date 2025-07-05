import 'package:dio/dio.dart';
import 'package:vcyberiz/data/model/banner-info-model/banner_info_model.dart';
import 'package:vcyberiz/data/services/banner_info_service.dart';

import '../../core/error/exceptions.dart';
import '../../main.dart';

class BannerInfoDataSource {
  BannerInfoDataSource();
  final BannerInfoServices service = autoInjector.get<BannerInfoServices>();
  Future<BannerInfoModel> getBannerInfoDataApi() async {
    try {
      final Response? response = await service.getBannerInfoDataApi();
      final BannerInfoModel model =
          BannerInfoModel.fromJson(response?.data as Map<String, dynamic>);
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
