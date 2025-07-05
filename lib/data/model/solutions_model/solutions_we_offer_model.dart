// To parse this JSON data, do
//
//     final solutionsWeOfferModel = solutionsWeOfferModelFromJson(jsonString);

import 'dart:convert';

SolutionsWeOfferModel solutionsWeOfferModelFromJson(String str) =>
    SolutionsWeOfferModel.fromJson(json.decode(str));

String solutionsWeOfferModelToJson(SolutionsWeOfferModel data) =>
    json.encode(data.toJson());

class SolutionsWeOfferModel {
  final SolutionsWeOfferData? data;
  final Meta? meta;

  SolutionsWeOfferModel({
    this.data,
    this.meta,
  });

  factory SolutionsWeOfferModel.fromJson(Map<String, dynamic> json) =>
      SolutionsWeOfferModel(
        data: json["data"] == null
            ? null
            : SolutionsWeOfferData.fromJson(json["data"]),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "meta": meta?.toJson(),
      };
}

class SolutionsWeOfferData {
  final int? id;
  final String? documentId;
  final String? secHeader;
  final String? description;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? publishedAt;
  final String? subHeader;
  final List<SecButton>? secButton;
  final List<Solution>? solutions;

  SolutionsWeOfferData({
    this.id,
    this.documentId,
    this.secHeader,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.subHeader,
    this.secButton,
    this.solutions,
  });

  factory SolutionsWeOfferData.fromJson(Map<String, dynamic> json) =>
      SolutionsWeOfferData(
        id: json["id"],
        documentId: json["documentId"],
        secHeader: json["sec_header"],
        description: json["description"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        publishedAt: json["publishedAt"] == null
            ? null
            : DateTime.parse(json["publishedAt"]),
        subHeader: json["sub_header"],
        secButton: json["sec_button"] == null
            ? []
            : List<SecButton>.from(
                json["sec_button"]!.map((x) => SecButton.fromJson(x))),
        solutions: json["solutions"] == null
            ? []
            : List<Solution>.from(
                json["solutions"]!.map((x) => Solution.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "documentId": documentId,
        "sec_header": secHeader,
        "description": description,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "publishedAt": publishedAt?.toIso8601String(),
        "sub_header": subHeader,
        "sec_button": secButton == null
            ? []
            : List<dynamic>.from(secButton!.map((x) => x.toJson())),
        "solutions": solutions == null
            ? []
            : List<dynamic>.from(solutions!.map((x) => x.toJson())),
      };
}

class SecButton {
  final int? id;
  final String? label;
  final dynamic href;
  final bool? isExternal;
  final String? type;

  SecButton({
    this.id,
    this.label,
    this.href,
    this.isExternal,
    this.type,
  });

  factory SecButton.fromJson(Map<String, dynamic> json) => SecButton(
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

class Solution {
  final int? id;
  final Details? details;
  final Sec? secBg;
  final Sec? secLogo;

  Solution({
    this.id,
    this.details,
    this.secBg,
    this.secLogo,
  });

  factory Solution.fromJson(Map<String, dynamic> json) => Solution(
        id: json["id"],
        details:
            json["details"] == null ? null : Details.fromJson(json["details"]),
        secBg: json["sec_bg"] == null ? null : Sec.fromJson(json["sec_bg"]),
        secLogo:
            json["sec_logo"] == null ? null : Sec.fromJson(json["sec_logo"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "details": details?.toJson(),
        "sec_bg": secBg?.toJson(),
        "sec_logo": secLogo?.toJson(),
      };
}

class Details {
  final int? id;
  final String? header;
  final String? content;
  final dynamic label;
  final dynamic key;
  final dynamic subtitle;

  Details({
    this.id,
    this.header,
    this.content,
    this.label,
    this.key,
    this.subtitle,
  });

  factory Details.fromJson(Map<String, dynamic> json) => Details(
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

class Meta {
  Meta();

  factory Meta.fromJson(Map<String, dynamic> json) => Meta();

  Map<String, dynamic> toJson() => {};
}
