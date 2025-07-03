// To parse this JSON data, do
//
//     final whatWeHaveDoneModel = whatWeHaveDoneModelFromJson(jsonString);

import 'dart:convert';

WhatWeHaveDoneModel whatWeHaveDoneModelFromJson(String str) =>
    WhatWeHaveDoneModel.fromJson(json.decode(str));

String whatWeHaveDoneModelToJson(WhatWeHaveDoneModel data) =>
    json.encode(data.toJson());

class WhatWeHaveDoneModel {
  WhatWeHaveDoneData? data;
  Meta? meta;

  WhatWeHaveDoneModel({
    this.data,
    this.meta,
  });

  factory WhatWeHaveDoneModel.fromJson(Map<String, dynamic> json) =>
      WhatWeHaveDoneModel(
        data: json["data"] == null
            ? null
            : WhatWeHaveDoneData.fromJson(json["data"]),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "meta": meta?.toJson(),
      };
}

class WhatWeHaveDoneData {
  int? id;
  String? documentId;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? publishedAt;
  Body? body;

  WhatWeHaveDoneData({
    this.id,
    this.documentId,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.body,
  });

  factory WhatWeHaveDoneData.fromJson(Map<String, dynamic> json) =>
      WhatWeHaveDoneData(
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
        body: json["body"] == null ? null : Body.fromJson(json["body"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "documentId": documentId,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "publishedAt": publishedAt?.toIso8601String(),
        "body": body?.toJson(),
      };
}

class Body {
  int? id;
  String? secHeader;
  String? description;
  List<Body>? solutionCard;
  LogoImg? logoImg;

  Body({
    this.id,
    this.secHeader,
    this.description,
    this.solutionCard,
    this.logoImg,
  });

  factory Body.fromJson(Map<String, dynamic> json) => Body(
        id: json["id"],
        secHeader: json["sec_header"],
        description: json["description"],
        solutionCard: json["solution_card"] == null
            ? []
            : List<Body>.from(
                json["solution_card"]!.map((x) => Body.fromJson(x))),
        logoImg: json["logo_img"] == null
            ? null
            : LogoImg.fromJson(json["logo_img"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "sec_header": secHeader,
        "description": description,
        "solution_card": solutionCard == null
            ? []
            : List<dynamic>.from(solutionCard!.map((x) => x.toJson())),
        "logo_img": logoImg?.toJson(),
      };
}

class LogoImg {
  int? id;
  String? url;
  String? name;
  String? mime;
  String? label;

  LogoImg({
    this.id,
    this.url,
    this.name,
    this.mime,
    this.label,
  });

  factory LogoImg.fromJson(Map<String, dynamic> json) => LogoImg(
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
