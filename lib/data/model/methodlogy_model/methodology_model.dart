// ignore_for_file: public_member_api_docs, sort_constructors_first
// To parse this JSON data, do
//
//     final methodologyModel = methodologyModelFromJson(jsonString);

import 'dart:convert';

MethodologyModel methodologyModelFromJson(String str) =>
    MethodologyModel.fromJson(json.decode(str));

String methodologyModelToJson(MethodologyModel data) =>
    json.encode(data.toJson());

class MethodologyModel {
  MethodologyData? data;
  Meta? meta;

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
  int? id;
  String? documentId;
  String? bgImg;
  String? imgOverlayText1;
  String? imgOverlayText2;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? publishedAt;
  SectionHeader? sectionHeader;
  List<SectionHeader>? methodologies;

  MethodologyData({
    this.id,
    this.documentId,
    this.bgImg,
    this.imgOverlayText1,
    this.imgOverlayText2,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
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
        "section_header": sectionHeader?.toJson(),
        "methodologies": methodologies == null
            ? []
            : List<dynamic>.from(methodologies!.map((x) => x.toJson())),
      };

  @override
  String toString() {
    return 'MethodologyData(id: $id, documentId: $documentId, bgImg: $bgImg, imgOverlayText1: $imgOverlayText1, imgOverlayText2: $imgOverlayText2, createdAt: $createdAt, updatedAt: $updatedAt, publishedAt: $publishedAt, sectionHeader: $sectionHeader, methodologies: $methodologies)';
  }
}

class SectionHeader {
  int? id;
  String? header;
  String? content;
  dynamic label;

  SectionHeader({
    this.id,
    this.header,
    this.content,
    this.label,
  });

  factory SectionHeader.fromJson(Map<String, dynamic> json) {
    return SectionHeader(
      id: json["id"],
      header: json["header"],
      content: json["content"],
      label: json["label"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "header": header,
        "content": content,
        "label": label,
      };

  @override
  String toString() {
    return 'SectionHeader(id: $id, header: $header, content: $content, label: $label)';
  }
}

class Meta {
  Meta();

  factory Meta.fromJson(Map<String, dynamic> json) => Meta();

  Map<String, dynamic> toJson() => {};
}
