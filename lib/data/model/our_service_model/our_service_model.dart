// To parse this JSON data, do
//
//     final ourServiceModel = ourServiceModelFromJson(jsonString);

import 'dart:convert';

OurServiceModel ourServiceModelFromJson(String str) =>
    OurServiceModel.fromJson(json.decode(str));

String ourServiceModelToJson(OurServiceModel data) =>
    json.encode(data.toJson());

class OurServiceModel {
  final OurServiceData? data;
  final Meta? meta;

  OurServiceModel({
    this.data,
    this.meta,
  });

  factory OurServiceModel.fromJson(Map<String, dynamic> json) =>
      OurServiceModel(
        data:
            json["data"] == null ? null : OurServiceData.fromJson(json["data"]),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "meta": meta?.toJson(),
      };
}

class OurServiceData {
  final int? id;
  final String? documentId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? publishedAt;
  final TitleSection? titleSection;
  final Achieves? achieves;
  final List<MainSection>? mainSection;

  OurServiceData({
    this.id,
    this.documentId,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.titleSection,
    this.achieves,
    this.mainSection,
  });

  factory OurServiceData.fromJson(Map<String, dynamic> json) => OurServiceData(
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
        titleSection: json["titleSection"] == null
            ? null
            : TitleSection.fromJson(json["titleSection"]),
        achieves: json["achieves"] == null
            ? null
            : Achieves.fromJson(json["achieves"]),
        mainSection: json["mainSection"] == null
            ? []
            : List<MainSection>.from(
                json["mainSection"]!.map((x) => MainSection.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "documentId": documentId,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "publishedAt": publishedAt?.toIso8601String(),
        "titleSection": titleSection?.toJson(),
        "achieves": achieves?.toJson(),
        "mainSection": mainSection == null
            ? []
            : List<dynamic>.from(mainSection!.map((x) => x.toJson())),
      };
}

class Achieves {
  final int? id;
  final String? secDescription;
  final List<Stat>? stats;

  Achieves({
    this.id,
    this.secDescription,
    this.stats,
  });

  factory Achieves.fromJson(Map<String, dynamic> json) => Achieves(
        id: json["id"],
        secDescription: json["sec_description"],
        stats: json["stats"] == null
            ? []
            : List<Stat>.from(json["stats"]!.map((x) => Stat.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "sec_description": secDescription,
        "stats": stats == null
            ? []
            : List<dynamic>.from(stats!.map((x) => x.toJson())),
      };
}

class Stat {
  final int? id;
  final double? value;
  final String? sign;
  final String? description;

  Stat({
    this.id,
    this.value,
    this.sign,
    this.description,
  });

  factory Stat.fromJson(Map<String, dynamic> json) => Stat(
        id: json["id"],
        value: json["value"]?.toDouble(),
        sign: json["sign"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "value": value,
        "sign": sign,
        "description": description,
      };
}

class MainSection {
  final int? id;
  final List<Service>? services;

  MainSection({
    this.id,
    this.services,
  });

  factory MainSection.fromJson(Map<String, dynamic> json) => MainSection(
        id: json["id"],
        services: json["services"] == null
            ? []
            : List<Service>.from(
                json["services"]!.map((x) => Service.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "services": services == null
            ? []
            : List<dynamic>.from(services!.map((x) => x.toJson())),
      };
}

class Service {
  final int? id;
  final String? header;
  final String? colorIdentifier;
  final String? secColorIdentifier;
  final String? secHeader;
  final String? secDescription;
  final SecLogo? secLogo;
  final Cta? cta;
  final List<SecLogo>? serviceBg;

  Service({
    this.id,
    this.header,
    this.colorIdentifier,
    this.secColorIdentifier,
    this.secHeader,
    this.secDescription,
    this.secLogo,
    this.cta,
    this.serviceBg,
  });

  factory Service.fromJson(Map<String, dynamic> json) => Service(
        id: json["id"],
        header: json["header"],
        colorIdentifier: json["color_identifier"],
        secColorIdentifier: json["sec_colorIdentifier"],
        secHeader: json["sec_header"],
        secDescription: json["sec_description"],
        secLogo: json["sec_logo"] == null
            ? null
            : SecLogo.fromJson(json["sec_logo"]),
        cta: json["cta"] == null ? null : Cta.fromJson(json["cta"]),
        serviceBg: json["service_bg"] == null
            ? []
            : List<SecLogo>.from(
                json["service_bg"]!.map((x) => SecLogo.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "header": header,
        "color_identifier": colorIdentifier,
        "sec_colorIdentifier": secColorIdentifier,
        "sec_header": secHeader,
        "sec_description": secDescription,
        "sec_logo": secLogo?.toJson(),
        "cta": cta?.toJson(),
        "service_bg": serviceBg == null
            ? []
            : List<dynamic>.from(serviceBg!.map((x) => x.toJson())),
      };
}

class Cta {
  final int? id;
  final String? label;
  final String? href;
  final bool? isExternal;
  final String? type;

  Cta({
    this.id,
    this.label,
    this.href,
    this.isExternal,
    this.type,
  });

  factory Cta.fromJson(Map<String, dynamic> json) => Cta(
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

class SecLogo {
  final int? id;
  final String? url;
  final String? name;
  final String? mime;
  final String? label;

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

class TitleSection {
  final int? id;
  final String? label;

  TitleSection({
    this.id,
    this.label,
  });

  factory TitleSection.fromJson(Map<String, dynamic> json) => TitleSection(
        id: json["id"],
        label: json["label"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "label": label,
      };
}

class Meta {
  Meta();

  factory Meta.fromJson(Map<String, dynamic> json) => Meta();

  Map<String, dynamic> toJson() => {};
}
