import 'package:logger/logger.dart';
import 'package:vcyberiz/data/data_source/events_data_source.dart';
import 'package:vcyberiz/data/model/blogs_model/blog_category_model.dart';
import 'package:vcyberiz/data/model/blogs_model/blog_tags_model.dart';
import 'package:vcyberiz/data/model/events_model/event_details_model.dart';
import 'package:vcyberiz/data/model/events_model/event_header_model.dart';
import 'package:vcyberiz/data/model/events_model/events_model.dart';
import 'package:vcyberiz/data/model/events_model/register_details_model.dart';
import 'package:vcyberiz/data/model/events_model/register_responce_model.dart';
import 'package:vcyberiz/data/model/events_model/related_event_list_model.dart';

import '../../core/error/exceptions.dart';
import '../../core/helper/logger.dart';

class EventsRepository {
  final EventsDataSource _dataSource;

  EventsRepository({
    required EventsDataSource dataSource,
  }) : _dataSource = dataSource;

  Future<EventsHeaderModel> getEventsHeaderApi() async {
    try {
      final EventsHeaderModel response = await _dataSource.getEventsHeaderApi();
      return response;
    } on APIException catch (e) {
      logger.log(Level.debug, e);
      rethrow;
    }
  }

  Future<EventsListModel> getEventsListApi() async {
    try {
      final EventsListModel response = await _dataSource.getEventsListEvent();
      return response;
    } on APIException catch (e) {
      logger.log(Level.debug, e);
      rethrow;
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
      final registerResponceData? response = await _dataSource.registerEvents(
        name: name,
        email: email,
        mobile: mobile,
        eventId: eventId,
        eventName: eventName,
      );
      return response;
    } on APIException catch (e) {
      logger.log(Level.debug, e);
      rethrow;
    }
  }

  Future<RegisterDetailsModel> getRegisterDetailsApi() async {
    try {
      final RegisterDetailsModel response =
          await _dataSource.getRegisterDetailsApi();
      return response;
    } on APIException catch (e) {
      logger.log(Level.debug, e);
      rethrow;
    }
  }

  Future<RelatedEventsListModel> getRelatedEventsApi() async {
    try {
      final RelatedEventsListModel response =
          await _dataSource.getRelatedEventsApi();
      return response;
    } on APIException catch (e) {
      logger.log(Level.debug, e);
      rethrow;
    }
  }

  Future<CategoriesModel> getCategoryApi() async {
    try {
      final CategoriesModel response = await _dataSource.getCategoryApi();
      return response;
    } on APIException catch (e) {
      logger.log(Level.debug, e);
      rethrow;
    }
  }

  Future<TagsModel> getEventTagsApi() async {
    try {
      final TagsModel response = await _dataSource.getEventTagsApi();
      return response;
    } on APIException catch (e) {
      logger.log(Level.debug, e);
      rethrow;
    }
  }

  Future<EventDetailsModel> getEventDetailsApi(
      {required String documentId}) async {
    try {
      final EventDetailsModel response =
          await _dataSource.getEventDetailsApi(documentId: documentId);
      return response;
    } on APIException catch (e) {
      logger.log(Level.debug, e);
      rethrow;
    }
  }
}
