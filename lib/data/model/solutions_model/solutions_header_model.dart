// To parse this JSON data, do
//
//     final serviceHeaderModel = serviceHeaderModelFromJson(jsonString);

import 'dart:convert';

SolutionsHeaderModel serviceHeaderModelFromJson(String str) =>
    SolutionsHeaderModel.fromJson(json.decode(str));

String serviceHeaderModelToJson(SolutionsHeaderModel data) =>
    json.encode(data.toJson());

class SolutionsHeaderModel {
  HeaderData? data;
  Meta? meta;

  SolutionsHeaderModel({
    this.data,
    this.meta,
  });

  factory SolutionsHeaderModel.fromJson(Map<String, dynamic> json) =>
      SolutionsHeaderModel(
        data: json["data"] == null ? null : HeaderData.fromJson(json["data"]),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "meta": meta?.toJson(),
      };
}

class HeaderData {
  int? id;
  String? documentId;
  String? secHeader;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? publishedAt;
  BgImg? bgImg;

  HeaderData({
    this.id,
    this.documentId,
    this.secHeader,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.bgImg,
  });

  factory HeaderData.fromJson(Map<String, dynamic> json) => HeaderData(
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
        bgImg: json["bg_img"] == null ? null : BgImg.fromJson(json["bg_img"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "documentId": documentId,
        "sec_header": secHeader,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "publishedAt": publishedAt?.toIso8601String(),
        "bg_img": bgImg?.toJson(),
      };
}

class BgImg {
  int? id;
  String? url;
  String? name;
  String? mime;
  String? label;

  BgImg({
    this.id,
    this.url,
    this.name,
    this.mime,
    this.label,
  });

  factory BgImg.fromJson(Map<String, dynamic> json) => BgImg(
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
