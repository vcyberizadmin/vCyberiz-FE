// To parse this JSON data, do
//
//     final privacyModel = privacyModelFromJson(jsonString);

import 'dart:convert';

PrivacyModel privacyModelFromJson(String str) =>
    PrivacyModel.fromJson(json.decode(str));

String privacyModelToJson(PrivacyModel data) => json.encode(data.toJson());

class PrivacyModel {
  PrivacyData? data;
  Meta? meta;

  PrivacyModel({
    this.data,
    this.meta,
  });

  factory PrivacyModel.fromJson(Map<String, dynamic> json) => PrivacyModel(
        data: json["data"] == null ? null : PrivacyData.fromJson(json["data"]),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "meta": meta?.toJson(),
      };
}

class PrivacyData {
  int? id;
  String? documentId;
  String? secHeader;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? publishedAt;
  List<PrivacyPolicyList>? privacyPolicy;

  PrivacyData({
    this.id,
    this.documentId,
    this.secHeader,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.privacyPolicy,
  });

  factory PrivacyData.fromJson(Map<String, dynamic> json) => PrivacyData(
        id: json["id"],
        documentId: json["documentId"],
        secHeader: json["sec_header"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        publishedAt: json["publishedAt"] == null
            ? null
            : DateTime.parse(json["publishedAt"]),
        privacyPolicy: json["Privacy_Policy"] == null
            ? []
            : List<PrivacyPolicyList>.from(json["Privacy_Policy"]!
                .map((x) => PrivacyPolicyList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "documentId": documentId,
        "sec_header": secHeader,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "publishedAt": publishedAt?.toIso8601String(),
        "Privacy_Policy": privacyPolicy == null
            ? []
            : List<dynamic>.from(privacyPolicy!.map((x) => x.toJson())),
      };
}

class PrivacyPolicyList {
  int? id;
  String? privPolicyPointsHd;
  String? privPolicyPointsCont;
  List<dynamic>? privPolicyPointsList;
  List<PrivPolicySubPoint>? privPolicySubPoints;

  PrivacyPolicyList({
    this.id,
    this.privPolicyPointsHd,
    this.privPolicyPointsCont,
    this.privPolicyPointsList,
    this.privPolicySubPoints,
  });

  factory PrivacyPolicyList.fromJson(Map<String, dynamic> json) =>
      PrivacyPolicyList(
        id: json["id"],
        privPolicyPointsHd: json["Priv_Policy_Points_hd"],
        privPolicyPointsCont: json["Priv_Policy_Points_Cont"],
        privPolicyPointsList: json["Priv_Policy_Points_List"] == null
            ? []
            : List<dynamic>.from(
                json["Priv_Policy_Points_List"]!.map((x) => x)),
        privPolicySubPoints: json["Priv_Policy_Sub_Points"] == null
            ? []
            : List<PrivPolicySubPoint>.from(json["Priv_Policy_Sub_Points"]!
                .map((x) => PrivPolicySubPoint.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "Priv_Policy_Points_hd": privPolicyPointsHd,
        "Priv_Policy_Points_Cont": privPolicyPointsCont,
        "Priv_Policy_Points_List": privPolicyPointsList == null
            ? []
            : List<dynamic>.from(privPolicyPointsList!.map((x) => x)),
        "Priv_Policy_Sub_Points": privPolicySubPoints == null
            ? []
            : List<dynamic>.from(privPolicySubPoints!.map((x) => x.toJson())),
      };
}

class PrivPolicySubPoint {
  int? id;
  String? privPolicySubHd;
  String? privPolicySubCont;
  List<PrivPolicySubList>? privPolicySubList;

  PrivPolicySubPoint({
    this.id,
    this.privPolicySubHd,
    this.privPolicySubCont,
    this.privPolicySubList,
  });

  factory PrivPolicySubPoint.fromJson(Map<String, dynamic> json) =>
      PrivPolicySubPoint(
        id: json["id"],
        privPolicySubHd: json["Priv_Policy_Sub_Hd"],
        privPolicySubCont: json["Priv_Policy_Sub_Cont"],
        privPolicySubList: json["Priv_Policy_Sub_List"] == null
            ? []
            : List<PrivPolicySubList>.from(json["Priv_Policy_Sub_List"]!
                .map((x) => PrivPolicySubList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "Priv_Policy_Sub_Hd": privPolicySubHd,
        "Priv_Policy_Sub_Cont": privPolicySubCont,
        "Priv_Policy_Sub_List": privPolicySubList == null
            ? []
            : List<dynamic>.from(privPolicySubList!.map((x) => x.toJson())),
      };
}

class PrivPolicySubList {
  int? id;
  String? text;

  PrivPolicySubList({
    this.id,
    this.text,
  });

  factory PrivPolicySubList.fromJson(Map<String, dynamic> json) =>
      PrivPolicySubList(
        id: json["id"],
        text: json["text"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "text": text,
      };
}

class Meta {
  Meta();

  factory Meta.fromJson(Map<String, dynamic> json) => Meta();

  Map<String, dynamic> toJson() => {};
}
