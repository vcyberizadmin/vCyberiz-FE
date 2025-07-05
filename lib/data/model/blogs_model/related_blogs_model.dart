// To parse this JSON data, do
//
//     final relatedBlogsModel = relatedBlogsModelFromJson(jsonString);

import 'dart:convert';

RelatedBlogsModel relatedBlogsModelFromJson(String str) =>
    RelatedBlogsModel.fromJson(json.decode(str));

String relatedBlogsModelToJson(RelatedBlogsModel data) =>
    json.encode(data.toJson());

class RelatedBlogsModel {
  List<RelatedBlogs>? data;
  Meta? meta;

  RelatedBlogsModel({
    this.data,
    this.meta,
  });

  factory RelatedBlogsModel.fromJson(Map<String, dynamic> json) =>
      RelatedBlogsModel(
        data: json["data"] == null
            ? []
            : List<RelatedBlogs>.from(
                json["data"]!.map((x) => RelatedBlogs.fromJson(x))),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "meta": meta?.toJson(),
      };
}

class RelatedBlogs {
  int? id;
  String? documentId;
  String? blogId;
  String? title;
  String? description;
  DateTime? publicationDate;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? publishedAt;
  List<Blog>? blogCategories;
  List<Blog>? blogTags;
  SecImg? secImg;
  SecCta? secCta;

  RelatedBlogs({
    this.id,
    this.documentId,
    this.blogId,
    this.title,
    this.description,
    this.publicationDate,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.blogCategories,
    this.blogTags,
    this.secImg,
    this.secCta,
  });

  factory RelatedBlogs.fromJson(Map<String, dynamic> json) => RelatedBlogs(
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
        "blogId": blogId,
        "title": title,
        "description": description,
        "publication_date": publicationDate?.toIso8601String(),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "publishedAt": publishedAt?.toIso8601String(),
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

class Blog {
  int? id;
  String? documentId;
  String? name;
  String? cid;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? publishedAt;
  String? tid;

  Blog({
    this.id,
    this.documentId,
    this.name,
    this.cid,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.tid,
  });

  factory Blog.fromJson(Map<String, dynamic> json) => Blog(
        id: json["id"],
        documentId: json["documentId"],
        name: json["name"],
        cid: json["cid"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        publishedAt: json["publishedAt"] == null
            ? null
            : DateTime.parse(json["publishedAt"]),
        tid: json["tid"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "documentId": documentId,
        "name": name,
        "cid": cid,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "publishedAt": publishedAt?.toIso8601String(),
        "tid": tid,
      };
}

class SecCta {
  int? id;
  String? label;
  String? href;
  bool? isExternal;
  String? type;

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
  int? id;
  String? url;
  String? name;
  String? mime;
  String? label;

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
  Pagination? pagination;

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
  int? page;
  int? pageSize;
  int? pageCount;
  int? total;

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
