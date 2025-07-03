// To parse this JSON data, do
//
//     final aboutUsHeaderModel = aboutUsHeaderModelFromJson(jsonString);

import 'dart:convert';

AboutUsHeaderModel aboutUsHeaderModelFromJson(String str) =>
    AboutUsHeaderModel.fromJson(json.decode(str));

String aboutUsHeaderModelToJson(AboutUsHeaderModel data) =>
    json.encode(data.toJson());

class AboutUsHeaderModel {
  AboutUsHeaderData? data;
  Meta? meta;

  AboutUsHeaderModel({
    this.data,
    this.meta,
  });

  factory AboutUsHeaderModel.fromJson(Map<String, dynamic> json) =>
      AboutUsHeaderModel(
        data: json["data"] == null
            ? null
            : AboutUsHeaderData.fromJson(json["data"]),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "meta": meta?.toJson(),
      };
}

class AboutUsHeaderData {
  int? id;
  String? documentId;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? publishedAt;
  String? secHeader;
  SecBg? secBg;

  AboutUsHeaderData({
    this.id,
    this.documentId,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.secHeader,
    this.secBg,
  });

  factory AboutUsHeaderData.fromJson(Map<String, dynamic> json) =>
      AboutUsHeaderData(
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
        secHeader: json["sec_header"],
        secBg: json["sec_bg"] == null ? null : SecBg.fromJson(json["sec_bg"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "documentId": documentId,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "publishedAt": publishedAt?.toIso8601String(),
        "sec_header": secHeader,
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
