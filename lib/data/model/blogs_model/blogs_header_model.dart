// To parse this JSON data, do
//
//     final blogsHeaderModel = blogsHeaderModelFromJson(jsonString);

import 'dart:convert';

BlogsHeaderModel blogsHeaderModelFromJson(String str) =>
    BlogsHeaderModel.fromJson(json.decode(str));

String blogsHeaderModelToJson(BlogsHeaderModel data) =>
    json.encode(data.toJson());

class BlogsHeaderModel {
  BlogsHeaderData? data;
  Meta? meta;

  BlogsHeaderModel({
    this.data,
    this.meta,
  });

  factory BlogsHeaderModel.fromJson(Map<String, dynamic> json) =>
      BlogsHeaderModel(
        data: json["data"] == null
            ? null
            : BlogsHeaderData.fromJson(json["data"]),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "meta": meta?.toJson(),
      };
}

class BlogsHeaderData {
  int? id;
  String? documentId;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? publishedAt;
  SecHeader? secHeader;

  BlogsHeaderData({
    this.id,
    this.documentId,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.secHeader,
  });

  factory BlogsHeaderData.fromJson(Map<String, dynamic> json) =>
      BlogsHeaderData(
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
        secHeader: json["sec_header"] == null
            ? null
            : SecHeader.fromJson(json["sec_header"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "documentId": documentId,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "publishedAt": publishedAt?.toIso8601String(),
        "sec_header": secHeader?.toJson(),
      };
}

class SecHeader {
  int? id;
  String? secHeader;
  List<SecBg>? secBg;

  SecHeader({
    this.id,
    this.secHeader,
    this.secBg,
  });

  factory SecHeader.fromJson(Map<String, dynamic> json) => SecHeader(
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
