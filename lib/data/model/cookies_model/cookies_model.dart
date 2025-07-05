// To parse this JSON data, do
//
//     final cookiesModel = cookiesModelFromJson(jsonString);

import 'dart:convert';

CookiesModel cookiesModelFromJson(String str) =>
    CookiesModel.fromJson(json.decode(str));

String cookiesModelToJson(CookiesModel data) => json.encode(data.toJson());

class CookiesModel {
  CookiesData? data;
  Meta? meta;

  CookiesModel({
    this.data,
    this.meta,
  });

  factory CookiesModel.fromJson(Map<String, dynamic> json) => CookiesModel(
        data: json["data"] == null ? null : CookiesData.fromJson(json["data"]),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "meta": meta?.toJson(),
      };
}

class CookiesData {
  int? id;
  String? documentId;
  String? secHeader;
  List<SecContent>? secContent;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? publishedAt;
  List<CookiesContent>? cookiesContent;

  CookiesData({
    this.id,
    this.documentId,
    this.secHeader,
    this.secContent,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.cookiesContent,
  });

  factory CookiesData.fromJson(Map<String, dynamic> json) => CookiesData(
        id: json["id"],
        documentId: json["documentId"],
        secHeader: json["sec_header"],
        secContent: json["sec_content"] == null
            ? []
            : List<SecContent>.from(
                json["sec_content"]!.map((x) => SecContent.fromJson(x))),
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        publishedAt: json["publishedAt"] == null
            ? null
            : DateTime.parse(json["publishedAt"]),
        cookiesContent: json["cookies_content"] == null
            ? []
            : List<CookiesContent>.from(json["cookies_content"]!
                .map((x) => CookiesContent.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "documentId": documentId,
        "sec_header": secHeader,
        "sec_content": secContent == null
            ? []
            : List<dynamic>.from(secContent!.map((x) => x.toJson())),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "publishedAt": publishedAt?.toIso8601String(),
        "cookies_content": cookiesContent == null
            ? []
            : List<dynamic>.from(cookiesContent!.map((x) => x.toJson())),
      };
}

class CookiesContent {
  int? id;
  String? secHeader;
  String? cookiesContent;
  List<CookiesSubPoint>? cookiesSubPoints;

  CookiesContent({
    this.id,
    this.secHeader,
    this.cookiesContent,
    this.cookiesSubPoints,
  });

  factory CookiesContent.fromJson(Map<String, dynamic> json) => CookiesContent(
        id: json["id"],
        secHeader: json["sec_header"],
        cookiesContent: json["cookies_content"],
        cookiesSubPoints: json["Cookies_sub_Points"] == null
            ? []
            : List<CookiesSubPoint>.from(json["Cookies_sub_Points"]!
                .map((x) => CookiesSubPoint.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "sec_header": secHeader,
        "cookies_content": cookiesContent,
        "Cookies_sub_Points": cookiesSubPoints == null
            ? []
            : List<dynamic>.from(cookiesSubPoints!.map((x) => x.toJson())),
      };
}

class CookiesSubPoint {
  int? id;
  String? secHeader;
  String? secContent;

  CookiesSubPoint({
    this.id,
    this.secHeader,
    this.secContent,
  });

  factory CookiesSubPoint.fromJson(Map<String, dynamic> json) =>
      CookiesSubPoint(
        id: json["id"],
        secHeader: json["sec_header"],
        secContent: json["sec_content"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "sec_header": secHeader,
        "sec_content": secContent,
      };
}

class SecContent {
  String? type;
  List<Child>? children;

  SecContent({
    this.type,
    this.children,
  });

  factory SecContent.fromJson(Map<String, dynamic> json) => SecContent(
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
