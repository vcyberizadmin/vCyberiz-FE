// To parse this JSON data, do
//
//     final secureStrongerFutureModel = secureStrongerFutureModelFromJson(jsonString);

import 'dart:convert';

SecureStrongerFutureModel secureStrongerFutureModelFromJson(String str) =>
    SecureStrongerFutureModel.fromJson(json.decode(str));

String secureStrongerFutureModelToJson(SecureStrongerFutureModel data) =>
    json.encode(data.toJson());

class SecureStrongerFutureModel {
  final SecureFuture? data;
  final Meta? meta;

  SecureStrongerFutureModel({
    this.data,
    this.meta,
  });

  factory SecureStrongerFutureModel.fromJson(Map<String, dynamic> json) =>
      SecureStrongerFutureModel(
        data: json["data"] == null ? null : SecureFuture.fromJson(json["data"]),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "meta": meta?.toJson(),
      };
}

class SecureFuture {
  final int? id;
  final String? documentId;
  final String? secHeader;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? publishedAt;
  final Sec? secBackground;
  final List<PartnerCard>? partnerCard;

  SecureFuture({
    this.id,
    this.documentId,
    this.secHeader,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.secBackground,
    this.partnerCard,
  });

  factory SecureFuture.fromJson(Map<String, dynamic> json) => SecureFuture(
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
        secBackground: json["sec_background"] == null
            ? null
            : Sec.fromJson(json["sec_background"]),
        partnerCard: json["partner_card"] == null
            ? []
            : List<PartnerCard>.from(
                json["partner_card"]!.map((x) => PartnerCard.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "documentId": documentId,
        "sec_header": secHeader,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "publishedAt": publishedAt?.toIso8601String(),
        "sec_background": secBackground?.toJson(),
        "partner_card": partnerCard == null
            ? []
            : List<dynamic>.from(partnerCard!.map((x) => x.toJson())),
      };
}

class PartnerCard {
  final int? id;
  final List<TabBody>? tabBody;
  final TabHead? tabHead;

  PartnerCard({
    this.id,
    this.tabBody,
    this.tabHead,
  });

  factory PartnerCard.fromJson(Map<String, dynamic> json) => PartnerCard(
        id: json["id"],
        tabBody: json["tab_body"] == null
            ? []
            : List<TabBody>.from(
                json["tab_body"]!.map((x) => TabBody.fromJson(x))),
        tabHead: json["tab_head"] == null
            ? null
            : TabHead.fromJson(json["tab_head"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "tab_body": tabBody == null
            ? []
            : List<dynamic>.from(tabBody!.map((x) => x.toJson())),
        "tab_head": tabHead?.toJson(),
      };
}

class TabBody {
  final int? id;
  final String? secDescription;
  final String? linkText;
  final Sec? secLogo;
  final SecCta? secCta;

  TabBody({
    this.id,
    this.secDescription,
    this.linkText,
    this.secLogo,
    this.secCta,
  });

  factory TabBody.fromJson(Map<String, dynamic> json) => TabBody(
        id: json["id"],
        secDescription: json["sec_description"],
        linkText: json["link_text"],
        secLogo:
            json["sec_logo"] == null ? null : Sec.fromJson(json["sec_logo"]),
        secCta:
            json["sec_cta"] == null ? null : SecCta.fromJson(json["sec_cta"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "sec_description": secDescription,
        "link_text": linkText,
        "sec_logo": secLogo?.toJson(),
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

class TabHead {
  final int? id;
  final String? tabHeading;
  final String? tabId;
  final dynamic colorIdentifier;

  TabHead({
    this.id,
    this.tabHeading,
    this.tabId,
    this.colorIdentifier,
  });

  factory TabHead.fromJson(Map<String, dynamic> json) => TabHead(
        id: json["id"],
        tabHeading: json["tab_heading"],
        tabId: json["tab_id"],
        colorIdentifier: json["color_identifier"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "tab_heading": tabHeading,
        "tab_id": tabId,
        "color_identifier": colorIdentifier,
      };
}

class Meta {
  Meta();

  factory Meta.fromJson(Map<String, dynamic> json) => Meta();

  Map<String, dynamic> toJson() => {};
}
