// To parse this JSON data, do
//
//     final blogMarketingModel = blogMarketingModelFromJson(jsonString);

import 'dart:convert';

BlogMarketingModel blogMarketingModelFromJson(String str) =>
    BlogMarketingModel.fromJson(json.decode(str));

String blogMarketingModelToJson(BlogMarketingModel data) =>
    json.encode(data.toJson());

class BlogMarketingModel {
  final BlogMarketingData? data;
  final Meta? meta;

  BlogMarketingModel({
    this.data,
    this.meta,
  });

  factory BlogMarketingModel.fromJson(Map<String, dynamic> json) =>
      BlogMarketingModel(
        data: json["data"] == null
            ? null
            : BlogMarketingData.fromJson(json["data"]),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "meta": meta?.toJson(),
      };
}

class BlogMarketingData {
  final int? id;
  final String? documentId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? publishedAt;
  final SecCard? secCard;
  final SecPopupCard? secPopupCard;

  BlogMarketingData({
    this.id,
    this.documentId,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.secCard,
    this.secPopupCard,
  });

  factory BlogMarketingData.fromJson(Map<String, dynamic> json) =>
      BlogMarketingData(
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
        secCard: json["sec_card"] == null
            ? null
            : SecCard.fromJson(json["sec_card"]),
        secPopupCard: json["sec_popup_card"] == null
            ? null
            : SecPopupCard.fromJson(json["sec_popup_card"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "documentId": documentId,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "publishedAt": publishedAt?.toIso8601String(),
        "sec_card": secCard?.toJson(),
        "sec_popup_card": secPopupCard?.toJson(),
      };
}

class SecCard {
  final int? id;
  final String? secHeader;
  final String? secDescription;
  final SecCta? secCta;
  final Sec? secImg;

  SecCard({
    this.id,
    this.secHeader,
    this.secDescription,
    this.secCta,
    this.secImg,
  });

  factory SecCard.fromJson(Map<String, dynamic> json) => SecCard(
        id: json["id"],
        secHeader: json["sec_header"],
        secDescription: json["sec_description"],
        secCta:
            json["sec_cta"] == null ? null : SecCta.fromJson(json["sec_cta"]),
        secImg: json["sec_img"] == null ? null : Sec.fromJson(json["sec_img"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "sec_header": secHeader,
        "sec_description": secDescription,
        "sec_cta": secCta?.toJson(),
        "sec_img": secImg?.toJson(),
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

class Sec {
  final int? id;
  final String? url;
  final String? name;
  final String? mime;
  final String? label;

  Sec({
    this.id,
    this.url,
    this.name,
    this.mime,
    this.label,
  });

  factory Sec.fromJson(Map<String, dynamic> json) => Sec(
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

class SecPopupCard {
  final int? id;
  final String? secHeader;
  final String? secSubHeader;
  final String? secLink;
  final List<Sec>? secLogo;
  final SecCta? secCta;

  SecPopupCard({
    this.id,
    this.secHeader,
    this.secSubHeader,
    this.secLink,
    this.secLogo,
    this.secCta,
  });

  factory SecPopupCard.fromJson(Map<String, dynamic> json) => SecPopupCard(
        id: json["id"],
        secHeader: json["sec_header"],
        secSubHeader: json["sec_sub_header"],
        secLink: json["sec_link"],
        secLogo: json["sec_logo"] == null
            ? []
            : List<Sec>.from(json["sec_logo"]!.map((x) => Sec.fromJson(x))),
        secCta:
            json["sec_cta"] == null ? null : SecCta.fromJson(json["sec_cta"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "sec_header": secHeader,
        "sec_sub_header": secSubHeader,
        "sec_link": secLink,
        "sec_logo": secLogo == null
            ? []
            : List<dynamic>.from(secLogo!.map((x) => x.toJson())),
        "sec_cta": secCta?.toJson(),
      };
}

class Meta {
  Meta();

  factory Meta.fromJson(Map<String, dynamic> json) => Meta();

  Map<String, dynamic> toJson() => {};
}
