// To parse this JSON data, do
//
//     final registerEventModel = registerEventModelFromJson(jsonString);

import 'dart:convert';

RegisterResponceModel registerEventModelFromJson(String str) =>
    RegisterResponceModel.fromJson(json.decode(str));

String registerEventModelToJson(RegisterResponceModel data) =>
    json.encode(data.toJson());

class RegisterResponceModel {
  final registerResponceData? data;
  final Meta? meta;

  RegisterResponceModel({
    this.data,
    this.meta,
  });

  factory RegisterResponceModel.fromJson(Map<String, dynamic> json) =>
      RegisterResponceModel(
        data: json["data"] == null
            ? null
            : registerResponceData.fromJson(json["data"]),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "meta": meta?.toJson(),
      };
}

class registerResponceData {
  final int? id;
  final String? documentId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? publishedAt;
  final String? fullName;
  final String? businessEmail;
  final String? mobileNumber;
  final String? uniqueIdentifier;
  final String? eventId;
  final String? eventName;

  registerResponceData({
    this.id,
    this.documentId,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.fullName,
    this.businessEmail,
    this.mobileNumber,
    this.uniqueIdentifier,
    this.eventId,
    this.eventName,
  });

  factory registerResponceData.fromJson(Map<String, dynamic> json) =>
      registerResponceData(
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
        fullName: json["full_name"],
        businessEmail: json["business_email"],
        mobileNumber: json["mobile_number"],
        uniqueIdentifier: json["unique_identifier"],
        eventId: json["event_id"],
        eventName: json["event_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "documentId": documentId,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "publishedAt": publishedAt?.toIso8601String(),
        "full_name": fullName,
        "business_email": businessEmail,
        "mobile_number": mobileNumber,
        "unique_identifier": uniqueIdentifier,
        "event_id": eventId,
        "event_name": eventName,
      };
}

class Meta {
  Meta();

  factory Meta.fromJson(Map<String, dynamic> json) => Meta();

  Map<String, dynamic> toJson() => {};
}
