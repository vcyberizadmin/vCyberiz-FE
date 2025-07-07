// To parse this JSON data, do
//
//     final aboutUsOurVisionModel = aboutUsOurVisionModelFromJson(jsonString);

import 'dart:convert';

AboutUsOurVisionModel aboutUsOurVisionModelFromJson(String str) =>
    AboutUsOurVisionModel.fromJson(json.decode(str));

String aboutUsOurVisionModelToJson(AboutUsOurVisionModel data) =>
    json.encode(data.toJson());

class AboutUsOurVisionModel {
  final AboutUsOurVisionData? data;
  final Meta? meta;

  AboutUsOurVisionModel({
    this.data,
    this.meta,
  });

  factory AboutUsOurVisionModel.fromJson(Map<String, dynamic> json) =>
      AboutUsOurVisionModel(
        data: json["data"] == null
            ? null
            : AboutUsOurVisionData.fromJson(json["data"]),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "meta": meta?.toJson(),
      };
}

class AboutUsOurVisionData {
  final int? id;
  final String? documentId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? publishedAt;
  final String? globalUrl;
  final String? secondaryVideoUrl1;
  final String? secondaryVideoUrl2;
  final SecBg? secBg;
  final List<SecWriting>? secWritings;
  final KnowMoreAboutOurService? knowMoreAboutOurService;

  AboutUsOurVisionData({
    this.id,
    this.documentId,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.globalUrl,
    this.secondaryVideoUrl1,
    this.secondaryVideoUrl2,
    this.secBg,
    this.secWritings,
    this.knowMoreAboutOurService,
  });

  factory AboutUsOurVisionData.fromJson(Map<String, dynamic> json) =>
      AboutUsOurVisionData(
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
        secondaryVideoUrl1: json["secondary_video_url_1"],
        secondaryVideoUrl2: json["secondary_video_url_2"],
        secBg: json["sec_bg"] == null ? null : SecBg.fromJson(json["sec_bg"]),
        secWritings: json["sec_writings"] == null
            ? []
            : List<SecWriting>.from(
                json["sec_writings"]!.map((x) => SecWriting.fromJson(x))),
        knowMoreAboutOurService: json["know_more_about_our_service"] == null
            ? null
            : KnowMoreAboutOurService.fromJson(
                json["know_more_about_our_service"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "documentId": documentId,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "publishedAt": publishedAt?.toIso8601String(),
        "global_url": globalUrl,
        "secondary_video_url_1": secondaryVideoUrl1,
        "secondary_video_url_2": secondaryVideoUrl2,
        "sec_bg": secBg?.toJson(),
        "sec_writings": secWritings == null
            ? []
            : List<dynamic>.from(secWritings!.map((x) => x.toJson())),
        "know_more_about_our_service": knowMoreAboutOurService?.toJson(),
      };
}

class KnowMoreAboutOurService {
  final int? id;
  final String? ctaTitle;
  final dynamic secDescription;
  final CtaLink? ctaLink;
  final SecBg? ctaBgImg;

  KnowMoreAboutOurService({
    this.id,
    this.ctaTitle,
    this.secDescription,
    this.ctaLink,
    this.ctaBgImg,
  });

  factory KnowMoreAboutOurService.fromJson(Map<String, dynamic> json) =>
      KnowMoreAboutOurService(
        id: json["id"],
        ctaTitle: json["cta_title"],
        secDescription: json["sec_description"],
        ctaLink: json["cta_link"] == null
            ? null
            : CtaLink.fromJson(json["cta_link"]),
        ctaBgImg: json["cta_bg_img"] == null
            ? null
            : SecBg.fromJson(json["cta_bg_img"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "cta_title": ctaTitle,
        "sec_description": secDescription,
        "cta_link": ctaLink?.toJson(),
        "cta_bg_img": ctaBgImg?.toJson(),
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

class CtaLink {
  final int? id;
  final String? label;
  final String? href;
  final bool? isExternal;
  final String? type;

  CtaLink({
    this.id,
    this.label,
    this.href,
    this.isExternal,
    this.type,
  });

  factory CtaLink.fromJson(Map<String, dynamic> json) => CtaLink(
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

class SecWriting {
  final int? id;
  final String? secHeader;
  final String? secDescription;

  SecWriting({
    this.id,
    this.secHeader,
    this.secDescription,
  });

  factory SecWriting.fromJson(Map<String, dynamic> json) => SecWriting(
        id: json["id"],
        secHeader: json["sec_header"],
        secDescription: json["sec_description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "sec_header": secHeader,
        "sec_description": secDescription,
      };
}

class Meta {
  Meta();

  factory Meta.fromJson(Map<String, dynamic> json) => Meta();

  Map<String, dynamic> toJson() => {};
}
