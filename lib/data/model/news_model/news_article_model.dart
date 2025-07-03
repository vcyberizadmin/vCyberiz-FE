// To parse this JSON data, do
//
//     final newsArtilceModel = newsArtilceModelFromJson(jsonString);

import 'dart:convert';

NewsArtilceModel newsArtilceModelFromJson(String str) =>
    NewsArtilceModel.fromJson(json.decode(str));

String newsArtilceModelToJson(NewsArtilceModel data) =>
    json.encode(data.toJson());

class NewsArtilceModel {
  final NewsArticleData? data;
  final Meta? meta;

  NewsArtilceModel({
    this.data,
    this.meta,
  });

  factory NewsArtilceModel.fromJson(Map<String, dynamic> json) =>
      NewsArtilceModel(
        data: json["data"] == null
            ? null
            : NewsArticleData.fromJson(json["data"]),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "meta": meta?.toJson(),
      };
}

class NewsArticleData {
  final int? id;
  final String? documentId;
  final String? newsId;
  final String? title;
  final String? description;
  final DateTime? publicationDate;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? publishedAt;
  final dynamic globalUrl;
  final SecImg? secImg;
  final Blog? blogAuthor;
  final List<Blog>? blogTags;
  final List<Blog>? blogCategories;
  final SecCta? secCta;
  final List<NewsSection>? newsSection;

  NewsArticleData({
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
    this.secImg,
    this.blogAuthor,
    this.blogTags,
    this.blogCategories,
    this.secCta,
    this.newsSection,
  });

  factory NewsArticleData.fromJson(Map<String, dynamic> json) =>
      NewsArticleData(
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
        secImg:
            json["sec_img"] == null ? null : SecImg.fromJson(json["sec_img"]),
        blogAuthor: json["blog_author"] == null
            ? null
            : Blog.fromJson(json["blog_author"]),
        blogTags: json["blog_tags"] == null
            ? []
            : List<Blog>.from(json["blog_tags"]!.map((x) => Blog.fromJson(x))),
        blogCategories: json["blog_categories"] == null
            ? []
            : List<Blog>.from(
                json["blog_categories"]!.map((x) => Blog.fromJson(x))),
        secCta:
            json["sec_cta"] == null ? null : SecCta.fromJson(json["sec_cta"]),
        newsSection: json["news_section"] == null
            ? []
            : List<NewsSection>.from(
                json["news_section"]!.map((x) => NewsSection.fromJson(x))),
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
        "sec_img": secImg?.toJson(),
        "blog_author": blogAuthor?.toJson(),
        "blog_tags": blogTags == null
            ? []
            : List<dynamic>.from(blogTags!.map((x) => x.toJson())),
        "blog_categories": blogCategories == null
            ? []
            : List<dynamic>.from(blogCategories!.map((x) => x.toJson())),
        "sec_cta": secCta?.toJson(),
        "news_section": newsSection == null
            ? []
            : List<dynamic>.from(newsSection!.map((x) => x.toJson())),
      };
}

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

class NewsSection {
  final String? component;
  final int? id;
  final String? header;
  final String? content;
  final List<SecImg>? secImg;

  NewsSection({
    this.component,
    this.id,
    this.header,
    this.content,
    this.secImg,
  });

  factory NewsSection.fromJson(Map<String, dynamic> json) => NewsSection(
        component: json["__component"],
        id: json["id"],
        header: json["header"],
        content: json["content"],
        secImg: json["sec_img"] == null
            ? []
            : List<SecImg>.from(
                json["sec_img"]!.map((x) => SecImg.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "__component": component,
        "id": id,
        "header": header,
        "content": content,
        "sec_img": secImg == null
            ? []
            : List<dynamic>.from(secImg!.map((x) => x.toJson())),
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

class Meta {
  Meta();

  factory Meta.fromJson(Map<String, dynamic> json) => Meta();

  Map<String, dynamic> toJson() => {};
}
