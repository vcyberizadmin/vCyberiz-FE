import 'package:logger/logger.dart';
import 'package:vcyberiz/data/data_source/news_data_source.dart';
import 'package:vcyberiz/data/model/blogs_model/blog_category_model.dart';
import 'package:vcyberiz/data/model/blogs_model/blog_marketing_model.dart';
import 'package:vcyberiz/data/model/blogs_model/blog_tags_model.dart';
import 'package:vcyberiz/data/model/blogs_model/related_blogs_model.dart';
import 'package:vcyberiz/data/model/ebook_model/ebook_model.dart';
import 'package:vcyberiz/data/model/news_model/news_article_model.dart';
import 'package:vcyberiz/data/model/news_model/news_header_model.dart';
import 'package:vcyberiz/data/model/news_model/news_list_model.dart';

import '../../core/error/exceptions.dart';
import '../../core/helper/logger.dart';

class NewsRepository {
  final NewsDataSource _dataSource;

  NewsRepository({
    required NewsDataSource dataSource,
  }) : _dataSource = dataSource;

  Future<NewsHeaderModel> getNewHeaderApi() async {
    try {
      final NewsHeaderModel response = await _dataSource.getNewHeaderApi();
      return response;
    } on APIException catch (e) {
      logger.log(Level.debug, e);
      rethrow;
    }
  }

  Future<NewsListModel> getNewsListApi() async {
    try {
      final NewsListModel response = await _dataSource.getNewsListApi();
      return response;
    } on APIException catch (e) {
      logger.log(Level.debug, e);
      rethrow;
    }
  }

  Future<EbookModel> getEbookListApi() async {
    try {
      final EbookModel response = await _dataSource.getEbookListApi();
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

  Future<TagsModel> getNewTagsApi() async {
    try {
      final TagsModel response = await _dataSource.getNewTagsApi();
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

  Future<NewsArtilceModel> getNewsArticlesApi(
    String documentId,
  ) async {
    try {
      final NewsArtilceModel response =
          await _dataSource.getNewsArticlesApi(documentId);
      return response;
    } on APIException catch (e) {
      logger.log(Level.debug, e);
      rethrow;
    }
  }

  Future<RelatedBlogsModel> getRelatedNewsApi() async {
    try {
      final RelatedBlogsModel response = await _dataSource.getRelatedNewsApi();
      return response;
    } on APIException catch (e) {
      logger.log(Level.debug, e);
      rethrow;
    }
  }
}
