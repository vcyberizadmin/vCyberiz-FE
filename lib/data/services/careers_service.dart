import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';

import '../../core/utils/constants/api_const.dart';
import '../dio_base_service.dart';

class CareersServices extends DioBaseService {
  final Dio _dio = DioBaseService.dio;
  Future<Response<dynamic>?> getCareersHeaderApi() async {
    try {
      return await _dio.get(
        ApiConst.careersHeaderEndPoint,
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

  Future<Response<dynamic>?> getUploadUrlApi(PlatformFile? file) async {
    try {
      // Create multipart form data
      final formData = FormData.fromMap({
        'files': MultipartFile.fromBytes(
          file!.bytes!,
          filename: file.name,
        ),
      });
      return await _dio.post(
        ApiConst.uploadPdfEndPoint,
        data: formData,
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

  Future<Response<dynamic>?> submitResumeApi({
    required String url,
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
    required String linkedIn,
  }) async {
    try {
      final formData = FormData.fromMap({
        'data[first_name]': firstName,
        'data[last_name]': lastName,
        'data[email]': email,
        'data[phone_number]': phone,
        'data[linkedin]': linkedIn,
        'data[upload_cv]': url,
      });
      return await _dio.post(
        ApiConst.submitResumeEndPoint,
        data: formData,
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

  Future<Response<dynamic>?> getCareerFilterApi() async {
    try {
      return await _dio.get(
        ApiConst.careerFilterEndPoint,
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

  Future<Response<dynamic>?> getCareerListApi() async {
    try {
      return await _dio.get(
        ApiConst.careerListEndPoint,
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

  Future<Response<dynamic>?> getCareerDetailsApi({
    required String documentId,
  }) async {
    try {
      return await _dio.get(
        ApiConst.careerDetails1EndPoint +
            documentId +
            ApiConst.careerDetails2EndPoint,
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
