import 'package:dio/dio.dart';
import 'package:vcyberiz/data/model/blogs_model/blog_article_model.dart';
import 'package:vcyberiz/data/model/blogs_model/blog_category_model.dart';
import 'package:vcyberiz/data/model/blogs_model/blog_marketing_model.dart';
import 'package:vcyberiz/data/model/blogs_model/blog_tags_model.dart';
import 'package:vcyberiz/data/model/blogs_model/blogs_header_model.dart';
import 'package:vcyberiz/data/model/blogs_model/blogs_list.dart';
import 'package:vcyberiz/data/model/blogs_model/related_blogs_model.dart';

import '../../core/error/exceptions.dart';
import '../../main.dart';
import '../model/blogs_model/blogs_model.dart';
import '../services/blogs_service.dart';

class BlogsDataSource {
  BlogsDataSource();
  final BlogsServices service = autoInjector.get<BlogsServices>();
  Future<BlogsModel> getBlogsDataApi() async {
    try {
      final Response? response = await service.getBlogsDataApi();
      final BlogsModel model =
          BlogsModel.fromJson(response?.data as Map<String, dynamic>);
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

  Future<BlogsHeaderModel> getBlogHeaderApi() async {
    try {
      final Response? response = await service.getBlogHeaderApi();
      final BlogsHeaderModel model =
          BlogsHeaderModel.fromJson(response?.data as Map<String, dynamic>);
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

  Future<BlogsListModel> getBlogListApi() async {
    try {
      final Response? response = await service.getBlogListApi();
      final BlogsListModel model =
          BlogsListModel.fromJson(response?.data as Map<String, dynamic>);
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
      final Response? response = await service.getBlogCategoryApi();
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

  Future<TagsModel> getBlogTagsApi() async {
    try {
      final Response? response = await service.getBlogTagsApi();
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

  Future<BlogArticleModel> getBlogArticlesApi(
    String documentId,
  ) async {
    try {
      final Response? response = await service.getBlogArticlesApi(documentId);
      final BlogArticleModel model =
          BlogArticleModel.fromJson(response?.data as Map<String, dynamic>);
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

  Future<RelatedBlogsModel> getRelatedBlogSsApi() async {
    try {
      final Response? response = await service.getRelatedBlogSsApi();
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
