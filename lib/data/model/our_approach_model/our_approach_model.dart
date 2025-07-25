// To parse this JSON data, do
//
//     final ourApproachModel = ourApproachModelFromJson(jsonString);

import 'dart:convert';

OurApproachModel ourApproachModelFromJson(String str) =>
    OurApproachModel.fromJson(json.decode(str));

String ourApproachModelToJson(OurApproachModel data) =>
    json.encode(data.toJson());

class OurApproachModel {
  ApproachData? data;
  Meta? meta;

  OurApproachModel({
    this.data,
    this.meta,
  });

  factory OurApproachModel.fromJson(Map<String, dynamic> json) =>
      OurApproachModel(
        data: json["data"] == null ? null : ApproachData.fromJson(json["data"]),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "meta": meta?.toJson(),
      };
}

class ApproachData {
  int? id;
  String? documentId;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? publishedAt;
  ApproachHeader? approachHeader;
  List<CardList>? cardList;
  List<CardNav>? cardNavs;
  List<SecBg>? secBg;

  ApproachData({
    this.id,
    this.documentId,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.approachHeader,
    this.cardList,
    this.cardNavs,
    this.secBg,
  });

  factory ApproachData.fromJson(Map<String, dynamic> json) => ApproachData(
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
        approachHeader: json["approachHeader"] == null
            ? null
            : ApproachHeader.fromJson(json["approachHeader"]),
        cardList: json["cardList"] == null
            ? []
            : List<CardList>.from(
                json["cardList"]!.map((x) => CardList.fromJson(x))),
        cardNavs: json["card_navs"] == null
            ? []
            : List<CardNav>.from(
                json["card_navs"]!.map((x) => CardNav.fromJson(x))),
        secBg: json["sec_bg"] == null
            ? []
            : List<SecBg>.from(json["sec_bg"]!.map((x) => SecBg.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "documentId": documentId,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "publishedAt": publishedAt?.toIso8601String(),
        "approachHeader": approachHeader?.toJson(),
        "cardList": cardList == null
            ? []
            : List<dynamic>.from(cardList!.map((x) => x.toJson())),
        "card_navs": cardNavs == null
            ? []
            : List<dynamic>.from(cardNavs!.map((x) => x.toJson())),
        "sec_bg": secBg == null
            ? []
            : List<dynamic>.from(secBg!.map((x) => x.toJson())),
      };
}

class ApproachHeader {
  int? id;
  String? header;
  String? content;
  String? label;
  dynamic key;
  dynamic subtitle;

  ApproachHeader({
    this.id,
    this.header,
    this.content,
    this.label,
    this.key,
    this.subtitle,
  });

  factory ApproachHeader.fromJson(Map<String, dynamic> json) => ApproachHeader(
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

class CardList {
  int? id;
  String? title;
  String? highlightText;
  String? description;
  String? cardId;
  List<SecBg>? approachCard;

  CardList({
    this.id,
    this.title,
    this.highlightText,
    this.description,
    this.cardId,
    this.approachCard,
  });

  factory CardList.fromJson(Map<String, dynamic> json) => CardList(
        id: json["id"],
        title: json["title"],
        highlightText: json["highlightText"],
        description: json["description"],
        cardId: json["card_id"],
        approachCard: json["approach_card"] == null
            ? []
            : List<SecBg>.from(
                json["approach_card"]!.map((x) => SecBg.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "highlightText": highlightText,
        "description": description,
        "card_id": cardId,
        "approach_card": approachCard == null
            ? []
            : List<dynamic>.from(approachCard!.map((x) => x.toJson())),
      };
}

class SecBg {
  int? id;
  String? url;
  String? name;
  Mime? mime;
  String? label;

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
        mime: mimeValues.map[json["mime"]]!,
        label: json["label"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
        "name": name,
        "mime": mimeValues.reverse[mime],
        "label": label,
      };
}

enum Mime { IMAGE_SVG_XML, VIDEO_MP4, VIDEO_WEBM }

final mimeValues = EnumValues({
  "image/svg+xml": Mime.IMAGE_SVG_XML,
  "video/mp4": Mime.VIDEO_MP4,
  "video/webm": Mime.VIDEO_WEBM
});

class CardNav {
  int? id;
  String? title;
  String? mapTo;

  CardNav({
    this.id,
    this.title,
    this.mapTo,
  });

  factory CardNav.fromJson(Map<String, dynamic> json) => CardNav(
        id: json["id"],
        title: json["title"],
        mapTo: json["map_to"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "map_to": mapTo,
      };
}

class Meta {
  Meta();

  factory Meta.fromJson(Map<String, dynamic> json) => Meta();

  Map<String, dynamic> toJson() => {};
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
