// To parse this JSON data, do
//
//     final careerListModel = careerListModelFromJson(jsonString);

import 'dart:convert';

CareerListModel careerListModelFromJson(String str) =>
    CareerListModel.fromJson(json.decode(str));

String careerListModelToJson(CareerListModel data) =>
    json.encode(data.toJson());

class CareerListModel {
  List<CareerListData>? data;
  Meta? meta;

  CareerListModel({
    this.data,
    this.meta,
  });

  factory CareerListModel.fromJson(Map<String, dynamic> json) =>
      CareerListModel(
        data: json["data"] == null
            ? []
            : List<CareerListData>.from(
                json["data"]!.map((x) => CareerListData.fromJson(x))),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "meta": meta?.toJson(),
      };
}

class CareerListData {
  int? id;
  String? documentId;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? publishedAt;
  String? secHeader;
  String? secDescription;
  String? jobcardHeader;
  String? jobcardDescription;
  String? headerColorIdentifier;
  String? jpId;
  bool? bookmarkIdentifier;
  SecCta? secCta;
  List<Functions>? employmentTypes;
  List<Functions>? skills;
  Functions? function;
  List<Country>? countries;
  ZipCode? zipCode;

  CareerListData({
    this.id,
    this.documentId,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.secHeader,
    this.secDescription,
    this.jobcardHeader,
    this.jobcardDescription,
    this.headerColorIdentifier,
    this.jpId,
    this.bookmarkIdentifier,
    this.secCta,
    this.employmentTypes,
    this.skills,
    this.function,
    this.countries,
    this.zipCode,
  });

  factory CareerListData.fromJson(Map<String, dynamic> json) => CareerListData(
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
        secHeader: json["sec_header"],
        secDescription: json["sec_description"],
        jobcardHeader: json["jobcard_header"],
        jobcardDescription: json["jobcard_description"],
        headerColorIdentifier: json["header_colorIdentifier"],
        jpId: json["jp_id"],
        bookmarkIdentifier: json["bookmark_identifier"],
        secCta:
            json["sec_cta"] == null ? null : SecCta.fromJson(json["sec_cta"]),
        employmentTypes: json["employment_types"] == null
            ? []
            : List<Functions>.from(
                json["employment_types"]!.map((x) => Functions.fromJson(x))),
        skills: json["skills"] == null
            ? []
            : List<Functions>.from(
                json["skills"]!.map((x) => Functions.fromJson(x))),
        function: json["function"] == null
            ? null
            : Functions.fromJson(json["function"]),
        countries: json["countries"] == null
            ? []
            : List<Country>.from(
                json["countries"]!.map((x) => Country.fromJson(x))),
        zipCode: json["zip_code"] == null
            ? null
            : ZipCode.fromJson(json["zip_code"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "documentId": documentId,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "publishedAt": publishedAt?.toIso8601String(),
        "sec_header": secHeader,
        "sec_description": secDescription,
        "jobcard_header": jobcardHeader,
        "jobcard_description": jobcardDescription,
        "header_colorIdentifier": headerColorIdentifier,
        "jp_id": jpId,
        "bookmark_identifier": bookmarkIdentifier,
        "sec_cta": secCta?.toJson(),
        "employment_types": employmentTypes == null
            ? []
            : List<dynamic>.from(employmentTypes!.map((x) => x.toJson())),
        "skills": skills == null
            ? []
            : List<dynamic>.from(skills!.map((x) => x.toJson())),
        "function": function?.toJson(),
        "countries": countries == null
            ? []
            : List<dynamic>.from(countries!.map((x) => x.toJson())),
        "zip_code": zipCode?.toJson(),
      };
}

class Country {
  int? id;
  String? documentId;
  String? text;
  String? locId;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? publishedAt;

  Country({
    this.id,
    this.documentId,
    this.text,
    this.locId,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
  });

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        id: json["id"],
        documentId: json["documentId"],
        text: json["text"],
        locId: json["Loc_id"],
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
        "text": text,
        "Loc_id": locId,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "publishedAt": publishedAt?.toIso8601String(),
      };
}

class Functions {
  int? id;
  String? documentId;
  String? secText;
  String? etId;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? publishedAt;
  String? colorIdentifier;
  String? fid;
  String? sid;

  Functions({
    this.id,
    this.documentId,
    this.secText,
    this.etId,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.colorIdentifier,
    this.fid,
    this.sid,
  });

  factory Functions.fromJson(Map<String, dynamic> json) => Functions(
        id: json["id"],
        documentId: json["documentId"],
        secText: json["sec_text"],
        etId: json["et_id"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        publishedAt: json["publishedAt"] == null
            ? null
            : DateTime.parse(json["publishedAt"]),
        colorIdentifier: json["color_identifier"],
        fid: json["fid"],
        sid: json["sid"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "documentId": documentId,
        "sec_text": secText,
        "et_id": etId,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "publishedAt": publishedAt?.toIso8601String(),
        "color_identifier": colorIdentifier,
        "fid": fid,
        "sid": sid,
      };
}

class SecCta {
  int? id;
  String? label;
  String? href;
  bool? isExternal;
  String? type;

  SecCta({
    this.id,
    this.label,
    this.href,
    this.isExternal,
    this.type,
  });

  factory SecCta.fromJson(Map<String, dynamic> json) => SecCta(
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

class ZipCode {
  int? id;
  String? documentId;
  String? name;
  String? zipId;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? publishedAt;

  ZipCode({
    this.id,
    this.documentId,
    this.name,
    this.zipId,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
  });

  factory ZipCode.fromJson(Map<String, dynamic> json) => ZipCode(
        id: json["id"],
        documentId: json["documentId"],
        name: json["name"],
        zipId: json["zip_id"],
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
        "name": name,
        "zip_id": zipId,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "publishedAt": publishedAt?.toIso8601String(),
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

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
