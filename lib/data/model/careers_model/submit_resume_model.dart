// To parse this JSON data, do
//
//     final submitResumeModel = submitResumeModelFromJson(jsonString);

import 'dart:convert';

SubmitResumeModel submitResumeModelFromJson(String str) =>
    SubmitResumeModel.fromJson(json.decode(str));

String submitResumeModelToJson(SubmitResumeModel data) =>
    json.encode(data.toJson());

class SubmitResumeModel {
  final SubmitResumeData? data;
  final Meta? meta;

  SubmitResumeModel({
    this.data,
    this.meta,
  });

  factory SubmitResumeModel.fromJson(Map<String, dynamic> json) =>
      SubmitResumeModel(
        data: json["data"] == null
            ? null
            : SubmitResumeData.fromJson(json["data"]),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "meta": meta?.toJson(),
      };
}

class SubmitResumeData {
  final int? id;
  final String? documentId;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phoneNumber;
  final String? linkedin;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? publishedAt;
  final String? uploadCv;

  SubmitResumeData({
    this.id,
    this.documentId,
    this.firstName,
    this.lastName,
    this.email,
    this.phoneNumber,
    this.linkedin,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.uploadCv,
  });

  factory SubmitResumeData.fromJson(Map<String, dynamic> json) =>
      SubmitResumeData(
        id: json["id"],
        documentId: json["documentId"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        phoneNumber: json["phone_number"],
        linkedin: json["linkedin"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        publishedAt: json["publishedAt"] == null
            ? null
            : DateTime.parse(json["publishedAt"]),
        uploadCv: json["upload_cv"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "documentId": documentId,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "phone_number": phoneNumber,
        "linkedin": linkedin,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "publishedAt": publishedAt?.toIso8601String(),
        "upload_cv": uploadCv,
      };
}

class Meta {
  Meta();

  factory Meta.fromJson(Map<String, dynamic> json) => Meta();

  Map<String, dynamic> toJson() => {};
}
