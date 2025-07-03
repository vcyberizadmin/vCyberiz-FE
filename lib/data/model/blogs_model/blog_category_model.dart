// ignore_for_file: public_member_api_docs, sort_constructors_first
// To parse this JSON data, do
//
//     final categoriesModel = categoriesModelFromJson(jsonString);

import 'dart:convert';

CategoriesModel categoriesModelFromJson(String str) =>
    CategoriesModel.fromJson(json.decode(str));

String categoriesModelToJson(CategoriesModel data) =>
    json.encode(data.toJson());

class CategoriesModel {
  final CategoryData? data;
  final Meta? meta;

  CategoriesModel({
    this.data,
    this.meta,
  });

  factory CategoriesModel.fromJson(Map<String, dynamic> json) =>
      CategoriesModel(
        data: json["data"] == null ? null : CategoryData.fromJson(json["data"]),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "meta": meta?.toJson(),
      };

  @override
  String toString() => 'CategoriesModel(data: $data, meta: $meta)';
}

class CategoryData {
  final int? id;
  final String? documentId;
  final String? secHeader;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? publishedAt;
  final List<BlogCategory>? blogCategories;
  final ListIndicator? listIndicator;

  CategoryData({
    this.id,
    this.documentId,
    this.secHeader,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.blogCategories,
    this.listIndicator,
  });

  factory CategoryData.fromJson(Map<String, dynamic> json) => CategoryData(
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
        blogCategories: json["blog_categories"] == null
            ? []
            : List<BlogCategory>.from(
                json["blog_categories"]!.map((x) => BlogCategory.fromJson(x))),
        listIndicator: json["list_indicator"] == null
            ? null
            : ListIndicator.fromJson(json["list_indicator"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "documentId": documentId,
        "sec_header": secHeader,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "publishedAt": publishedAt?.toIso8601String(),
        "blog_categories": blogCategories == null
            ? []
            : List<dynamic>.from(blogCategories!.map((x) => x.toJson())),
        "list_indicator": listIndicator?.toJson(),
      };

  @override
  String toString() {
    return 'CategoryData(id: $id, documentId: $documentId, secHeader: $secHeader, createdAt: $createdAt, updatedAt: $updatedAt, publishedAt: $publishedAt, blogCategories: $blogCategories, listIndicator: $listIndicator)';
  }
}

class BlogCategory {
  final int? id;
  final String? documentId;
  final String? name;
  final String? cid;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? publishedAt;

  BlogCategory({
    this.id,
    this.documentId,
    this.name,
    this.cid,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
  });

  factory BlogCategory.fromJson(Map<String, dynamic> json) => BlogCategory(
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
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "documentId": documentId,
        "name": name,
        "cid": cid,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "publishedAt": publishedAt?.toIso8601String(),
      };
}

class ListIndicator {
  final int? id;
  final String? url;
  final String? name;
  final String? mime;
  final String? label;

  ListIndicator({
    this.id,
    this.url,
    this.name,
    this.mime,
    this.label,
  });

  factory ListIndicator.fromJson(Map<String, dynamic> json) => ListIndicator(
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
