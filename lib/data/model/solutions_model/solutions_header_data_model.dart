// To parse this JSON data, do
//
//     final solutionsHeaderDataModel = solutionsHeaderDataModelFromJson(jsonString);

import 'dart:convert';

SolutionsHeaderDataModel solutionsHeaderDataModelFromJson(String str) =>
    SolutionsHeaderDataModel.fromJson(json.decode(str));

String solutionsHeaderDataModelToJson(SolutionsHeaderDataModel data) =>
    json.encode(data.toJson());

class SolutionsHeaderDataModel {
  final SolutionsHeaderData? data;
  final Meta? meta;

  SolutionsHeaderDataModel({
    this.data,
    this.meta,
  });

  factory SolutionsHeaderDataModel.fromJson(Map<String, dynamic> json) =>
      SolutionsHeaderDataModel(
        data: json["data"] == null
            ? null
            : SolutionsHeaderData.fromJson(json["data"]),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "meta": meta?.toJson(),
      };
}

class SolutionsHeaderData {
  final int? id;
  final String? documentId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? publishedAt;
  final SecBanner? secBanner;

  SolutionsHeaderData({
    this.id,
    this.documentId,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.secBanner,
  });

  factory SolutionsHeaderData.fromJson(Map<String, dynamic> json) =>
      SolutionsHeaderData(
        id: json["id"],
        documentId: json["documentId"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        publishedAt: json["publishedAt"] == null
            ? null
            : DateTime.parse(json["publishedAt"]),
        secBanner: json["sec_banner"] == null
            ? null
            : SecBanner.fromJson(json["sec_banner"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "documentId": documentId,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "publishedAt": publishedAt?.toIso8601String(),
        "sec_banner": secBanner?.toJson(),
      };
}

class SecBanner {
  final int? id;
  final dynamic secLabel;
  final String? secHeader;
  final String? secDescription;
  final SecImg? secImg;
  final dynamic secCta;

  SecBanner({
    this.id,
    this.secLabel,
    this.secHeader,
    this.secDescription,
    this.secImg,
    this.secCta,
  });

  factory SecBanner.fromJson(Map<String, dynamic> json) => SecBanner(
        id: json["id"],
        secLabel: json["sec_label"],
        secHeader: json["sec_header"],
        secDescription: json["sec_description"],
        secImg:
            json["sec_img"] == null ? null : SecImg.fromJson(json["sec_img"]),
        secCta: json["sec_cta"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "sec_label": secLabel,
        "sec_header": secHeader,
        "sec_description": secDescription,
        "sec_img": secImg?.toJson(),
        "sec_cta": secCta,
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
