// ignore_for_file: public_member_api_docs, sort_constructors_first
// To parse this JSON data, do
//
//     final ebookModel = ebookModelFromJson(jsonString);

import 'dart:convert';

EbookModel ebookModelFromJson(String str) =>
    EbookModel.fromJson(json.decode(str));

String ebookModelToJson(EbookModel data) => json.encode(data.toJson());

class EbookModel {
  final EbookData? data;
  final Meta? meta;

  EbookModel({
    this.data,
    this.meta,
  });

  factory EbookModel.fromJson(Map<String, dynamic> json) => EbookModel(
        data: json["data"] == null ? null : EbookData.fromJson(json["data"]),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "meta": meta?.toJson(),
      };
}

class EbookData {
  final int? id;
  final String? documentId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? publishedAt;
  final List<EBookCard>? eBookCard;

  EbookData({
    this.id,
    this.documentId,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.eBookCard,
  });

  factory EbookData.fromJson(Map<String, dynamic> json) => EbookData(
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
        eBookCard: json["e_book_card"] == null
            ? []
            : List<EBookCard>.from(
                json["e_book_card"]!.map((x) => EBookCard.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "documentId": documentId,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "publishedAt": publishedAt?.toIso8601String(),
        "e_book_card": eBookCard == null
            ? []
            : List<dynamic>.from(eBookCard!.map((x) => x.toJson())),
      };
}

class EBookCard {
  final int? id;
  final String? secHeader;
  final SecLink? secLink;
  final SecImg? secImg;

  EBookCard({
    this.id,
    this.secHeader,
    this.secLink,
    this.secImg,
  });

  factory EBookCard.fromJson(Map<String, dynamic> json) => EBookCard(
        id: json["id"],
        secHeader: json["sec_header"],
        secLink: json["sec_link"] == null
            ? null
            : SecLink.fromJson(json["sec_link"]),
        secImg:
            json["sec_img"] == null ? null : SecImg.fromJson(json["sec_img"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "sec_header": secHeader,
        "sec_link": secLink?.toJson(),
        "sec_img": secImg?.toJson(),
      };

  @override
  String toString() {
    return 'EBookCard(id: $id, secHeader: $secHeader, secLink: $secLink, secImg: $secImg)';
  }
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

class SecLink {
  final int? id;
  final String? label;
  final String? href;
  final bool? isExternal;
  final String? type;

  SecLink({
    this.id,
    this.label,
    this.href,
    this.isExternal,
    this.type,
  });

  factory SecLink.fromJson(Map<String, dynamic> json) => SecLink(
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

  @override
  String toString() {
    return 'SecLink(id: $id, label: $label, href: $href, isExternal: $isExternal, type: $type)';
  }
}

class Meta {
  Meta();

  factory Meta.fromJson(Map<String, dynamic> json) => Meta();

  Map<String, dynamic> toJson() => {};
}
