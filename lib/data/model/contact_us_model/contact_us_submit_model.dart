// To parse this JSON data, do
//
//     final contactUsHeaderModel = contactUsHeaderModelFromJson(jsonString);

import 'dart:convert';

ContactUsHeaderModel contactUsHeaderModelFromJson(String str) =>
    ContactUsHeaderModel.fromJson(json.decode(str));

String contactUsHeaderModelToJson(ContactUsHeaderModel data) =>
    json.encode(data.toJson());

class ContactUsHeaderModel {
  SubmitData? data;
  Meta? meta;
  ContactUsHeaderModelError? error;

  ContactUsHeaderModel({
    this.data,
    this.meta,
    this.error,
  });

  factory ContactUsHeaderModel.fromJson(Map<String, dynamic> json) =>
      ContactUsHeaderModel(
        data: json["data"] == null ? null : SubmitData.fromJson(json["data"]),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
        error: json["error"] == null
            ? null
            : ContactUsHeaderModelError.fromJson(json["error"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "meta": meta?.toJson(),
        "error": error?.toJson(),
      };
}

class SubmitData {
  int? id;
  String? documentId;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? publishedAt;

  SubmitData({
    this.id,
    this.documentId,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
  });

  factory SubmitData.fromJson(Map<String, dynamic> json) => SubmitData(
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
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "documentId": documentId,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "publishedAt": publishedAt?.toIso8601String(),
      };
}

class ContactUsHeaderModelError {
  int? status;
  String? name;
  String? message;
  Details? details;

  ContactUsHeaderModelError({
    this.status,
    this.name,
    this.message,
    this.details,
  });

  factory ContactUsHeaderModelError.fromJson(Map<String, dynamic> json) =>
      ContactUsHeaderModelError(
        status: json["status"],
        name: json["name"],
        message: json["message"],
        details:
            json["details"] == null ? null : Details.fromJson(json["details"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "name": name,
        "message": message,
        "details": details?.toJson(),
      };
}

class Details {
  List<ErrorElement>? errors;

  Details({
    this.errors,
  });

  factory Details.fromJson(Map<String, dynamic> json) => Details(
        errors: json["errors"] == null
            ? []
            : List<ErrorElement>.from(
                json["errors"]!.map((x) => ErrorElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "errors": errors == null
            ? []
            : List<dynamic>.from(errors!.map((x) => x.toJson())),
      };
}

class ErrorElement {
  List<String>? path;
  String? message;
  String? name;

  ErrorElement({
    this.path,
    this.message,
    this.name,
  });

  factory ErrorElement.fromJson(Map<String, dynamic> json) => ErrorElement(
        path: json["path"] == null
            ? []
            : List<String>.from(json["path"]!.map((x) => x)),
        message: json["message"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "path": path == null ? [] : List<dynamic>.from(path!.map((x) => x)),
        "message": message,
        "name": name,
      };
}

class Meta {
  Meta();

  factory Meta.fromJson(Map<String, dynamic> json) => Meta();

  Map<String, dynamic> toJson() => {};
}
