import 'package:logger/logger.dart';
import 'package:vcyberiz/data/data_source/partners_data_source.dart';
import 'package:vcyberiz/data/model/partners_model/partners_header_model.dart';
import 'package:vcyberiz/data/model/partners_model/partners_technology_model.dart';
import 'package:vcyberiz/data/model/partners_model/secure_stronger_future.dart';

import '../../core/error/exceptions.dart';
import '../../core/helper/logger.dart';

class PartnersRepository {
  final PartnersDataSource _dataSource;

  PartnersRepository({
    required PartnersDataSource dataSource,
  }) : _dataSource = dataSource;
  Future<PartnersHeaderModel> getPartnerHeaderApi() async {
    try {
      final PartnersHeaderModel response =
          await _dataSource.getPartnerHeaderApi();
      return response;
    } on APIException catch (e) {
      logger.log(Level.debug, e);
      rethrow;
    }
  }

  Future<PartnersTechnologyModel> getTechnologyParntnersApi() async {
    try {
      final PartnersTechnologyModel response =
          await _dataSource.getTechnologyParntnersApi();
      return response;
    } on APIException catch (e) {
      logger.log(Level.debug, e);
      rethrow;
    }
  }

  Future<SecureStrongerFutureModel> getPartnerSecureFutureApi() async {
    try {
      final SecureStrongerFutureModel response =
          await _dataSource.getPartnerSecureFutureApi();
      return response;
    } on APIException catch (e) {
      logger.log(Level.debug, e);
      rethrow;
    }
  }
}
