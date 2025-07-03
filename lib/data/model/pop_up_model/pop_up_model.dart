// To parse this JSON data, do
//
//     final popUpModel = popUpModelFromJson(jsonString);

import 'dart:convert';

PopUpModel popUpModelFromJson(String str) =>
    PopUpModel.fromJson(json.decode(str));

String popUpModelToJson(PopUpModel data) => json.encode(data.toJson());

class PopUpModel {
  List<PopUPData>? data;
  Meta? meta;

  PopUpModel({
    this.data,
    this.meta,
  });

  factory PopUpModel.fromJson(Map<String, dynamic> json) => PopUpModel(
        data: json["data"] == null
            ? []
            : List<PopUPData>.from(
                json["data"]!.map((x) => PopUPData.fromJson(x))),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "meta": meta?.toJson(),
      };
}

class PopUPData {
  int? id;
  String? documentId;
  String? secHeader;
  String? secDescription;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? publishedAt;
  String? secColorIdentifier;
  List<SecLink>? secLinks;

  PopUPData({
    this.id,
    this.documentId,
    this.secHeader,
    this.secDescription,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.secColorIdentifier,
    this.secLinks,
  });

  factory PopUPData.fromJson(Map<String, dynamic> json) => PopUPData(
        id: json["id"],
        documentId: json["documentId"],
        secHeader: json["sec_header"],
        secDescription: json["sec_description"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        publishedAt: json["publishedAt"] == null
            ? null
            : DateTime.parse(json["publishedAt"]),
        secColorIdentifier: json["sec_colorIdentifier"],
        secLinks: json["sec_links"] == null
            ? []
            : List<SecLink>.from(
                json["sec_links"]!.map((x) => SecLink.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "documentId": documentId,
        "sec_header": secHeader,
        "sec_description": secDescription,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "publishedAt": publishedAt?.toIso8601String(),
        "sec_colorIdentifier": secColorIdentifier,
        "sec_links": secLinks == null
            ? []
            : List<dynamic>.from(secLinks!.map((x) => x.toJson())),
      };
}

class SecLink {
  int? id;
  String? label;
  String? href;
  bool? isExternal;
  String? type;

  SecLink({
    this.id,
    this.label,
    this.href,
    this.isExternal,
    this.type,
  });

  factory SecLink.fromJson(Map<String, dynamic> json) => SecLink(
        id: json["id"],
        label: json["label"],
        href: json["href"],
        isExternal: json["isExternal"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "label": label,
        "href": href,
        "isExternal": isExternal,
        "type": type,
      };
}

class Meta {
  Pagination? pagination;

  Meta({
    this.pagination,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        pagination: json["pagination"] == null
            ? null
            : Pagination.fromJson(json["pagination"]),
      );

  Map<String, dynamic> toJson() => {
        "pagination": pagination?.toJson(),
      };
}

class Pagination {
  int? page;
  int? pageSize;
  int? pageCount;
  int? total;

  Pagination({
    this.page,
    this.pageSize,
    this.pageCount,
    this.total,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        page: json["page"],
        pageSize: json["pageSize"],
        pageCount: json["pageCount"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "pageSize": pageSize,
        "pageCount": pageCount,
        "total": total,
      };
}
