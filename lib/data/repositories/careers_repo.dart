import 'package:file_picker/file_picker.dart';
import 'package:logger/logger.dart';
import 'package:vcyberiz/data/model/careers_model/career_details_model.dart';
import 'package:vcyberiz/data/model/careers_model/career_filter_Model.dart';
import 'package:vcyberiz/data/model/careers_model/submit_resume_model.dart';
import 'package:vcyberiz/data/model/careers_model/upload_pdf_model.dart';

import '../../core/error/exceptions.dart';
import '../../core/helper/logger.dart';
import '../data_source/careers_data_source.dart';
import '../model/careers_model/career_header_model.dart';
import '../model/careers_model/career_list_model.dart';

class CareersRepository {
  final CareersDataSource _dataSource;

  CareersRepository({
    required CareersDataSource dataSource,
  }) : _dataSource = dataSource;
  Future<CareerHeaderModel> getCareersHeaderApi() async {
    try {
      final CareerHeaderModel response =
          await _dataSource.getCareersHeaderApi();
      return response;
    } on APIException catch (e) {
      logger.log(Level.debug, e);
      rethrow;
    }
  }

  Future<UploadPdfModel> getUploadUrlApi(PlatformFile? file) async {
    try {
      final UploadPdfModel response = await _dataSource.getUploadUrlApi(file);
      return response;
    } on APIException catch (e) {
      logger.log(Level.debug, e);
      rethrow;
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
      final SubmitResumeModel response = await _dataSource.submitResumeApi(
        firstName: firstName,
        lastName: lastName,
        email: email,
        phone: phone,
        linkedIn: linkedIn,
        url: url,
      );
      return response;
    } on APIException catch (e) {
      logger.log(Level.debug, e);
      rethrow;
    }
  }

  Future<CareerFilterModel> getCareerFilterApi() async {
    try {
      final CareerFilterModel response = await _dataSource.getCareerFilterApi();
      return response;
    } on APIException catch (e) {
      logger.log(Level.debug, e);
      rethrow;
    }
  }

  Future<CareerListModel> getCareerListApi() async {
    try {
      final CareerListModel response = await _dataSource.getCareerListApi();
      return response;
    } on APIException catch (e) {
      logger.log(Level.debug, e);
      rethrow;
    }
  }

  Future<CareerDetailsModel> getCareerDetailsApi({
    required String documentId,
  }) async {
    try {
      final CareerDetailsModel response = await _dataSource.getCareerDetailsApi(
        documentId: documentId,
      );
      return response;
    } on APIException catch (e) {
      logger.log(Level.debug, e);
      rethrow;
    }
  }
}
