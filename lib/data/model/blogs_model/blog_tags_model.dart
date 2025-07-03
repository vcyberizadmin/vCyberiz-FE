// To parse this JSON data, do
//
//     final blogsTagsModel = blogsTagsModelFromJson(jsonString);

import 'dart:convert';

TagsModel blogsTagsModelFromJson(String str) =>
    TagsModel.fromJson(json.decode(str));

String blogsTagsModelToJson(TagsModel data) => json.encode(data.toJson());

class TagsModel {
  BlogTagsData? data;
  Meta? meta;

  TagsModel({
    this.data,
    this.meta,
  });

  factory TagsModel.fromJson(Map<String, dynamic> json) => TagsModel(
        data: json["data"] == null ? null : BlogTagsData.fromJson(json["data"]),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "meta": meta?.toJson(),
      };
}

class BlogTagsData {
  int? id;
  String? documentId;
  String? secHeader;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? publishedAt;
  List<BlogTag>? blogTags;

  BlogTagsData({
    this.id,
    this.documentId,
    this.secHeader,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.blogTags,
  });

  factory BlogTagsData.fromJson(Map<String, dynamic> json) => BlogTagsData(
        id: json["id"],
        documentId: json["documentId"],
        secHeader: json["sec_header"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        publishedAt: json["publishedAt"] == null
            ? null
            : DateTime.parse(json["publishedAt"]),
        blogTags: json["blog_tags"] == null
            ? []
            : List<BlogTag>.from(
                json["blog_tags"]!.map((x) => BlogTag.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "documentId": documentId,
        "sec_header": secHeader,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "publishedAt": publishedAt?.toIso8601String(),
        "blog_tags": blogTags == null
            ? []
            : List<dynamic>.from(blogTags!.map((x) => x.toJson())),
      };
}

class BlogTag {
  int? id;
  String? documentId;
  String? name;
  String? tid;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? publishedAt;

  BlogTag({
    this.id,
    this.documentId,
    this.name,
    this.tid,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
  });

  factory BlogTag.fromJson(Map<String, dynamic> json) => BlogTag(
        id: json["id"],
        documentId: json["documentId"],
        name: json["name"],
        tid: json["tid"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        publishedAt: json["publishedAt"] == null
            ? null
            : DateTime.parse(json["publishedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "documentId": documentId,
        "name": name,
        "tid": tid,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "publishedAt": publishedAt?.toIso8601String(),
      };
}

class Meta {
  Meta();

  factory Meta.fromJson(Map<String, dynamic> json) => Meta();

  Map<String, dynamic> toJson() => {};
}
