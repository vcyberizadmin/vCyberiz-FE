// To parse this JSON data, do
//
//     final sectionModel = sectionModelFromJson(jsonString);

import 'dart:convert';

SectionModel sectionModelFromJson(String str) =>
    SectionModel.fromJson(json.decode(str));

String sectionModelToJson(SectionModel data) => json.encode(data.toJson());

class SectionModel {
  SectionsData? data;
  Meta? meta;

  SectionModel({
    this.data,
    this.meta,
  });

  factory SectionModel.fromJson(Map<String, dynamic> json) => SectionModel(
        data: json["data"] == null ? null : SectionsData.fromJson(json["data"]),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "meta": meta?.toJson(),
      };
}

class SectionsData {
  int? id;
  String? documentId;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? publishedAt;
  List<Section>? sections;

  SectionsData({
    this.id,
    this.documentId,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.sections,
  });

  factory SectionsData.fromJson(Map<String, dynamic> json) => SectionsData(
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
        sections: json["sections"] == null
            ? []
            : List<Section>.from(
                json["sections"]!.map((x) => Section.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "documentId": documentId,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "publishedAt": publishedAt?.toIso8601String(),
        "sections": sections == null
            ? []
            : List<dynamic>.from(sections!.map((x) => x.toJson())),
      };
}

class Section {
  int? id;
  String? slug;
  String? title;

  Section({
    this.id,
    this.slug,
    this.title,
  });

  factory Section.fromJson(Map<String, dynamic> json) => Section(
        id: json["id"],
        slug: json["slug"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "slug": slug,
        "title": title,
      };
}

class Meta {
  Meta();

  factory Meta.fromJson(Map<String, dynamic> json) => Meta();

  Map<String, dynamic> toJson() => {};
}
