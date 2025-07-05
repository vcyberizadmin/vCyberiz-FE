// To parse this JSON data, do
//
//     final resourceHeaderModel = resourceHeaderModelFromJson(jsonString);

import 'dart:convert';

ResourceHeaderModel resourceHeaderModelFromJson(String str) =>
    ResourceHeaderModel.fromJson(json.decode(str));

String resourceHeaderModelToJson(ResourceHeaderModel data) =>
    json.encode(data.toJson());

class ResourceHeaderModel {
  final ResourceHeaderData? data;
  final Meta? meta;

  ResourceHeaderModel({
    this.data,
    this.meta,
  });

  factory ResourceHeaderModel.fromJson(Map<String, dynamic> json) =>
      ResourceHeaderModel(
        data: json["data"] == null
            ? null
            : ResourceHeaderData.fromJson(json["data"]),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "meta": meta?.toJson(),
      };
}

class ResourceHeaderData {
  final int? id;
  final String? documentId;
  final String? secHeader;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? publishedAt;
  final SecBgImg? secBgImg;

  ResourceHeaderData({
    this.id,
    this.documentId,
    this.secHeader,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.secBgImg,
  });

  factory ResourceHeaderData.fromJson(Map<String, dynamic> json) =>
      ResourceHeaderData(
        id: json["id"],
        documentId: json["documentId"],
        secHeader: json["Sec_header"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        publishedAt: json["publishedAt"] == null
            ? null
            : DateTime.parse(json["publishedAt"]),
        secBgImg: json["sec_bg_img"] == null
            ? null
            : SecBgImg.fromJson(json["sec_bg_img"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "documentId": documentId,
        "Sec_header": secHeader,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "publishedAt": publishedAt?.toIso8601String(),
        "sec_bg_img": secBgImg?.toJson(),
      };
}

class SecBgImg {
  final int? id;
  final String? url;
  final String? name;
  final String? mime;
  final String? label;

  SecBgImg({
    this.id,
    this.url,
    this.name,
    this.mime,
    this.label,
  });

  factory SecBgImg.fromJson(Map<String, dynamic> json) => SecBgImg(
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
