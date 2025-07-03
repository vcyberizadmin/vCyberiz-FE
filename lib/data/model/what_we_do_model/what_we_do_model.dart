// ignore_for_file: public_member_api_docs, sort_constructors_first
// To parse this JSON data, do
//
//     final whatWeDoModel = whatWeDoModelFromJson(jsonString);

import 'dart:convert';

WhatWeDoModel whatWeDoModelFromJson(String str) =>
    WhatWeDoModel.fromJson(json.decode(str));

String whatWeDoModelToJson(WhatWeDoModel data) => json.encode(data.toJson());

class WhatWeDoModel {
  WhatWeDoData? data;
  Meta? meta;

  WhatWeDoModel({
    this.data,
    this.meta,
  });

  factory WhatWeDoModel.fromJson(Map<String, dynamic> json) => WhatWeDoModel(
        data: json["data"] == null ? null : WhatWeDoData.fromJson(json["data"]),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "meta": meta?.toJson(),
      };
}

class WhatWeDoData {
  int? id;
  String? documentId;
  String? sectionLabel;
  String? heading;
  String? description;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? publishedAt;
  List<SecGif>? secGif;

  WhatWeDoData({
    this.id,
    this.documentId,
    this.sectionLabel,
    this.heading,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.secGif,
  });

  factory WhatWeDoData.fromJson(Map<String, dynamic> json) => WhatWeDoData(
        id: json["id"],
        documentId: json["documentId"],
        sectionLabel: json["sectionLabel"],
        heading: json["heading"],
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
        secGif: json["sec_gif"] == null
            ? []
            : List<SecGif>.from(
                json["sec_gif"]!.map((x) => SecGif.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "documentId": documentId,
        "sectionLabel": sectionLabel,
        "heading": heading,
        "description": description,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "publishedAt": publishedAt?.toIso8601String(),
        "sec_gif": secGif == null
            ? []
            : List<dynamic>.from(secGif!.map((x) => x.toJson())),
      };

  @override
  String toString() {
    return 'WhatWeDoData(id: $id, documentId: $documentId, sectionLabel: $sectionLabel, heading: $heading, description: $description, createdAt: $createdAt, updatedAt: $updatedAt, publishedAt: $publishedAt, secGif: $secGif)';
  }
}

class SecGif {
  int? id;
  String? url;
  String? name;
  String? mime;
  String? label;

  SecGif({
    this.id,
    this.url,
    this.name,
    this.mime,
    this.label,
  });

  factory SecGif.fromJson(Map<String, dynamic> json) => SecGif(
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
