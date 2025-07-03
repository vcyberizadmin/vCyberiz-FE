// To parse this JSON data, do
//
//     final aboutUsOurSecretModel = aboutUsOurSecretModelFromJson(jsonString);

import 'dart:convert';

AboutUsOurSecretModel aboutUsOurSecretModelFromJson(String str) =>
    AboutUsOurSecretModel.fromJson(json.decode(str));

String aboutUsOurSecretModelToJson(AboutUsOurSecretModel data) =>
    json.encode(data.toJson());

class AboutUsOurSecretModel {
  final AboutUsOurSecretData? data;
  final Meta? meta;

  AboutUsOurSecretModel({
    this.data,
    this.meta,
  });

  factory AboutUsOurSecretModel.fromJson(Map<String, dynamic> json) =>
      AboutUsOurSecretModel(
        data: json["data"] == null
            ? null
            : AboutUsOurSecretData.fromJson(json["data"]),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "meta": meta?.toJson(),
      };
}

class AboutUsOurSecretData {
  final int? id;
  final String? documentId;
  final String? secHeader;
  final String? secDescription;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? publishedAt;

  AboutUsOurSecretData({
    this.id,
    this.documentId,
    this.secHeader,
    this.secDescription,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
  });

  factory AboutUsOurSecretData.fromJson(Map<String, dynamic> json) =>
      AboutUsOurSecretData(
        id: json["id"],
        documentId: json["documentId"],
        secHeader: json["sec_header"],
        secDescription: json["sec_description"],
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
        "sec_header": secHeader,
        "sec_description": secDescription,
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
