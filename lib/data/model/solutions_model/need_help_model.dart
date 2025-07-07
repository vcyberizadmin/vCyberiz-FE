// To parse this JSON data, do
//
//     final needHelpModel = needHelpModelFromJson(jsonString);

import 'dart:convert';

NeedHelpModel needHelpModelFromJson(String str) =>
    NeedHelpModel.fromJson(json.decode(str));

String needHelpModelToJson(NeedHelpModel data) => json.encode(data.toJson());

class NeedHelpModel {
  final NeedHelpData? data;
  final Meta? meta;

  NeedHelpModel({
    this.data,
    this.meta,
  });

  factory NeedHelpModel.fromJson(Map<String, dynamic> json) => NeedHelpModel(
        data: json["data"] == null ? null : NeedHelpData.fromJson(json["data"]),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "meta": meta?.toJson(),
      };
}

class NeedHelpData {
  final int? id;
  final String? documentId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? publishedAt;
  final String? globalUrl;
  final String? secondaryVideoUrl;
  final Section? section;

  NeedHelpData({
    this.id,
    this.documentId,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.globalUrl,
    this.secondaryVideoUrl,
    this.section,
  });

  factory NeedHelpData.fromJson(Map<String, dynamic> json) => NeedHelpData(
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
        globalUrl: json["global_url"],
        secondaryVideoUrl: json["secondary_video_url"],
        section:
            json["section"] == null ? null : Section.fromJson(json["section"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "documentId": documentId,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "publishedAt": publishedAt?.toIso8601String(),
        "global_url": globalUrl,
        "secondary_video_url": secondaryVideoUrl,
        "section": section?.toJson(),
      };
}

class Section {
  final int? id;
  final dynamic secLabel;
  final String? secHeader;
  final dynamic secDescription;
  final String? secondaryVideoUrl;
  final SecImg? secImg;
  final SecCta? secCta;

  Section({
    this.id,
    this.secLabel,
    this.secHeader,
    this.secDescription,
    this.secondaryVideoUrl,
    this.secImg,
    this.secCta,
  });

  factory Section.fromJson(Map<String, dynamic> json) => Section(
        id: json["id"],
        secLabel: json["sec_label"],
        secHeader: json["sec_header"],
        secDescription: json["sec_description"],
        secondaryVideoUrl: json["secondary_video_url"],
        secImg:
            json["sec_img"] == null ? null : SecImg.fromJson(json["sec_img"]),
        secCta:
            json["sec_cta"] == null ? null : SecCta.fromJson(json["sec_cta"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "sec_label": secLabel,
        "sec_header": secHeader,
        "sec_description": secDescription,
        "secondary_video_url": secondaryVideoUrl,
        "sec_img": secImg?.toJson(),
        "sec_cta": secCta?.toJson(),
      };
}

class SecCta {
  final int? id;
  final String? label;
  final String? href;
  final bool? isExternal;
  final String? type;

  SecCta({
    this.id,
    this.label,
    this.href,
    this.isExternal,
    this.type,
  });

  factory SecCta.fromJson(Map<String, dynamic> json) => SecCta(
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

class SecImg {
  final int? id;
  final String? url;
  final String? name;
  final String? mime;
  final String? label;

  SecImg({
    this.id,
    this.url,
    this.name,
    this.mime,
    this.label,
  });

  factory SecImg.fromJson(Map<String, dynamic> json) => SecImg(
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
