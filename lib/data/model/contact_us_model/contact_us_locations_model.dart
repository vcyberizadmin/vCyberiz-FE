// To parse this JSON data, do
//
//     final contactUsLocationModel = contactUsLocationModelFromJson(jsonString);

import 'dart:convert';

ContactUsLocationModel contactUsLocationModelFromJson(String str) =>
    ContactUsLocationModel.fromJson(json.decode(str));

String contactUsLocationModelToJson(ContactUsLocationModel data) =>
    json.encode(data.toJson());

class ContactUsLocationModel {
  ContactUsLocationData? data;
  Meta? meta;

  ContactUsLocationModel({
    this.data,
    this.meta,
  });

  factory ContactUsLocationModel.fromJson(Map<String, dynamic> json) =>
      ContactUsLocationModel(
        data: json["data"] == null
            ? null
            : ContactUsLocationData.fromJson(json["data"]),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "meta": meta?.toJson(),
      };
}

class ContactUsLocationData {
  int? id;
  String? documentId;
  List<SecHeader>? secHeader;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? publishedAt;
  List<SecCard>? secCard;

  ContactUsLocationData({
    this.id,
    this.documentId,
    this.secHeader,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.secCard,
  });

  factory ContactUsLocationData.fromJson(Map<String, dynamic> json) =>
      ContactUsLocationData(
        id: json["id"],
        documentId: json["documentId"],
        secHeader: json["sec_header"] == null
            ? []
            : List<SecHeader>.from(
                json["sec_header"]!.map((x) => SecHeader.fromJson(x))),
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
        "sec_header": secHeader == null
            ? []
            : List<dynamic>.from(secHeader!.map((x) => x.toJson())),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "publishedAt": publishedAt?.toIso8601String(),
        "sec_card": secCard == null
            ? []
            : List<dynamic>.from(secCard!.map((x) => x.toJson())),
      };
}

class SecCard {
  int? id;
  SecBody? secBody;

  SecCard({
    this.id,
    this.secBody,
  });

  factory SecCard.fromJson(Map<String, dynamic> json) => SecCard(
        id: json["id"],
        secBody: json["sec_body"] == null
            ? null
            : SecBody.fromJson(json["sec_body"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "sec_body": secBody?.toJson(),
      };
}

class SecBody {
  int? id;
  String? header;
  String? content;
  dynamic label;
  String? key;
  String? subtitle;

  SecBody({
    this.id,
    this.header,
    this.content,
    this.label,
    this.key,
    this.subtitle,
  });

  factory SecBody.fromJson(Map<String, dynamic> json) => SecBody(
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

class SecHeader {
  String? type;
  List<Child>? children;

  SecHeader({
    this.type,
    this.children,
  });

  factory SecHeader.fromJson(Map<String, dynamic> json) => SecHeader(
        type: json["type"],
        children: json["children"] == null
            ? []
            : List<Child>.from(json["children"]!.map((x) => Child.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "children": children == null
            ? []
            : List<dynamic>.from(children!.map((x) => x.toJson())),
      };
}

class Child {
  String? text;
  String? type;

  Child({
    this.text,
    this.type,
  });

  factory Child.fromJson(Map<String, dynamic> json) => Child(
        text: json["text"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "type": type,
      };
}

class Meta {
  Meta();

  factory Meta.fromJson(Map<String, dynamic> json) => Meta();

  Map<String, dynamic> toJson() => {};
}
