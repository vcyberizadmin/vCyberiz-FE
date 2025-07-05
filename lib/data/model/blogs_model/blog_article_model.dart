// To parse this JSON data, do
//
//     final blogArticleModel = blogArticleModelFromJson(jsonString);

import 'dart:convert';

BlogArticleModel blogArticleModelFromJson(String str) =>
    BlogArticleModel.fromJson(json.decode(str));

String blogArticleModelToJson(BlogArticleModel data) =>
    json.encode(data.toJson());

class BlogArticleModel {
  final BlogArticleData? data;
  final Meta? meta;

  BlogArticleModel({
    this.data,
    this.meta,
  });

  factory BlogArticleModel.fromJson(Map<String, dynamic> json) =>
      BlogArticleModel(
        data: json["data"] == null
            ? null
            : BlogArticleData.fromJson(json["data"]),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "meta": meta?.toJson(),
      };
}

class BlogArticleData {
  final int? id;
  final String? documentId;
  final String? blogId;
  final String? title;
  final String? description;
  final DateTime? publicationDate;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? publishedAt;
  final String? globalUrl;
  final List<ArticleSection>? articleSection;
  final SecImg? secImg;
  final Blog? blogAuthor;
  final List<Blog>? blogTags;
  final List<Blog>? blogCategories;
  final dynamic secCta;

  BlogArticleData({
    this.id,
    this.documentId,
    this.blogId,
    this.title,
    this.description,
    this.publicationDate,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.globalUrl,
    this.articleSection,
    this.secImg,
    this.blogAuthor,
    this.blogTags,
    this.blogCategories,
    this.secCta,
  });

  factory BlogArticleData.fromJson(Map<String, dynamic> json) =>
      BlogArticleData(
        id: json["id"],
        documentId: json["documentId"],
        blogId: json["blogId"],
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
        secCta: json["sec_cta"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "documentId": documentId,
        "blogId": blogId,
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
        "sec_img": secImg?.toJson(),
        "blog_author": blogAuthor?.toJson(),
        "blog_tags": blogTags == null
            ? []
            : List<dynamic>.from(blogTags!.map((x) => x.toJson())),
        "blog_categories": blogCategories == null
            ? []
            : List<dynamic>.from(blogCategories!.map((x) => x.toJson())),
        "sec_cta": secCta,
      };
}

class ArticleSection {
  final String? type;
  final int? level;
  final List<ArticleSectionChild>? children;
  final String? format;

  ArticleSection({
    this.type,
    this.level,
    this.children,
    this.format,
  });

  factory ArticleSection.fromJson(Map<String, dynamic> json) => ArticleSection(
        type: json["type"],
        level: json["level"],
        children: json["children"] == null
            ? []
            : List<ArticleSectionChild>.from(
                json["children"]!.map((x) => ArticleSectionChild.fromJson(x))),
        format: json["format"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "level": level,
        "children": children == null
            ? []
            : List<dynamic>.from(children!.map((x) => x.toJson())),
        "format": format,
      };
}

class ArticleSectionChild {
  final bool? bold;
  final String? text;
  final String? type;
  final List<ChildChild>? children;
  final String? url;

  ArticleSectionChild({
    this.bold,
    this.text,
    this.type,
    this.children,
    this.url,
  });

  factory ArticleSectionChild.fromJson(Map<String, dynamic> json) =>
      ArticleSectionChild(
        bold: json["bold"],
        text: json["text"],
        type: json["type"],
        children: json["children"] == null
            ? []
            : List<ChildChild>.from(
                json["children"]!.map((x) => ChildChild.fromJson(x))),
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "bold": bold,
        "text": text,
        "type": type,
        "children": children == null
            ? []
            : List<dynamic>.from(children!.map((x) => x.toJson())),
        "url": url,
      };
}

class ChildChild {
  final bool? bold;
  final String? text;
  final String? type;

  ChildChild({
    this.bold,
    this.text,
    this.type,
  });

  factory ChildChild.fromJson(Map<String, dynamic> json) => ChildChild(
        bold: json["bold"],
        text: json["text"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "bold": bold,
        "text": text,
        "type": type,
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
  Meta();

  factory Meta.fromJson(Map<String, dynamic> json) => Meta();

  Map<String, dynamic> toJson() => {};
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
