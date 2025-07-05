// To parse this JSON data, do
//
//     final whyWorkWithUsModel = whyWorkWithUsModelFromJson(jsonString);

import 'dart:convert';

WhyWorkWithUsModel whyWorkWithUsModelFromJson(String str) =>
    WhyWorkWithUsModel.fromJson(json.decode(str));

String whyWorkWithUsModelToJson(WhyWorkWithUsModel data) =>
    json.encode(data.toJson());

class WhyWorkWithUsModel {
  WhyWorkData? data;
  Meta? meta;

  WhyWorkWithUsModel({
    this.data,
    this.meta,
  });

  factory WhyWorkWithUsModel.fromJson(Map<String, dynamic> json) =>
      WhyWorkWithUsModel(
        data: json["data"] == null ? null : WhyWorkData.fromJson(json["data"]),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "meta": meta?.toJson(),
      };
}

class WhyWorkData {
  int? id;
  String? documentId;
  String? description;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? publishedAt;
  String? secHeader;
  Img? bgImg;
  List<Card>? cards;

  WhyWorkData({
    this.id,
    this.documentId,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.secHeader,
    this.bgImg,
    this.cards,
  });

  factory WhyWorkData.fromJson(Map<String, dynamic> json) => WhyWorkData(
        id: json["id"],
        documentId: json["documentId"],
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
        secHeader: json["sec_header"],
        bgImg: json["bg_img"] == null ? null : Img.fromJson(json["bg_img"]),
        cards: json["cards"] == null
            ? []
            : List<Card>.from(json["cards"]!.map((x) => Card.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "documentId": documentId,
        "description": description,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "publishedAt": publishedAt?.toIso8601String(),
        "sec_header": secHeader,
        "bg_img": bgImg?.toJson(),
        "cards": cards == null
            ? []
            : List<dynamic>.from(cards!.map((x) => x.toJson())),
      };
}

class Img {
  int? id;
  String? url;
  String? name;
  String? mime;
  String? label;

  Img({
    this.id,
    this.url,
    this.name,
    this.mime,
    this.label,
  });

  factory Img.fromJson(Map<String, dynamic> json) => Img(
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

class Card {
  int? id;
  String? title;
  String? description;
  Img? cardImg;

  Card({
    this.id,
    this.title,
    this.description,
    this.cardImg,
  });

  factory Card.fromJson(Map<String, dynamic> json) => Card(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        cardImg:
            json["card_img"] == null ? null : Img.fromJson(json["card_img"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "card_img": cardImg?.toJson(),
      };
}

class Meta {
  Meta();

  factory Meta.fromJson(Map<String, dynamic> json) => Meta();

  Map<String, dynamic> toJson() => {};
}
