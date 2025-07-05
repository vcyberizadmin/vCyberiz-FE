import 'package:dio/dio.dart';
import 'package:vcyberiz/data/model/blogs_model/blog_category_model.dart';
import 'package:vcyberiz/data/model/blogs_model/blog_tags_model.dart';
import 'package:vcyberiz/data/model/events_model/event_details_model.dart';
import 'package:vcyberiz/data/model/events_model/event_header_model.dart';
import 'package:vcyberiz/data/model/events_model/events_model.dart';
import 'package:vcyberiz/data/model/events_model/register_details_model.dart';
import 'package:vcyberiz/data/model/events_model/register_responce_model.dart';
import 'package:vcyberiz/data/model/events_model/related_event_list_model.dart';
import 'package:vcyberiz/data/services/events_service.dart';

import '../../core/error/exceptions.dart';
import '../../main.dart';

class EventsDataSource {
  EventsDataSource();
  final EventsServices service = autoInjector.get<EventsServices>();

  Future<EventsHeaderModel> getEventsHeaderApi() async {
    try {
      final Response? response = await service.getEventsHeaderApi();
      final EventsHeaderModel model =
          EventsHeaderModel.fromJson(response?.data as Map<String, dynamic>);
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

  Future<EventsListModel> getEventsListEvent() async {
    try {
      final Response? response = await service.getEventsListApi();
      final EventsListModel model =
          EventsListModel.fromJson(response?.data as Map<String, dynamic>);
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

  Future<registerResponceData?> registerEvents({
    required String name,
    required String email,
    required String mobile,
    required String eventName,
    required String eventId,
  }) async {
    try {
      final Response? response = await service.registerEvents(
        name: name,
        email: email,
        mobile: mobile,
        eventId: eventId,
        eventName: eventName,
      );

      final RegisterResponceModel model = RegisterResponceModel.fromJson(
          response?.data as Map<String, dynamic>);
      return model.data;
    } on APIException {
      rethrow;
    } catch (e) {
      throw APIException(
        message: e.toString(),
        statusCode: 505,
      );
    }
  }

  Future<RegisterDetailsModel> getRegisterDetailsApi() async {
    try {
      final Response? response = await service.getRegisterDetailsApi();
      final RegisterDetailsModel model =
          RegisterDetailsModel.fromJson(response?.data as Map<String, dynamic>);
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

  Future<RelatedEventsListModel> getRelatedEventsApi() async {
    try {
      final Response? response = await service.getRelatedEventsListApi();
      final RelatedEventsListModel model = RelatedEventsListModel.fromJson(
          response?.data as Map<String, dynamic>);
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

  Future<CategoriesModel> getCategoryApi() async {
    try {
      final Response? response = await service.getCategoryApi();
      final CategoriesModel model =
          CategoriesModel.fromJson(response?.data as Map<String, dynamic>);
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

  Future<TagsModel> getEventTagsApi() async {
    try {
      final Response? response = await service.getEventTagsApi();
      final TagsModel model =
          TagsModel.fromJson(response?.data as Map<String, dynamic>);
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

  Future<EventDetailsModel> getEventDetailsApi(
      {required String documentId}) async {
    try {
      final Response? response =
          await service.getEventDetailsApi(documentId: documentId);
      final EventDetailsModel model =
          EventDetailsModel.fromJson(response?.data as Map<String, dynamic>);

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
