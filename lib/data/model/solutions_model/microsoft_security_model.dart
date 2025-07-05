// To parse this JSON data, do
//
//     final microsoftSecurityModel = microsoftSecurityModelFromJson(jsonString);

import 'dart:convert';

MicrosoftSecurityModel microsoftSecurityModelFromJson(String str) =>
    MicrosoftSecurityModel.fromJson(json.decode(str));

String microsoftSecurityModelToJson(MicrosoftSecurityModel data) =>
    json.encode(data.toJson());

class MicrosoftSecurityModel {
  final MicrosoftSecurityData? data;
  final Meta? meta;

  MicrosoftSecurityModel({
    this.data,
    this.meta,
  });

  factory MicrosoftSecurityModel.fromJson(Map<String, dynamic> json) =>
      MicrosoftSecurityModel(
        data: json["data"] == null
            ? null
            : MicrosoftSecurityData.fromJson(json["data"]),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "meta": meta?.toJson(),
      };
}

class MicrosoftSecurityData {
  final int? id;
  final String? documentId;
  final String? secHeader;
  final String? secLabel;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? publishedAt;
  final List<SecCard>? secCard;

  MicrosoftSecurityData({
    this.id,
    this.documentId,
    this.secHeader,
    this.secLabel,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.secCard,
  });

  factory MicrosoftSecurityData.fromJson(Map<String, dynamic> json) =>
      MicrosoftSecurityData(
        id: json["id"],
        documentId: json["documentId"],
        secHeader: json["sec_header"],
        secLabel: json["sec_label"],
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
            ? []
            : List<SecCard>.from(
                json["sec_card"]!.map((x) => SecCard.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "documentId": documentId,
        "sec_header": secHeader,
        "sec_label": secLabel,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "publishedAt": publishedAt?.toIso8601String(),
        "sec_card": secCard == null
            ? []
            : List<dynamic>.from(secCard!.map((x) => x.toJson())),
      };
}

class SecCard {
  final int? id;
  final String? secHeader;
  final String? secDescription;
  final SecCta? secCta;
  final SecImg? secImg;

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
        secImg:
            json["sec_img"] == null ? null : SecImg.fromJson(json["sec_img"]),
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
