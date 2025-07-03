// To parse this JSON data, do
//
//     final subscribeModel = subscribeModelFromJson(jsonString);

import 'dart:convert';

SubscribeModel subscribeModelFromJson(String str) =>
    SubscribeModel.fromJson(json.decode(str));

String subscribeModelToJson(SubscribeModel data) => json.encode(data.toJson());

class SubscribeModel {
  SubscribeData? data;
  Meta? meta;

  SubscribeModel({
    this.data,
    this.meta,
  });

  factory SubscribeModel.fromJson(Map<String, dynamic> json) => SubscribeModel(
        data:
            json["data"] == null ? null : SubscribeData.fromJson(json["data"]),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "meta": meta?.toJson(),
      };
}

class SubscribeData {
  int? id;
  String? documentId;
  String? email;
  dynamic datetime;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? publishedAt;

  SubscribeData({
    this.id,
    this.documentId,
    this.email,
    this.datetime,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
  });

  factory SubscribeData.fromJson(Map<String, dynamic> json) => SubscribeData(
        id: json["id"],
        documentId: json["documentId"],
        email: json["email"],
        datetime: json["datetime"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        publishedAt: json["publishedAt"] == null
            ? null
            : DateTime.parse(json["publishedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "documentId": documentId,
        "email": email,
        "datetime": datetime,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "publishedAt": publishedAt?.toIso8601String(),
      };
}

class Meta {
  Meta();

  factory Meta.fromJson(Map<String, dynamic> json) => Meta();

  Map<String, dynamic> toJson() => {};
}
