// To parse this JSON data, do
//
//     final serviceOfferingsModel = serviceOfferingsModelFromJson(jsonString);

import 'dart:convert';

ServiceOfferingsModel serviceOfferingsModelFromJson(String str) =>
    ServiceOfferingsModel.fromJson(json.decode(str));

String serviceOfferingsModelToJson(ServiceOfferingsModel data) =>
    json.encode(data.toJson());

class ServiceOfferingsModel {
  final ServiceOfferingData? data;
  final Meta? meta;

  ServiceOfferingsModel({
    this.data,
    this.meta,
  });

  factory ServiceOfferingsModel.fromJson(Map<String, dynamic> json) =>
      ServiceOfferingsModel(
        data: json["data"] == null
            ? null
            : ServiceOfferingData.fromJson(json["data"]),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "meta": meta?.toJson(),
      };
}

class ServiceOfferingData {
  final int? id;
  final String? documentId;
  final String? secHeader;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? publishedAt;
  final String? globalUrl;
  final List<SecCard>? secCard;

  ServiceOfferingData({
    this.id,
    this.documentId,
    this.secHeader,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.globalUrl,
    this.secCard,
  });

  factory ServiceOfferingData.fromJson(Map<String, dynamic> json) =>
      ServiceOfferingData(
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
        globalUrl: json["global_url"],
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
        "global_url": globalUrl,
        "sec_card": secCard == null
            ? []
            : List<dynamic>.from(secCard!.map((x) => x.toJson())),
      };
}

class SecCard {
  final int? id;
  final String? secHeader;
  final String? colorIdentifier;
  final String? colorIdentifier1;
  final List<SecSubCard>? secSubCard;

  SecCard({
    this.id,
    this.secHeader,
    this.colorIdentifier,
    this.colorIdentifier1,
    this.secSubCard,
  });

  factory SecCard.fromJson(Map<String, dynamic> json) => SecCard(
        id: json["id"],
        secHeader: json["sec_header"],
        colorIdentifier: json["color_identifier"],
        colorIdentifier1: json["color_identifier_1"],
        secSubCard: json["sec_sub_card"] == null
            ? []
            : List<SecSubCard>.from(
                json["sec_sub_card"]!.map((x) => SecSubCard.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "sec_header": secHeader,
        "color_identifier": colorIdentifier,
        "color_identifier_1": colorIdentifier1,
        "sec_sub_card": secSubCard == null
            ? []
            : List<dynamic>.from(secSubCard!.map((x) => x.toJson())),
      };
}

class SecSubCard {
  final int? id;
  final String? label;
  final String? secDescription;
  final dynamic intValue;
  final SecLogo? secLogo;

  SecSubCard({
    this.id,
    this.label,
    this.secDescription,
    this.intValue,
    this.secLogo,
  });

  factory SecSubCard.fromJson(Map<String, dynamic> json) => SecSubCard(
        id: json["id"],
        label: json["label"],
        secDescription: json["sec_description"],
        intValue: json["int_value"],
        secLogo: json["sec_logo"] == null
            ? null
            : SecLogo.fromJson(json["sec_logo"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "label": label,
        "sec_description": secDescription,
        "int_value": intValue,
        "sec_logo": secLogo?.toJson(),
      };
}

class SecLogo {
  final int? id;
  final String? url;
  final Label? name;
  final Mime? mime;
  final Label? label;

  SecLogo({
    this.id,
    this.url,
    this.name,
    this.mime,
    this.label,
  });

  factory SecLogo.fromJson(Map<String, dynamic> json) => SecLogo(
        id: json["id"],
        url: json["url"],
        name: labelValues.map[json["name"]]!,
        mime: mimeValues.map[json["mime"]]!,
        label: labelValues.map[json["label"]]!,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
        "name": labelValues.reverse[name],
        "mime": mimeValues.reverse[mime],
        "label": labelValues.reverse[label],
      };
}

enum Label { LOGO }

final labelValues = EnumValues({"logo": Label.LOGO});

enum Mime { IMG_PNG }

final mimeValues = EnumValues({"img/png": Mime.IMG_PNG});

class Meta {
  Meta();

  factory Meta.fromJson(Map<String, dynamic> json) => Meta();

  Map<String, dynamic> toJson() => {};
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
