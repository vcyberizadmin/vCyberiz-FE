// To parse this JSON data, do
//
//     final partnersTechnologyModel = partnersTechnologyModelFromJson(jsonString);

import 'dart:convert';

PartnersTechnologyModel partnersTechnologyModelFromJson(String str) =>
    PartnersTechnologyModel.fromJson(json.decode(str));

String partnersTechnologyModelToJson(PartnersTechnologyModel data) =>
    json.encode(data.toJson());

class PartnersTechnologyModel {
  final TechnologyData? data;
  final Meta? meta;

  PartnersTechnologyModel({
    this.data,
    this.meta,
  });

  factory PartnersTechnologyModel.fromJson(Map<String, dynamic> json) =>
      PartnersTechnologyModel(
        data:
            json["data"] == null ? null : TechnologyData.fromJson(json["data"]),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "meta": meta?.toJson(),
      };
}

class TechnologyData {
  final int? id;
  final String? documentId;
  final String? secHeader;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? publishedAt;
  final String? secDescription;
  final SecImg? secImg;

  TechnologyData({
    this.id,
    this.documentId,
    this.secHeader,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.secDescription,
    this.secImg,
  });

  factory TechnologyData.fromJson(Map<String, dynamic> json) => TechnologyData(
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
        secDescription: json["sec_description"],
        secImg:
            json["sec_img"] == null ? null : SecImg.fromJson(json["sec_img"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "documentId": documentId,
        "sec_header": secHeader,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "publishedAt": publishedAt?.toIso8601String(),
        "sec_description": secDescription,
        "sec_img": secImg?.toJson(),
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
