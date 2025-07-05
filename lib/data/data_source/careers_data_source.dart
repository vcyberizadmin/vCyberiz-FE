import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:vcyberiz/data/model/careers_model/career_filter_Model.dart';
import 'package:vcyberiz/data/model/careers_model/career_list_model.dart';
import 'package:vcyberiz/data/model/careers_model/submit_resume_model.dart';
import 'package:vcyberiz/data/model/careers_model/upload_pdf_model.dart';

import '../../core/error/exceptions.dart';
import '../../main.dart';
import '../model/careers_model/career_details_model.dart';
import '../model/careers_model/career_header_model.dart';
import '../services/careers_service.dart';

class CareersDataSource {
  CareersDataSource();
  final CareersServices service = autoInjector.get<CareersServices>();
  Future<CareerHeaderModel> getCareersHeaderApi() async {
    try {
      final Response? response = await service.getCareersHeaderApi();
      final CareerHeaderModel model =
          CareerHeaderModel.fromJson(response?.data as Map<String, dynamic>);
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

  Future<UploadPdfModel> getUploadUrlApi(PlatformFile? file) async {
    try {
      final Response? response = await service.getUploadUrlApi(file);
      if (response?.data is List && response?.data.isNotEmpty) {
        final UploadPdfModel model = UploadPdfModel.fromJson(response?.data[0]);
        return model;
      } else {
        throw APIException(
            message: "Unexpected response format", statusCode: 506);
      }
    } on APIException {
      rethrow;
    } catch (e) {
      throw APIException(
        message: e.toString(),
        statusCode: 505,
      );
    }
  }

  Future<SubmitResumeModel> submitResumeApi({
    required String url,
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
    required String linkedIn,
  }) async {
    try {
      final Response? response = await service.submitResumeApi(
        firstName: firstName,
        lastName: lastName,
        email: email,
        phone: phone,
        linkedIn: linkedIn,
        url: url,
      );
      final SubmitResumeModel model =
          SubmitResumeModel.fromJson(response?.data as Map<String, dynamic>);
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

  Future<CareerFilterModel> getCareerFilterApi() async {
    try {
      final Response? response = await service.getCareerFilterApi();
      final CareerFilterModel model =
          CareerFilterModel.fromJson(response?.data as Map<String, dynamic>);
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

  Future<CareerListModel> getCareerListApi() async {
    try {
      final Response? response = await service.getCareerListApi();
      final CareerListModel model =
          CareerListModel.fromJson(response?.data as Map<String, dynamic>);
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

  Future<CareerDetailsModel> getCareerDetailsApi({
    required String documentId,
  }) async {
    try {
      final Response? response = await service.getCareerDetailsApi(
        documentId: documentId,
      );
      final CareerDetailsModel model =
          CareerDetailsModel.fromJson(response?.data as Map<String, dynamic>);
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
