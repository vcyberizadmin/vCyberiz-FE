import 'package:logger/logger.dart';
import 'package:vcyberiz/data/model/blogs_model/blog_article_model.dart';
import 'package:vcyberiz/data/model/blogs_model/blog_category_model.dart';
import 'package:vcyberiz/data/model/blogs_model/blog_marketing_model.dart';
import 'package:vcyberiz/data/model/blogs_model/blog_tags_model.dart';
import 'package:vcyberiz/data/model/blogs_model/blogs_header_model.dart';
import 'package:vcyberiz/data/model/blogs_model/blogs_list.dart';
import 'package:vcyberiz/data/model/blogs_model/related_blogs_model.dart';

import '../../core/error/exceptions.dart';
import '../../core/helper/logger.dart';
import '../data_source/blogs_data_source.dart';
import '../model/blogs_model/blogs_model.dart';

class BlogsRepository {
  final BlogsDataSource _dataSource;

  BlogsRepository({
    required BlogsDataSource dataSource,
  }) : _dataSource = dataSource;
  Future<BlogsModel> getBlogsDataApi() async {
    try {
      final BlogsModel response = await _dataSource.getBlogsDataApi();
      return response;
    } on APIException catch (e) {
      logger.log(Level.debug, e);
      rethrow;
    }
  }

  Future<BlogsHeaderModel> getBlogHeaderApi() async {
    try {
      final BlogsHeaderModel response = await _dataSource.getBlogHeaderApi();
      return response;
    } on APIException catch (e) {
      logger.log(Level.debug, e);
      rethrow;
    }
  }

  Future<BlogsListModel> getBlogListApi() async {
    try {
      final BlogsListModel response = await _dataSource.getBlogListApi();
      return response;
    } on APIException catch (e) {
      logger.log(Level.debug, e);
      rethrow;
    }
  }

  Future<CategoriesModel> getBlogCategoryApi() async {
    try {
      final CategoriesModel response = await _dataSource.getBlogCategoryApi();
      return response;
    } on APIException catch (e) {
      logger.log(Level.debug, e);
      rethrow;
    }
  }

  Future<TagsModel> getBlogTagsApi() async {
    try {
      final TagsModel response = await _dataSource.getBlogTagsApi();
      return response;
    } on APIException catch (e) {
      logger.log(Level.debug, e);
      rethrow;
    }
  }

  Future<BlogMarketingModel> getMarketingApi() async {
    try {
      final BlogMarketingModel response = await _dataSource.getMarketingApi();
      return response;
    } on APIException catch (e) {
      logger.log(Level.debug, e);
      rethrow;
    }
  }

  Future<BlogArticleModel> getBlogArticlesApi(
    String documentId,
  ) async {
    try {
      final BlogArticleModel response =
          await _dataSource.getBlogArticlesApi(documentId);
      return response;
    } on APIException catch (e) {
      logger.log(Level.debug, e);
      rethrow;
    }
  }

  Future<RelatedBlogsModel> getRelatedBlogSsApi() async {
    try {
      final RelatedBlogsModel response =
          await _dataSource.getRelatedBlogSsApi();
      return response;
    } on APIException catch (e) {
      logger.log(Level.debug, e);
      rethrow;
    }
  }
}
