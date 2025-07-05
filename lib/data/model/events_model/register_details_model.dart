// To parse this JSON data, do
//
//     final registerDetailsModel = registerDetailsModelFromJson(jsonString);

import 'dart:convert';

RegisterDetailsModel registerDetailsModelFromJson(String str) =>
    RegisterDetailsModel.fromJson(json.decode(str));

String registerDetailsModelToJson(RegisterDetailsModel data) =>
    json.encode(data.toJson());

class RegisterDetailsModel {
  final RegisterDetailsData? data;
  final Meta? meta;

  RegisterDetailsModel({
    this.data,
    this.meta,
  });

  factory RegisterDetailsModel.fromJson(Map<String, dynamic> json) =>
      RegisterDetailsModel(
        data: json["data"] == null
            ? null
            : RegisterDetailsData.fromJson(json["data"]),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "meta": meta?.toJson(),
      };
}

class RegisterDetailsData {
  final int? id;
  final String? documentId;
  final String? secHeader;
  final String? secDescription;
  final String? formId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? publishedAt;
  final SecCta? secCta;

  RegisterDetailsData({
    this.id,
    this.documentId,
    this.secHeader,
    this.secDescription,
    this.formId,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.secCta,
  });

  factory RegisterDetailsData.fromJson(Map<String, dynamic> json) =>
      RegisterDetailsData(
        id: json["id"],
        documentId: json["documentId"],
        secHeader: json["sec_header"],
        secDescription: json["sec_description"],
        formId: json["form_id"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        publishedAt: json["publishedAt"] == null
            ? null
            : DateTime.parse(json["publishedAt"]),
        secCta:
            json["sec_cta"] == null ? null : SecCta.fromJson(json["sec_cta"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "documentId": documentId,
        "sec_header": secHeader,
        "sec_description": secDescription,
        "form_id": formId,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "publishedAt": publishedAt?.toIso8601String(),
        "sec_cta": secCta?.toJson(),
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

class Meta {
  Meta();

  factory Meta.fromJson(Map<String, dynamic> json) => Meta();

  Map<String, dynamic> toJson() => {};
}
