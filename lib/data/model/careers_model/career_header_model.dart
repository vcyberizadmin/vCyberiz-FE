// To parse this JSON data, do
//
//     final careersModel = careersModelFromJson(jsonString);

import 'dart:convert';

CareerHeaderModel careersModelFromJson(String str) =>
    CareerHeaderModel.fromJson(json.decode(str));

String careersModelToJson(CareerHeaderModel data) => json.encode(data.toJson());

class CareerHeaderModel {
  CareerHeaderData? data;
  Meta? meta;

  CareerHeaderModel({
    this.data,
    this.meta,
  });

  factory CareerHeaderModel.fromJson(Map<String, dynamic> json) =>
      CareerHeaderModel(
        data: json["data"] == null
            ? null
            : CareerHeaderData.fromJson(json["data"]),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "meta": meta?.toJson(),
      };
}

class CareerHeaderData {
  int? id;
  String? documentId;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? publishedAt;
  List<PageBanner>? pageBanner;

  CareerHeaderData({
    this.id,
    this.documentId,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.pageBanner,
  });

  factory CareerHeaderData.fromJson(Map<String, dynamic> json) =>
      CareerHeaderData(
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
        pageBanner: json["page_banner"] == null
            ? []
            : List<PageBanner>.from(
                json["page_banner"]!.map((x) => PageBanner.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "documentId": documentId,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "publishedAt": publishedAt?.toIso8601String(),
        "page_banner": pageBanner == null
            ? []
            : List<dynamic>.from(pageBanner!.map((x) => x.toJson())),
      };
}

class PageBanner {
  int? id;
  String? secHeader;
  List<SecBg>? secBg;

  PageBanner({
    this.id,
    this.secHeader,
    this.secBg,
  });

  factory PageBanner.fromJson(Map<String, dynamic> json) => PageBanner(
        id: json["id"],
        secHeader: json["sec_header"],
        secBg: json["sec_bg"] == null
            ? []
            : List<SecBg>.from(json["sec_bg"]!.map((x) => SecBg.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "sec_header": secHeader,
        "sec_bg": secBg == null
            ? []
            : List<dynamic>.from(secBg!.map((x) => x.toJson())),
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
