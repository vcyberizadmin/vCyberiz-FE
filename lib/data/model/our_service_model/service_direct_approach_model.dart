// To parse this JSON data, do
//
//     final serviceDirectApproachModel = serviceDirectApproachModelFromJson(jsonString);

import 'dart:convert';

ServiceDirectApproachModel serviceDirectApproachModelFromJson(String str) =>
    ServiceDirectApproachModel.fromJson(json.decode(str));

String serviceDirectApproachModelToJson(ServiceDirectApproachModel data) =>
    json.encode(data.toJson());

class ServiceDirectApproachModel {
  final ServicedirectApproachData? data;
  final Meta? meta;

  ServiceDirectApproachModel({
    this.data,
    this.meta,
  });

  factory ServiceDirectApproachModel.fromJson(Map<String, dynamic> json) =>
      ServiceDirectApproachModel(
        data: json["data"] == null
            ? null
            : ServicedirectApproachData.fromJson(json["data"]),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "meta": meta?.toJson(),
      };
}

class ServicedirectApproachData {
  final int? id;
  final String? documentId;
  final String? secHeader;
  final String? secDescription;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? publishedAt;
  final List<SecCard>? secCard;
  final Img? bgImg;

  ServicedirectApproachData({
    this.id,
    this.documentId,
    this.secHeader,
    this.secDescription,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.secCard,
    this.bgImg,
  });

  factory ServicedirectApproachData.fromJson(Map<String, dynamic> json) =>
      ServicedirectApproachData(
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
        secCard: json["sec_card"] == null
            ? []
            : List<SecCard>.from(
                json["sec_card"]!.map((x) => SecCard.fromJson(x))),
        bgImg: json["bg_img"] == null ? null : Img.fromJson(json["bg_img"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "documentId": documentId,
        "sec_header": secHeader,
        "sec_description": secDescription,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "publishedAt": publishedAt?.toIso8601String(),
        "sec_card": secCard == null
            ? []
            : List<dynamic>.from(secCard!.map((x) => x.toJson())),
        "bg_img": bgImg?.toJson(),
      };
}

class Img {
  final int? id;
  final String? url;
  final String? name;
  final String? mime;
  final String? label;

  Img({
    this.id,
    this.url,
    this.name,
    this.mime,
    this.label,
  });

  factory Img.fromJson(Map<String, dynamic> json) => Img(
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

class SecCard {
  final int? id;
  final String? secHeader;
  final String? description;
  final Img? logoImg;

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
        logoImg:
            json["logo_img"] == null ? null : Img.fromJson(json["logo_img"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "sec_header": secHeader,
        "description": description,
        "logo_img": logoImg?.toJson(),
      };
}

class Meta {
  Meta();

  factory Meta.fromJson(Map<String, dynamic> json) => Meta();

  Map<String, dynamic> toJson() => {};
}
