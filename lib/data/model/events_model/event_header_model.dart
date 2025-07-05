// To parse this JSON data, do
//
//     final eventsHeaderModel = eventsHeaderModelFromJson(jsonString);

import 'dart:convert';

EventsHeaderModel eventsHeaderModelFromJson(String str) =>
    EventsHeaderModel.fromJson(json.decode(str));

String eventsHeaderModelToJson(EventsHeaderModel data) =>
    json.encode(data.toJson());

class EventsHeaderModel {
  EventsData? data;
  Meta? meta;

  EventsHeaderModel({
    this.data,
    this.meta,
  });

  factory EventsHeaderModel.fromJson(Map<String, dynamic> json) =>
      EventsHeaderModel(
        data: json["data"] == null ? null : EventsData.fromJson(json["data"]),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "meta": meta?.toJson(),
      };
}

class EventsData {
  int? id;
  String? documentId;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? publishedAt;
  SecBody? secBody;

  EventsData({
    this.id,
    this.documentId,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.secBody,
  });

  factory EventsData.fromJson(Map<String, dynamic> json) => EventsData(
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
        secBody: json["sec_body"] == null
            ? null
            : SecBody.fromJson(json["sec_body"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "documentId": documentId,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "publishedAt": publishedAt?.toIso8601String(),
        "sec_body": secBody?.toJson(),
      };
}

class SecBody {
  int? id;
  String? secHeader;
  List<SecBg>? secBg;

  SecBody({
    this.id,
    this.secHeader,
    this.secBg,
  });

  factory SecBody.fromJson(Map<String, dynamic> json) => SecBody(
        id: json["id"],
        secHeader: json["sec_header"],
        secBg: json["sec_bg"] == null
            ? []
            : List<SecBg>.from(json["sec_bg"]!.map((x) => SecBg.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "sec_header": secHeader,
        "sec_bg": secBg == null
            ? []
            : List<dynamic>.from(secBg!.map((x) => x.toJson())),
      };
}

class SecBg {
  int? id;
  String? url;
  String? name;
  String? mime;
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
