// To parse this JSON data, do
//
//     final ourSolutionsModel = ourSolutionsModelFromJson(jsonString);

import 'dart:convert';

OurSolutionsModel ourSolutionsModelFromJson(String str) =>
    OurSolutionsModel.fromJson(json.decode(str));

String ourSolutionsModelToJson(OurSolutionsModel data) =>
    json.encode(data.toJson());

class OurSolutionsModel {
  final OurSolutionsData? data;
  final Meta? meta;

  OurSolutionsModel({
    this.data,
    this.meta,
  });

  factory OurSolutionsModel.fromJson(Map<String, dynamic> json) =>
      OurSolutionsModel(
        data: json["data"] == null
            ? null
            : OurSolutionsData.fromJson(json["data"]),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "meta": meta?.toJson(),
      };
}

class OurSolutionsData {
  final int? id;
  final String? documentId;
  final String? sectionHeading;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? publishedAt;
  final List<SolutionAccordian>? solutionAccordian;

  OurSolutionsData({
    this.id,
    this.documentId,
    this.sectionHeading,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.solutionAccordian,
  });

  factory OurSolutionsData.fromJson(Map<String, dynamic> json) =>
      OurSolutionsData(
        id: json["id"],
        documentId: json["documentId"],
        sectionHeading: json["sectionHeading"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        publishedAt: json["publishedAt"] == null
            ? null
            : DateTime.parse(json["publishedAt"]),
        solutionAccordian: json["solutionAccordian"] == null
            ? []
            : List<SolutionAccordian>.from(json["solutionAccordian"]!
                .map((x) => SolutionAccordian.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "documentId": documentId,
        "sectionHeading": sectionHeading,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "publishedAt": publishedAt?.toIso8601String(),
        "solutionAccordian": solutionAccordian == null
            ? []
            : List<dynamic>.from(solutionAccordian!.map((x) => x.toJson())),
      };
}

class SolutionAccordian {
  final int? id;
  final String? heading;
  final String? description;
  final String? colorIdentifier;
  final List<SectionLogo>? imgUrl;
  final SectionLogo? sectionLogo;
  final Cta? cta;

  SolutionAccordian({
    this.id,
    this.heading,
    this.description,
    this.colorIdentifier,
    this.imgUrl,
    this.sectionLogo,
    this.cta,
  });

  factory SolutionAccordian.fromJson(Map<String, dynamic> json) =>
      SolutionAccordian(
        id: json["id"],
        heading: json["heading"],
        description: json["description"],
        colorIdentifier: json["colorIdentifier"],
        imgUrl: json["img_url"] == null
            ? []
            : List<SectionLogo>.from(
                json["img_url"]!.map((x) => SectionLogo.fromJson(x))),
        sectionLogo: json["sectionLogo"] == null
            ? null
            : SectionLogo.fromJson(json["sectionLogo"]),
        cta: json["cta"] == null ? null : Cta.fromJson(json["cta"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "heading": heading,
        "description": description,
        "colorIdentifier": colorIdentifier,
        "img_url": imgUrl == null
            ? []
            : List<dynamic>.from(imgUrl!.map((x) => x.toJson())),
        "sectionLogo": sectionLogo?.toJson(),
        "cta": cta?.toJson(),
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

class SectionLogo {
  final int? id;
  final String? url;
  final String? name;
  final String? mime;
  final String? label;

  SectionLogo({
    this.id,
    this.url,
    this.name,
    this.mime,
    this.label,
  });

  factory SectionLogo.fromJson(Map<String, dynamic> json) => SectionLogo(
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
