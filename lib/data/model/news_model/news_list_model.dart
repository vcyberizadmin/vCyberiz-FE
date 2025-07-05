// To parse this JSON data, do
//
//     final newsListModel = newsListModelFromJson(jsonString);

import 'dart:convert';

NewsListModel newsListModelFromJson(String str) =>
    NewsListModel.fromJson(json.decode(str));

String newsListModelToJson(NewsListModel data) => json.encode(data.toJson());

class NewsListModel {
  final List<NewsListData>? data;
  final Meta? meta;

  NewsListModel({
    this.data,
    this.meta,
  });

  factory NewsListModel.fromJson(Map<String, dynamic> json) => NewsListModel(
        data: json["data"] == null
            ? []
            : List<NewsListData>.from(
                json["data"]!.map((x) => NewsListData.fromJson(x))),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "meta": meta?.toJson(),
      };
}

class NewsListData {
  final int? id;
  final String? documentId;
  final String? newsId;
  final String? title;
  final String? description;
  final DateTime? publicationDate;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? publishedAt;
  final String? globalUrl;
  final List<ArticleSection>? articleSection;
  final Blog? blogAuthor;
  final List<Blog>? blogCategories;
  final List<Blog>? blogTags;
  final SecImg? secImg;
  final SecCta? secCta;

  NewsListData({
    this.id,
    this.documentId,
    this.newsId,
    this.title,
    this.description,
    this.publicationDate,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.globalUrl,
    this.articleSection,
    this.blogAuthor,
    this.blogCategories,
    this.blogTags,
    this.secImg,
    this.secCta,
  });

  factory NewsListData.fromJson(Map<String, dynamic> json) => NewsListData(
        id: json["id"],
        documentId: json["documentId"],
        newsId: json["news_id"],
        title: json["title"],
        description: json["description"],
        publicationDate: json["publication_date"] == null
            ? null
            : DateTime.parse(json["publication_date"]),
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        publishedAt: json["publishedAt"] == null
            ? null
            : DateTime.parse(json["publishedAt"]),
        globalUrl: json["global_url"],
        articleSection: json["article_section"] == null
            ? []
            : List<ArticleSection>.from(json["article_section"]!
                .map((x) => ArticleSection.fromJson(x))),
        blogAuthor: json["blog_author"] == null
            ? null
            : Blog.fromJson(json["blog_author"]),
        blogCategories: json["blog_categories"] == null
            ? []
            : List<Blog>.from(
                json["blog_categories"]!.map((x) => Blog.fromJson(x))),
        blogTags: json["blog_tags"] == null
            ? []
            : List<Blog>.from(json["blog_tags"]!.map((x) => Blog.fromJson(x))),
        secImg:
            json["sec_img"] == null ? null : SecImg.fromJson(json["sec_img"]),
        secCta:
            json["sec_cta"] == null ? null : SecCta.fromJson(json["sec_cta"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "documentId": documentId,
        "news_id": newsId,
        "title": title,
        "description": description,
        "publication_date": publicationDate?.toIso8601String(),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "publishedAt": publishedAt?.toIso8601String(),
        "global_url": globalUrl,
        "article_section": articleSection == null
            ? []
            : List<dynamic>.from(articleSection!.map((x) => x.toJson())),
        "blog_author": blogAuthor?.toJson(),
        "blog_categories": blogCategories == null
            ? []
            : List<dynamic>.from(blogCategories!.map((x) => x.toJson())),
        "blog_tags": blogTags == null
            ? []
            : List<dynamic>.from(blogTags!.map((x) => x.toJson())),
        "sec_img": secImg?.toJson(),
        "sec_cta": secCta?.toJson(),
      };
}

class ArticleSection {
  final String? type;
  final List<ArticleSectionChild>? children;
  final String? format;

  ArticleSection({
    this.type,
    this.children,
    this.format,
  });

  factory ArticleSection.fromJson(Map<String, dynamic> json) => ArticleSection(
        type: json["type"],
        children: json["children"] == null
            ? []
            : List<ArticleSectionChild>.from(
                json["children"]!.map((x) => ArticleSectionChild.fromJson(x))),
        format: json["format"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "children": children == null
            ? []
            : List<dynamic>.from(children!.map((x) => x.toJson())),
        "format": format,
      };
}

class ArticleSectionChild {
  final String? text;
  final Type? type;
  final List<ChildChild>? children;
  final bool? bold;
  final String? url;

  ArticleSectionChild({
    this.text,
    this.type,
    this.children,
    this.bold,
    this.url,
  });

  factory ArticleSectionChild.fromJson(Map<String, dynamic> json) =>
      ArticleSectionChild(
        text: json["text"],
        type: typeValues.map[json["type"]]!,
        children: json["children"] == null
            ? []
            : List<ChildChild>.from(
                json["children"]!.map((x) => ChildChild.fromJson(x))),
        bold: json["bold"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "type": typeValues.reverse[type],
        "children": children == null
            ? []
            : List<dynamic>.from(children!.map((x) => x.toJson())),
        "bold": bold,
        "url": url,
      };
}

class ChildChild {
  final bool? bold;
  final String? text;
  final Type? type;

  ChildChild({
    this.bold,
    this.text,
    this.type,
  });

  factory ChildChild.fromJson(Map<String, dynamic> json) => ChildChild(
        bold: json["bold"],
        text: json["text"],
        type: typeValues.map[json["type"]]!,
      );

  Map<String, dynamic> toJson() => {
        "bold": bold,
        "text": text,
        "type": typeValues.reverse[type],
      };
}

enum Type { LINK, LIST_ITEM, TEXT }

final typeValues = EnumValues(
    {"link": Type.LINK, "list-item": Type.LIST_ITEM, "text": Type.TEXT});

class Blog {
  final int? id;
  final String? documentId;
  final String? name;
  final String? uid;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? publishedAt;
  final String? cid;
  final String? tid;

  Blog({
    this.id,
    this.documentId,
    this.name,
    this.uid,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.cid,
    this.tid,
  });

  factory Blog.fromJson(Map<String, dynamic> json) => Blog(
        id: json["id"],
        documentId: json["documentId"],
        name: json["name"],
        uid: json["uid"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        publishedAt: json["publishedAt"] == null
            ? null
            : DateTime.parse(json["publishedAt"]),
        cid: json["cid"],
        tid: json["tid"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "documentId": documentId,
        "name": name,
        "uid": uid,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "publishedAt": publishedAt?.toIso8601String(),
        "cid": cid,
        "tid": tid,
      };
}

class SecCta {
  final int? id;
  final String? label;
  final String? href;
  final bool? isExternal;
  final String? type;

  SecCta({
    this.id,
    this.label,
    this.href,
    this.isExternal,
    this.type,
  });

  factory SecCta.fromJson(Map<String, dynamic> json) => SecCta(
        id: json["id"],
        label: json["label"],
        href: json["href"],
        isExternal: json["isExternal"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "label": label,
        "href": href,
        "isExternal": isExternal,
        "type": type,
      };
}

class SecImg {
  final int? id;
  final String? url;
  final String? name;
  final String? mime;
  final String? label;

  SecImg({
    this.id,
    this.url,
    this.name,
    this.mime,
    this.label,
  });

  factory SecImg.fromJson(Map<String, dynamic> json) => SecImg(
        id: json["id"],
        url: json["url"],
        name: json["name"],
        mime: json["mime"],
        label: json["label"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
        "name": name,
        "mime": mime,
        "label": label,
      };
}

class Meta {
  final Pagination? pagination;

  Meta({
    this.pagination,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        pagination: json["pagination"] == null
            ? null
            : Pagination.fromJson(json["pagination"]),
      );

  Map<String, dynamic> toJson() => {
        "pagination": pagination?.toJson(),
      };
}

class Pagination {
  final int? page;
  final int? pageSize;
  final int? pageCount;
  final int? total;

  Pagination({
    this.page,
    this.pageSize,
    this.pageCount,
    this.total,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        page: json["page"],
        pageSize: json["pageSize"],
        pageCount: json["pageCount"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "pageSize": pageSize,
        "pageCount": pageCount,
        "total": total,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
