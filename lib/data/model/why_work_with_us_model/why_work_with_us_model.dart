// To parse this JSON data, do
//
//     final whyWorkWithUsModel = whyWorkWithUsModelFromJson(jsonString);

import 'dart:convert';

WhyWorkWithUsModel whyWorkWithUsModelFromJson(String str) =>
    WhyWorkWithUsModel.fromJson(json.decode(str));

String whyWorkWithUsModelToJson(WhyWorkWithUsModel data) =>
    json.encode(data.toJson());

class WhyWorkWithUsModel {
  final WhyWorkData? data;
  final Meta? meta;

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
  final int? id;
  final String? documentId;
  final String? description;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? publishedAt;
  final String? secHeader;
  final List<Card>? cards;

  WhyWorkData({
    this.id,
    this.documentId,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.secHeader,
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
        "cards": cards == null
            ? []
            : List<dynamic>.from(cards!.map((x) => x.toJson())),
      };
}

class Card {
  final int? id;
  final String? title;
  final String? description;
  final CardImg? cardImg;

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
        cardImg: json["card_img"] == null
            ? null
            : CardImg.fromJson(json["card_img"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "card_img": cardImg?.toJson(),
      };
}

class CardImg {
  final int? id;
  final String? url;
  final String? name;
  final String? mime;
  final String? label;

  CardImg({
    this.id,
    this.url,
    this.name,
    this.mime,
    this.label,
  });

  factory CardImg.fromJson(Map<String, dynamic> json) => CardImg(
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
