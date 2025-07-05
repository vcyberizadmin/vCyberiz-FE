// To parse this JSON data, do
//
//     final careerListModel = careerListModelFromJson(jsonString);

import 'dart:convert';

CareerListModel careerListModelFromJson(String str) =>
    CareerListModel.fromJson(json.decode(str));

String careerListModelToJson(CareerListModel data) =>
    json.encode(data.toJson());

class CareerListModel {
  final List<CareerListData>? data;
  final Meta? meta;

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
  final ZipCode? zipCode;

  CareerListData({
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
        "zip_code": zipCode?.toJson(),
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
  final JobDescriptionType? type;
  final List<JobDescriptionChild>? children;
  final String? format;

  JobDescription({
    this.type,
    this.children,
    this.format,
  });

  factory JobDescription.fromJson(Map<String, dynamic> json) => JobDescription(
        type: jobDescriptionTypeValues.map[json["type"]]!,
        children: json["children"] == null
            ? []
            : List<JobDescriptionChild>.from(
                json["children"]!.map((x) => JobDescriptionChild.fromJson(x))),
        format: json["format"],
      );

  Map<String, dynamic> toJson() => {
        "type": jobDescriptionTypeValues.reverse[type],
        "children": children == null
            ? []
            : List<dynamic>.from(children!.map((x) => x.toJson())),
        "format": format,
      };
}

class JobDescriptionChild {
  final bool? bold;
  final String? text;
  final ChildType? type;
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
        type: childTypeValues.map[json["type"]]!,
        children: json["children"] == null
            ? []
            : List<ChildChild>.from(
                json["children"]!.map((x) => ChildChild.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "bold": bold,
        "text": text,
        "type": childTypeValues.reverse[type],
        "children": children == null
            ? []
            : List<dynamic>.from(children!.map((x) => x.toJson())),
      };
}

class ChildChild {
  final String? text;
  final ChildType? type;

  ChildChild({
    this.text,
    this.type,
  });

  factory ChildChild.fromJson(Map<String, dynamic> json) => ChildChild(
        text: json["text"],
        type: childTypeValues.map[json["type"]]!,
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "type": childTypeValues.reverse[type],
      };
}

enum ChildType { LIST_ITEM, TEXT }

final childTypeValues =
    EnumValues({"list-item": ChildType.LIST_ITEM, "text": ChildType.TEXT});

enum JobDescriptionType { LIST, PARAGRAPH }

final jobDescriptionTypeValues = EnumValues({
  "list": JobDescriptionType.LIST,
  "paragraph": JobDescriptionType.PARAGRAPH
});

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
  final Pagination? pagination;

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
  final int? page;
  final int? pageSize;
  final int? pageCount;
  final int? total;

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
