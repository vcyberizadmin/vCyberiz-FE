// To parse this JSON data, do
//
//     final methodologyModel = methodologyModelFromJson(jsonString);

import 'dart:convert';

MethodologyModel methodologyModelFromJson(String str) =>
    MethodologyModel.fromJson(json.decode(str));

String methodologyModelToJson(MethodologyModel data) =>
    json.encode(data.toJson());

class MethodologyModel {
  final MethodologyData? data;
  final Meta? meta;

  MethodologyModel({
    this.data,
    this.meta,
  });

  factory MethodologyModel.fromJson(Map<String, dynamic> json) =>
      MethodologyModel(
        data: json["data"] == null
            ? null
            : MethodologyData.fromJson(json["data"]),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "meta": meta?.toJson(),
      };
}

class MethodologyData {
  final int? id;
  final String? documentId;
  final String? bgImg;
  final String? imgOverlayText1;
  final String? imgOverlayText2;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? publishedAt;
  final String? globalUrl;
  final String? secondaryVideoUrl;
  final SectionHeader? sectionHeader;
  final List<SectionHeader>? methodologies;

  MethodologyData({
    this.id,
    this.documentId,
    this.bgImg,
    this.imgOverlayText1,
    this.imgOverlayText2,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.globalUrl,
    this.secondaryVideoUrl,
    this.sectionHeader,
    this.methodologies,
  });

  factory MethodologyData.fromJson(Map<String, dynamic> json) =>
      MethodologyData(
        id: json["id"],
        documentId: json["documentId"],
        bgImg: json["bg_img"],
        imgOverlayText1: json["img_overlay_text_1"],
        imgOverlayText2: json["img_overlay_text_2"],
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
        secondaryVideoUrl: json["secondary_video_url"],
        sectionHeader: json["section_header"] == null
            ? null
            : SectionHeader.fromJson(json["section_header"]),
        methodologies: json["methodologies"] == null
            ? []
            : List<SectionHeader>.from(
                json["methodologies"]!.map((x) => SectionHeader.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "documentId": documentId,
        "bg_img": bgImg,
        "img_overlay_text_1": imgOverlayText1,
        "img_overlay_text_2": imgOverlayText2,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "publishedAt": publishedAt?.toIso8601String(),
        "global_url": globalUrl,
        "secondary_video_url": secondaryVideoUrl,
        "section_header": sectionHeader?.toJson(),
        "methodologies": methodologies == null
            ? []
            : List<dynamic>.from(methodologies!.map((x) => x.toJson())),
      };
}

class SectionHeader {
  final int? id;
  final String? header;
  final String? content;
  final dynamic label;
  final dynamic key;
  final dynamic subtitle;

  SectionHeader({
    this.id,
    this.header,
    this.content,
    this.label,
    this.key,
    this.subtitle,
  });

  factory SectionHeader.fromJson(Map<String, dynamic> json) => SectionHeader(
        id: json["id"],
        header: json["header"],
        content: json["content"],
        label: json["label"],
        key: json["key"],
        subtitle: json["subtitle"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "header": header,
        "content": content,
        "label": label,
        "key": key,
        "subtitle": subtitle,
      };
}

class Meta {
  Meta();

  factory Meta.fromJson(Map<String, dynamic> json) => Meta();

  Map<String, dynamic> toJson() => {};
}
