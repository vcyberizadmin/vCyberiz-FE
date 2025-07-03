// To parse this JSON data, do
//
//     final blogsListModel = blogsListModelFromJson(jsonString);

import 'dart:convert';

BlogsListModel blogsListModelFromJson(String str) =>
    BlogsListModel.fromJson(json.decode(str));

String blogsListModelToJson(BlogsListModel data) => json.encode(data.toJson());

class BlogsListModel {
  final List<BlogsListData>? data;
  final Meta? meta;

  BlogsListModel({
    this.data,
    this.meta,
  });

  factory BlogsListModel.fromJson(Map<String, dynamic> json) => BlogsListModel(
        data: json["data"] == null
            ? []
            : List<BlogsListData>.from(
                json["data"]!.map((x) => BlogsListData.fromJson(x))),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "meta": meta?.toJson(),
      };
}

class BlogsListData {
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
  final List<Blog>? blogTags;
  final Blog? blogAuthor;
  final List<Blog>? blogCategories;
  final SecCta? secCta;
  final Img? secImg;
  final Img? thumbnailImg;

  BlogsListData({
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
    this.blogTags,
    this.blogAuthor,
    this.blogCategories,
    this.secCta,
    this.secImg,
    this.thumbnailImg,
  });

  factory BlogsListData.fromJson(Map<String, dynamic> json) => BlogsListData(
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
        blogTags: json["blog_tags"] == null
            ? []
            : List<Blog>.from(json["blog_tags"]!.map((x) => Blog.fromJson(x))),
        blogAuthor: json["blog_author"] == null
            ? null
            : Blog.fromJson(json["blog_author"]),
        blogCategories: json["blog_categories"] == null
            ? []
            : List<Blog>.from(
                json["blog_categories"]!.map((x) => Blog.fromJson(x))),
        secCta:
            json["sec_cta"] == null ? null : SecCta.fromJson(json["sec_cta"]),
        secImg: json["sec_img"] == null ? null : Img.fromJson(json["sec_img"]),
        thumbnailImg: json["thumbnail_img"] == null
            ? null
            : Img.fromJson(json["thumbnail_img"]),
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
        "blog_tags": blogTags == null
            ? []
            : List<dynamic>.from(blogTags!.map((x) => x.toJson())),
        "blog_author": blogAuthor?.toJson(),
        "blog_categories": blogCategories == null
            ? []
            : List<dynamic>.from(blogCategories!.map((x) => x.toJson())),
        "sec_cta": secCta?.toJson(),
        "sec_img": secImg?.toJson(),
        "thumbnail_img": thumbnailImg?.toJson(),
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

class Img {
  final int? id;
  final String? url;
  final String? name;
  final Mime? mime;
  final String? label;

  Img({
    this.id,
    this.url,
    this.name,
    this.mime,
    this.label,
  });

  factory Img.fromJson(Map<String, dynamic> json) => Img(
        id: json["id"],
        url: json["url"],
        name: json["name"],
        mime: mimeValues.map[json["mime"]]!,
        label: json["label"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
        "name": name,
        "mime": mimeValues.reverse[mime],
        "label": label,
      };
}

enum Mime { IMAGE_WEBP, IMG_PNG }

final mimeValues =
    EnumValues({"image/webp": Mime.IMAGE_WEBP, "img/png": Mime.IMG_PNG});

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
