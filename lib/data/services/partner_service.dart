import 'dart:developer';

import 'package:dio/dio.dart';

import '../../core/utils/constants/api_const.dart';
import '../dio_base_service.dart';

class PartnersServices extends DioBaseService {
  final Dio _dio = DioBaseService.dio;
  Future<Response<dynamic>?> getPartnerHeaderApi() async {
    try {
      return await _dio.get(
        ApiConst.partnersHeaderEndPoint,
      );
    } on DioException catch (e) {
      // Handle DioError
      log('Dio error: $e');
      if (e.response != null) {
        log('Dio error status: ${e.response!.statusCode}');
        log('Dio error message: ${e.response!.statusMessage}');
        log('Dio error data: ${e.response!.data}');
      } else {
        log('Dio request failed due to an exception: $e');
      }
      // Return null or rethrow the DioError to propagate it further
      rethrow;
    }
  }

  Future<Response<dynamic>?> getTechnologyParntnersApi() async {
    try {
      return await _dio.get(
        ApiConst.partnerstechnologyEndPoint,
      );
    } on DioException catch (e) {
      // Handle DioError
      log('Dio error: $e');
      if (e.response != null) {
        log('Dio error status: ${e.response!.statusCode}');
        log('Dio error message: ${e.response!.statusMessage}');
        log('Dio error data: ${e.response!.data}');
      } else {
        log('Dio request failed due to an exception: $e');
      }
      // Return null or rethrow the DioError to propagate it further
      rethrow;
    }
  }

  Future<Response<dynamic>?> getPartnerSecureFutureApi() async {
    try {
      return await _dio.get(
        ApiConst.partnersSecuringstrongerfutureEndPoint,
      );
    } on DioException catch (e) {
      // Handle DioError
      log('Dio error: $e');
      if (e.response != null) {
        log('Dio error status: ${e.response!.statusCode}');
        log('Dio error message: ${e.response!.statusMessage}');
        log('Dio error data: ${e.response!.data}');
      } else {
        log('Dio request failed due to an exception: $e');
      }
      // Return null or rethrow the DioError to propagate it further
      rethrow;
    }
  }
}
