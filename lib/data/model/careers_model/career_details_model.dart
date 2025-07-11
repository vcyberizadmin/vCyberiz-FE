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
  final String? jpId;
  final bool? bookmarkIdentifier;
  final String? globalUrl;
  final List<JobDescription>? jobDescription;
  final String? team;
  final String? experience;
  final String? jobLocation;
  final String? shift;
  final List<EmploymentType>? skills;
  final List<EmploymentType>? employmentTypes;
  final List<Country>? countries;
  final dynamic zipCode;

  CareerData({
    this.id,
    this.documentId,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.secHeader,
    this.secDescription,
    this.jpId,
    this.bookmarkIdentifier,
    this.globalUrl,
    this.jobDescription,
    this.team,
    this.experience,
    this.jobLocation,
    this.shift,
    this.skills,
    this.employmentTypes,
    this.countries,
    this.zipCode,
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
        jpId: json["jp_id"],
        bookmarkIdentifier: json["bookmark_identifier"],
        globalUrl: json["global_url"],
        jobDescription: json["job_description"] == null
            ? []
            : List<JobDescription>.from(json["job_description"]!
                .map((x) => JobDescription.fromJson(x))),
        team: json["team"],
        experience: json["experience"],
        jobLocation: json["job_location"],
        shift: json["shift"],
        skills: json["skills"] == null
            ? []
            : List<EmploymentType>.from(
                json["skills"]!.map((x) => EmploymentType.fromJson(x))),
        employmentTypes: json["employment_types"] == null
            ? []
            : List<EmploymentType>.from(json["employment_types"]!
                .map((x) => EmploymentType.fromJson(x))),
        countries: json["countries"] == null
            ? []
            : List<Country>.from(
                json["countries"]!.map((x) => Country.fromJson(x))),
        zipCode: json["zip_code"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "documentId": documentId,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "publishedAt": publishedAt?.toIso8601String(),
        "sec_header": secHeader,
        "sec_description": secDescription,
        "jp_id": jpId,
        "bookmark_identifier": bookmarkIdentifier,
        "global_url": globalUrl,
        "job_description": jobDescription == null
            ? []
            : List<dynamic>.from(jobDescription!.map((x) => x.toJson())),
        "team": team,
        "experience": experience,
        "job_location": jobLocation,
        "shift": shift,
        "skills": skills == null
            ? []
            : List<dynamic>.from(skills!.map((x) => x.toJson())),
        "employment_types": employmentTypes == null
            ? []
            : List<dynamic>.from(employmentTypes!.map((x) => x.toJson())),
        "countries": countries == null
            ? []
            : List<dynamic>.from(countries!.map((x) => x.toJson())),
        "zip_code": zipCode,
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

class JobDescription {
  final String? type;
  final List<JobDescriptionChild>? children;
  final String? format;

  JobDescription({
    this.type,
    this.children,
    this.format,
  });

  factory JobDescription.fromJson(Map<String, dynamic> json) => JobDescription(
        type: json["type"],
        children: json["children"] == null
            ? []
            : List<JobDescriptionChild>.from(
                json["children"]!.map((x) => JobDescriptionChild.fromJson(x))),
        format: json["format"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "children": children == null
            ? []
            : List<dynamic>.from(children!.map((x) => x.toJson())),
        "format": format,
      };
}

class JobDescriptionChild {
  final bool? bold;
  final String? text;
  final Type? type;
  final List<ChildChild>? children;

  JobDescriptionChild({
    this.bold,
    this.text,
    this.type,
    this.children,
  });

  factory JobDescriptionChild.fromJson(Map<String, dynamic> json) =>
      JobDescriptionChild(
        bold: json["bold"],
        text: json["text"],
        type: typeValues.map[json["type"]]!,
        children: json["children"] == null
            ? []
            : List<ChildChild>.from(
                json["children"]!.map((x) => ChildChild.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "bold": bold,
        "text": text,
        "type": typeValues.reverse[type],
        "children": children == null
            ? []
            : List<dynamic>.from(children!.map((x) => x.toJson())),
      };
}

class ChildChild {
  final String? text;
  final Type? type;

  ChildChild({
    this.text,
    this.type,
  });

  factory ChildChild.fromJson(Map<String, dynamic> json) => ChildChild(
        text: json["text"],
        type: typeValues.map[json["type"]]!,
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "type": typeValues.reverse[type],
      };
}

enum Type { LIST_ITEM, TEXT }

final typeValues = EnumValues({"list-item": Type.LIST_ITEM, "text": Type.TEXT});

class Meta {
  Meta();

  factory Meta.fromJson(Map<String, dynamic> json) => Meta();

  Map<String, dynamic> toJson() => {};
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
