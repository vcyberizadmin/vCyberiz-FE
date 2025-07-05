// To parse this JSON data, do
//
//     final aboutUsOurValuesModel = aboutUsOurValuesModelFromJson(jsonString);

import 'dart:convert';

AboutUsOurValuesModel aboutUsOurValuesModelFromJson(String str) =>
    AboutUsOurValuesModel.fromJson(json.decode(str));

String aboutUsOurValuesModelToJson(AboutUsOurValuesModel data) =>
    json.encode(data.toJson());

class AboutUsOurValuesModel {
  final AboutUsOurValuesData? data;
  final Meta? meta;

  AboutUsOurValuesModel({
    this.data,
    this.meta,
  });

  factory AboutUsOurValuesModel.fromJson(Map<String, dynamic> json) =>
      AboutUsOurValuesModel(
        data: json["data"] == null
            ? null
            : AboutUsOurValuesData.fromJson(json["data"]),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "meta": meta?.toJson(),
      };
}

class AboutUsOurValuesData {
  final int? id;
  final String? documentId;
  final String? secHeader;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? publishedAt;
  final List<SecCard>? secCard;

  AboutUsOurValuesData({
    this.id,
    this.documentId,
    this.secHeader,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.secCard,
  });

  factory AboutUsOurValuesData.fromJson(Map<String, dynamic> json) =>
      AboutUsOurValuesData(
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
        secCard: json["sec_card"] == null
            ? []
            : List<SecCard>.from(
                json["sec_card"]!.map((x) => SecCard.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "documentId": documentId,
        "sec_header": secHeader,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "publishedAt": publishedAt?.toIso8601String(),
        "sec_card": secCard == null
            ? []
            : List<dynamic>.from(secCard!.map((x) => x.toJson())),
      };
}

class SecCard {
  final int? id;
  final String? secHeader;
  final String? description;
  final LogoImg? logoImg;

  SecCard({
    this.id,
    this.secHeader,
    this.description,
    this.logoImg,
  });

  factory SecCard.fromJson(Map<String, dynamic> json) => SecCard(
        id: json["id"],
        secHeader: json["sec_header"],
        description: json["description"],
        logoImg: json["logo_img"] == null
            ? null
            : LogoImg.fromJson(json["logo_img"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "sec_header": secHeader,
        "description": description,
        "logo_img": logoImg?.toJson(),
      };
}

class LogoImg {
  final int? id;
  final String? url;
  final String? name;
  final String? mime;
  final String? label;

  LogoImg({
    this.id,
    this.url,
    this.name,
    this.mime,
    this.label,
  });

  factory LogoImg.fromJson(Map<String, dynamic> json) => LogoImg(
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
