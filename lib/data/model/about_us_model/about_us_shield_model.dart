// To parse this JSON data, do
//
//     final aboutUsOurShieldModel = aboutUsOurShieldModelFromJson(jsonString);

import 'dart:convert';

AboutUsOurShieldModel aboutUsOurShieldModelFromJson(String str) =>
    AboutUsOurShieldModel.fromJson(json.decode(str));

String aboutUsOurShieldModelToJson(AboutUsOurShieldModel data) =>
    json.encode(data.toJson());

class AboutUsOurShieldModel {
  AboutUsOurShieldData? data;
  Meta? meta;

  AboutUsOurShieldModel({
    this.data,
    this.meta,
  });

  factory AboutUsOurShieldModel.fromJson(Map<String, dynamic> json) =>
      AboutUsOurShieldModel(
        data: json["data"] == null
            ? null
            : AboutUsOurShieldData.fromJson(json["data"]),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "meta": meta?.toJson(),
      };
}

class AboutUsOurShieldData {
  int? id;
  String? documentId;
  String? secHeader;
  String? secDescription;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? publishedAt;
  SecBg? secBg;

  AboutUsOurShieldData({
    this.id,
    this.documentId,
    this.secHeader,
    this.secDescription,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.secBg,
  });

  factory AboutUsOurShieldData.fromJson(Map<String, dynamic> json) =>
      AboutUsOurShieldData(
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
        secBg: json["sec_bg"] == null ? null : SecBg.fromJson(json["sec_bg"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "documentId": documentId,
        "sec_header": secHeader,
        "sec_description": secDescription,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "publishedAt": publishedAt?.toIso8601String(),
        "sec_bg": secBg?.toJson(),
      };
}

class SecBg {
  int? id;
  String? url;
  String? name;
  String? mime;
  String? label;

  SecBg({
    this.id,
    this.url,
    this.name,
    this.mime,
    this.label,
  });

  factory SecBg.fromJson(Map<String, dynamic> json) => SecBg(
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
