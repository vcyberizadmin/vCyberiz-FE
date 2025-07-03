// To parse this JSON data, do
//
//     final nwsHeaderModel = nwsHeaderModelFromJson(jsonString);

import 'dart:convert';

NewsHeaderModel nwsHeaderModelFromJson(String str) =>
    NewsHeaderModel.fromJson(json.decode(str));

String nwsHeaderModelToJson(NewsHeaderModel data) => json.encode(data.toJson());

class NewsHeaderModel {
  final NewsHeaderData? data;
  final Meta? meta;

  NewsHeaderModel({
    this.data,
    this.meta,
  });

  factory NewsHeaderModel.fromJson(Map<String, dynamic> json) =>
      NewsHeaderModel(
        data:
            json["data"] == null ? null : NewsHeaderData.fromJson(json["data"]),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "meta": meta?.toJson(),
      };
}

class NewsHeaderData {
  final int? id;
  final String? documentId;
  final String? secHeader;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? publishedAt;
  final SecBgImg? secBgImg;

  NewsHeaderData({
    this.id,
    this.documentId,
    this.secHeader,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.secBgImg,
  });

  factory NewsHeaderData.fromJson(Map<String, dynamic> json) => NewsHeaderData(
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
        secBgImg: json["sec_bg_img"] == null
            ? null
            : SecBgImg.fromJson(json["sec_bg_img"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "documentId": documentId,
        "sec_header": secHeader,
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
