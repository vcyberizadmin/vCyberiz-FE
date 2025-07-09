import 'dart:developer';

import 'package:dio/dio.dart';

import '../../core/utils/constants/api_const.dart';
import '../dio_base_service.dart';

class HomeServices extends DioBaseService {
  final Dio _dio = DioBaseService.dio;
  final Dio _meiliDio = DioBaseSearchService.dio;
  Future<Response<dynamic>?> getSections() async {
    try {
      return await _dio.get(
        ApiConst.homeSectionsEndPoint,
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

  Future<Response<dynamic>?> getSearchApi(String query) async {
    const String meiliSearchUrl = '/multi-search';

    final List<String> highPriorityIndexes = [
      'blog-post',
      'news-post',
      'event-post',
      'about-us',
    ];

    final List<String> allIndexes = [
      ...highPriorityIndexes,
      'about-us-shield',
      'banner',
      'blog',
      'career-page',
      'contact-us',
      'cookie-policy',
      'cybersecurity-solution',
      'emergency-response-solution',
      'job-posting-header',
      'm365-page',
      'methodology',
      'microsoft-security-solution',
      'our-approach',
      'our-mission-vision',
      'our-secret',
      'our-services-tab-section',
      'our-solution',
      'our-value',
      'privacy-policy',
      'securing-stronger-future',
      'service-offering-card-cma',
      'services-header',
      'solution-header',
      'solutions-we-offer',
      'solution-comparison',
      'technology-partner',
      'the-direct-approach',
      'what-we-do',
      'what-we-have-done',
      'why-work-with-us',
      'service-offering-card',
      'search',
      'contact-us-around-the-globe',
      'resource-hub-banner',
    ];

    final List<Map<String, dynamic>> searchQueries = allIndexes.map((index) {
      return {
        "indexUid": index,
        "q": query.trim().split(RegExp(r'\s+')).last,
        "offset": 0,
        "attributesToHighlight": ["*"],
        "showMatchesPosition": true,
        "showRankingScore": true,
        "attributesToRetrieve": ["*"],
      };
    }).toList();

    try {
      final response = await _meiliDio.post(
        meiliSearchUrl,
        data: {
          "queries": searchQueries,
        },
      );
      // log(response.data.toString(), name: 'data');
      return response;
    } on DioException catch (e) {
      log('Dio error: $e');
      if (e.response != null) {
        log('Dio error status: ${e.response!.statusCode}');
        log('Dio error message: ${e.response!.statusMessage}');
        log('Dio error data: ${e.response!.data}');
      } else {
        log('Dio request failed due to an exception: $e');
      }
      rethrow;
    }
  }

  Future<Response<dynamic>?> getPopUpApi() async {
    try {
      return await _dio.get(
        ApiConst.popUpEndPoint,
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
