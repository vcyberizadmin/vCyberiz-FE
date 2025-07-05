import 'package:logger/logger.dart';
import 'package:vcyberiz/data/data_source/banner_info_data_source.dart';
import 'package:vcyberiz/data/model/banner-info-model/banner_info_model.dart';

import '../../core/error/exceptions.dart';
import '../../core/helper/logger.dart';

class BannerInfoRepository {
  final BannerInfoDataSource _dataSource;

  BannerInfoRepository({
    required BannerInfoDataSource dataSource,
  }) : _dataSource = dataSource;
  Future<BannerInfoModel> getBannerInfoDataApi() async {
    try {
      final BannerInfoModel response = await _dataSource.getBannerInfoDataApi();
      return response;
    } on APIException catch (e) {
      logger.log(Level.debug, e);
      rethrow;
    }
  }
}
