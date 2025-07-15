import 'package:logger/logger.dart';
import 'package:vcyberiz/data/data_source/footer_data_source.dart';
import 'package:vcyberiz/data/model/footer_model/footer_model.dart';

import '../../core/error/exceptions.dart';
import '../../core/helper/logger.dart';
import '../model/subscribe_model.dart';

class FooterRepository {
  final FooterDataSource _dataSource;

  FooterRepository({
    required FooterDataSource dataSource,
  }) : _dataSource = dataSource;
  Future<FooterModel> getFooterApi() async {
    try {
      final FooterModel response = await _dataSource.getFooterDataApi();
      return response;
    } on APIException catch (e) {
      logger.log(Level.debug, e);
      rethrow;
    }
  }

  Future<SubscribeModel> getSubscribeApi(String email) async {
    try {
      final SubscribeModel response =
          (await _dataSource.getSubscribeApi(email));
      return response;
    } on APIException catch (e) {
      logger.log(Level.debug, e);
      rethrow;
    }
  }
}
