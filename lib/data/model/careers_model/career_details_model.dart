// To parse this JSON data, do
//
//     final careerDetailsModel = careerDetailsModelFromJson(jsonString);

import 'dart:convert';

CareerDetailsModel careerDetailsModelFromJson(String str) =>
    CareerDetailsModel.fromJson(json.decode(str));

String careerDetailsModelToJson(CareerDetailsModel data) =>
    json.encode(data.toJson());

class CareerDetailsModel {
  final CareerData? data;
  final Meta? meta;

  CareerDetailsModel({
    this.data,
    this.meta,
  });

  factory CareerDetailsModel.fromJson(Map<String, dynamic> json) =>
      CareerDetailsModel(
        data: json["data"] == null ? null : CareerData.fromJson(json["data"]),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "meta": meta?.toJson(),
      };
}

class CareerData {
  final int? id;
  final String? documentId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? publishedAt;
  final String? secHeader;
  final String? secDescription;
  final String? jobcardHeader;
  final String? jobcardDescription;
  final String? headerColorIdentifier;
  final String? jpId;
  final bool? bookmarkIdentifier;
  final dynamic globalUrl;
  final List<JobDetail>? jobDetails;
  final List<EmploymentType>? skills;
  final ZipCode? zipCode;
  final List<EmploymentType>? employmentTypes;

  CareerData({
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
    this.globalUrl,
    this.jobDetails,
    this.skills,
    this.zipCode,
    this.employmentTypes,
  });

  factory CareerData.fromJson(Map<String, dynamic> json) => CareerData(
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
        globalUrl: json["global_url"],
        jobDetails: json["job_details"] == null
            ? []
            : List<JobDetail>.from(
                json["job_details"]!.map((x) => JobDetail.fromJson(x))),
        skills: json["skills"] == null
            ? []
            : List<EmploymentType>.from(
                json["skills"]!.map((x) => EmploymentType.fromJson(x))),
        zipCode: json["zip_code"] == null
            ? null
            : ZipCode.fromJson(json["zip_code"]),
        employmentTypes: json["employment_types"] == null
            ? []
            : List<EmploymentType>.from(json["employment_types"]!
                .map((x) => EmploymentType.fromJson(x))),
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
        "global_url": globalUrl,
        "job_details": jobDetails == null
            ? []
            : List<dynamic>.from(jobDetails!.map((x) => x.toJson())),
        "skills": skills == null
            ? []
            : List<dynamic>.from(skills!.map((x) => x.toJson())),
        "zip_code": zipCode?.toJson(),
        "employment_types": employmentTypes == null
            ? []
            : List<dynamic>.from(employmentTypes!.map((x) => x.toJson())),
      };
}

class EmploymentType {
  final int? id;
  final String? documentId;
  final String? secText;
  final String? etId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? publishedAt;
  final String? colorIdentifier;
  final String? sid;

  EmploymentType({
    this.id,
    this.documentId,
    this.secText,
    this.etId,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.colorIdentifier,
    this.sid,
  });

  factory EmploymentType.fromJson(Map<String, dynamic> json) => EmploymentType(
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
        "sid": sid,
      };
}

class JobDetail {
  final String? component;
  final int? id;
  final String? secHeader;
  final List<ContentBlock>? contentBlock;
  final List<BodyText>? bodyText;
  final String? secDescription;
  final dynamic headerColorIdentifier;

  JobDetail({
    this.component,
    this.id,
    this.secHeader,
    this.contentBlock,
    this.bodyText,
    this.secDescription,
    this.headerColorIdentifier,
  });

  factory JobDetail.fromJson(Map<String, dynamic> json) => JobDetail(
        component: json["__component"],
        id: json["id"],
        secHeader: json["sec_header"],
        contentBlock: json["content_block"] == null
            ? []
            : List<ContentBlock>.from(
                json["content_block"]!.map((x) => ContentBlock.fromJson(x))),
        bodyText: json["bodyText"] == null
            ? []
            : List<BodyText>.from(
                json["bodyText"]!.map((x) => BodyText.fromJson(x))),
        secDescription: json["sec_description"],
        headerColorIdentifier: json["header_colorIdentifier"],
      );

  Map<String, dynamic> toJson() => {
        "__component": component,
        "id": id,
        "sec_header": secHeader,
        "content_block": contentBlock == null
            ? []
            : List<dynamic>.from(contentBlock!.map((x) => x.toJson())),
        "bodyText": bodyText == null
            ? []
            : List<dynamic>.from(bodyText!.map((x) => x.toJson())),
        "sec_description": secDescription,
        "header_colorIdentifier": headerColorIdentifier,
      };
}

class BodyText {
  final int? id;
  final String? text;

  BodyText({
    this.id,
    this.text,
  });

  factory BodyText.fromJson(Map<String, dynamic> json) => BodyText(
        id: json["id"],
        text: json["text"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "text": text,
      };
}

class ContentBlock {
  final int? id;
  final String? secHeader;
  final String? secDescription;
  final String? headerColorIdentifier;

  ContentBlock({
    this.id,
    this.secHeader,
    this.secDescription,
    this.headerColorIdentifier,
  });

  factory ContentBlock.fromJson(Map<String, dynamic> json) => ContentBlock(
        id: json["id"],
        secHeader: json["sec_header"],
        secDescription: json["sec_description"],
        headerColorIdentifier: json["header_colorIdentifier"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "sec_header": secHeader,
        "sec_description": secDescription,
        "header_colorIdentifier": headerColorIdentifier,
      };
}

class ZipCode {
  final int? id;
  final String? documentId;
  final String? name;
  final String? zipId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? publishedAt;
  final ZipCode? state;
  final String? steId;
  final Country? country;

  ZipCode({
    this.id,
    this.documentId,
    this.name,
    this.zipId,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.state,
    this.steId,
    this.country,
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
        state: json["state"] == null ? null : ZipCode.fromJson(json["state"]),
        steId: json["ste_id"],
        country:
            json["country"] == null ? null : Country.fromJson(json["country"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "documentId": documentId,
        "name": name,
        "zip_id": zipId,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "publishedAt": publishedAt?.toIso8601String(),
        "state": state?.toJson(),
        "ste_id": steId,
        "country": country?.toJson(),
      };
}

class Country {
  final int? id;
  final String? documentId;
  final String? text;
  final String? locId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? publishedAt;

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

class Meta {
  Meta();

  factory Meta.fromJson(Map<String, dynamic> json) => Meta();

  Map<String, dynamic> toJson() => {};
}
