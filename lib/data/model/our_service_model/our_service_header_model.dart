// To parse this JSON data, do
//
//     final serviceHeaderModel = serviceHeaderModelFromJson(jsonString);

import 'dart:convert';

ServiceHeaderModel serviceHeaderModelFromJson(String str) =>
    ServiceHeaderModel.fromJson(json.decode(str));

String serviceHeaderModelToJson(ServiceHeaderModel data) =>
    json.encode(data.toJson());

class ServiceHeaderModel {
  final ServiceHeaderData? data;
  final Meta? meta;

  ServiceHeaderModel({
    this.data,
    this.meta,
  });

  factory ServiceHeaderModel.fromJson(Map<String, dynamic> json) =>
      ServiceHeaderModel(
        data: json["data"] == null
            ? null
            : ServiceHeaderData.fromJson(json["data"]),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "meta": meta?.toJson(),
      };
}

class ServiceHeaderData {
  final int? id;
  final String? documentId;
  final String? secHeader;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? publishedAt;
  final SecBg? secBg;

  ServiceHeaderData({
    this.id,
    this.documentId,
    this.secHeader,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.secBg,
  });

  factory ServiceHeaderData.fromJson(Map<String, dynamic> json) =>
      ServiceHeaderData(
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
        secBg: json["sec_bg"] == null ? null : SecBg.fromJson(json["sec_bg"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "documentId": documentId,
        "sec_header": secHeader,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "publishedAt": publishedAt?.toIso8601String(),
        "sec_bg": secBg?.toJson(),
      };
}

class SecBg {
  final int? id;
  final String? url;
  final String? name;
  final String? mime;
  final String? label;

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
