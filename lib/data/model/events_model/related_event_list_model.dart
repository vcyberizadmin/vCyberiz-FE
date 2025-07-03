// ignore_for_file: public_member_api_docs, sort_constructors_first
// To parse this JSON data, do
//
//     final eventsListModel = eventsListModelFromJson(jsonString);

import 'dart:convert';

RelatedEventsListModel eventsListModelFromJson(String str) =>
    RelatedEventsListModel.fromJson(json.decode(str));

String eventsListModelToJson(RelatedEventsListModel data) =>
    json.encode(data.toJson());

class RelatedEventsListModel {
  RelatedEventsData? data;
  Meta? meta;

  RelatedEventsListModel({
    this.data,
    this.meta,
  });

  factory RelatedEventsListModel.fromJson(Map<String, dynamic> json) =>
      RelatedEventsListModel(
        data: json["data"] == null
            ? null
            : RelatedEventsData.fromJson(json["data"]),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "meta": meta?.toJson(),
      };
}

class RelatedEventsData {
  int? id;
  String? documentId;
  String? secHeader;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? publishedAt;
  List<EventList>? secBody;
  SecCard? secCard;

  RelatedEventsData({
    this.id,
    this.documentId,
    this.secHeader,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.secBody,
    this.secCard,
  });

  factory RelatedEventsData.fromJson(Map<String, dynamic> json) =>
      RelatedEventsData(
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
        secBody: json["sec_body"] == null
            ? []
            : List<EventList>.from(
                json["sec_body"]!.map((x) => EventList.fromJson(x))),
        secCard: json["sec_card"] == null
            ? null
            : SecCard.fromJson(json["sec_card"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "documentId": documentId,
        "sec_header": secHeader,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "publishedAt": publishedAt?.toIso8601String(),
        "sec_body": secBody == null
            ? []
            : List<dynamic>.from(secBody!.map((x) => x.toJson())),
        "sec_card": secCard?.toJson(),
      };
}

class EventList {
  int? id;
  String? cardHeader;
  String? cardDescription;
  String? buttonColorIdentifier;
  SecBg? secBg;
  List<Sec>? secCta;
  DateBox? dateBox;

  EventList({
    this.id,
    this.cardHeader,
    this.cardDescription,
    this.buttonColorIdentifier,
    this.secBg,
    this.secCta,
    this.dateBox,
  });

  factory EventList.fromJson(Map<String, dynamic> json) => EventList(
        id: json["id"],
        cardHeader: json["card_header"],
        cardDescription: json["card_description"],
        buttonColorIdentifier: json["button_colorIdentifier"],
        secBg: json["sec_bg"] == null ? null : SecBg.fromJson(json["sec_bg"]),
        secCta: json["sec_cta"] == null
            ? []
            : List<Sec>.from(json["sec_cta"]!.map((x) => Sec.fromJson(x))),
        dateBox: json["date_box"] == null
            ? null
            : DateBox.fromJson(json["date_box"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "card_header": cardHeader,
        "card_description": cardDescription,
        "button_colorIdentifier": buttonColorIdentifier,
        "sec_bg": secBg?.toJson(),
        "sec_cta": secCta == null
            ? []
            : List<dynamic>.from(secCta!.map((x) => x.toJson())),
        "date_box": dateBox?.toJson(),
      };

  @override
  String toString() {
    return 'EventList(id: $id, cardHeader: $cardHeader, cardDescription: $cardDescription, buttonColorIdentifier: $buttonColorIdentifier, secBg: $secBg, secCta: $secCta, dateBox: $dateBox)';
  }
}

class DateBox {
  int? id;
  String? year;
  String? month;

  DateBox({
    this.id,
    this.year,
    this.month,
  });

  factory DateBox.fromJson(Map<String, dynamic> json) => DateBox(
        id: json["id"],
        year: json["year"],
        month: json["month"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "year": year,
        "month": month,
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

enum Mime { IMG_PNG }

final mimeValues = EnumValues({"img/png": Mime.IMG_PNG});

class Sec {
  int? id;
  Label? label;
  Href? href;
  bool? isExternal;
  Type? type;

  Sec({
    this.id,
    this.label,
    this.href,
    this.isExternal,
    this.type,
  });

  factory Sec.fromJson(Map<String, dynamic> json) => Sec(
        id: json["id"],
        label: labelValues.map[json["label"]]!,
        href: hrefValues.map[json["href"]]!,
        isExternal: json["isExternal"],
        type: typeValues.map[json["type"]]!,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "label": labelValues.reverse[label],
        "href": hrefValues.reverse[href],
        "isExternal": isExternal,
        "type": typeValues.reverse[type],
      };
}

enum Href { EMPTY }

final hrefValues = EnumValues({"/": Href.EMPTY});

enum Label { CONTACT_US, READ_MORE }

final labelValues =
    EnumValues({"Contact Us": Label.CONTACT_US, "Read More": Label.READ_MORE});

enum Type { NORMAL }

final typeValues = EnumValues({"NORMAL": Type.NORMAL});

class SecCard {
  int? id;
  String? secHeader;
  String? subHeader;
  dynamic secColorIdentifier;
  Sec? secButton;
  SecBg? secBg;
  dynamic aboutArrow;

  SecCard({
    this.id,
    this.secHeader,
    this.subHeader,
    this.secColorIdentifier,
    this.secButton,
    this.secBg,
    this.aboutArrow,
  });

  factory SecCard.fromJson(Map<String, dynamic> json) => SecCard(
        id: json["id"],
        secHeader: json["sec_header"],
        subHeader: json["sub_header"],
        secColorIdentifier: json["sec_colorIdentifier"],
        secButton: json["sec_button"] == null
            ? null
            : Sec.fromJson(json["sec_button"]),
        secBg: json["sec_bg"] == null ? null : SecBg.fromJson(json["sec_bg"]),
        aboutArrow: json["About_arrow"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "sec_header": secHeader,
        "sub_header": subHeader,
        "sec_colorIdentifier": secColorIdentifier,
        "sec_button": secButton?.toJson(),
        "sec_bg": secBg?.toJson(),
        "About_arrow": aboutArrow,
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
