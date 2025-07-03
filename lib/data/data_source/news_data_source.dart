import 'package:dio/dio.dart';
import 'package:vcyberiz/data/model/blogs_model/blog_category_model.dart';
import 'package:vcyberiz/data/model/blogs_model/blog_marketing_model.dart';
import 'package:vcyberiz/data/model/blogs_model/blog_tags_model.dart';
import 'package:vcyberiz/data/model/blogs_model/related_blogs_model.dart';
import 'package:vcyberiz/data/model/ebook_model/ebook_model.dart';
import 'package:vcyberiz/data/model/news_model/news_article_model.dart';
import 'package:vcyberiz/data/model/news_model/news_header_model.dart';
import 'package:vcyberiz/data/model/news_model/news_list_model.dart';
import 'package:vcyberiz/data/services/news_service.dart';

import '../../core/error/exceptions.dart';
import '../../main.dart';

class NewsDataSource {
  NewsDataSource();
  final NewsServices service = autoInjector.get<NewsServices>();

  Future<NewsHeaderModel> getNewHeaderApi() async {
    try {
      final Response? response = await service.getNewHeaderApi();
      final NewsHeaderModel model =
          NewsHeaderModel.fromJson(response?.data as Map<String, dynamic>);
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

  Future<NewsListModel> getNewsListApi() async {
    try {
      final Response? response = await service.getNewsListApi();
      final NewsListModel model =
          NewsListModel.fromJson(response?.data as Map<String, dynamic>);
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

  Future<EbookModel> getEbookListApi() async {
    try {
      final Response? response = await service.getEbookListApi();
      final EbookModel model =
          EbookModel.fromJson(response?.data as Map<String, dynamic>);
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

  Future<CategoriesModel> getBlogCategoryApi() async {
    try {
      final Response? response = await service.getNewCategoryApi();
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

  Future<TagsModel> getNewTagsApi() async {
    try {
      final Response? response = await service.getNewTagsApi();
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

  Future<BlogMarketingModel> getMarketingApi() async {
    try {
      final Response? response = await service.getMarketingApi();
      final BlogMarketingModel model =
          BlogMarketingModel.fromJson(response?.data as Map<String, dynamic>);
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

  Future<NewsArtilceModel> getNewsArticlesApi(
    String documentId,
  ) async {
    try {
      final Response? response = await service.getNewArticlesApi(documentId);
      final NewsArtilceModel model =
          NewsArtilceModel.fromJson(response?.data as Map<String, dynamic>);
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

  Future<RelatedBlogsModel> getRelatedNewsApi() async {
    try {
      final Response? response = await service.getRelatedNewsApi();
      final RelatedBlogsModel model =
          RelatedBlogsModel.fromJson(response?.data as Map<String, dynamic>);
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
