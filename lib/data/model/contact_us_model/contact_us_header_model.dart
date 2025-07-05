// To parse this JSON data, do
//
//     final contactUsHeaderModel = contactUsHeaderModelFromJson(jsonString);

import 'dart:convert';

ContactUsHeaderModel contactUsHeaderModelFromJson(String str) =>
    ContactUsHeaderModel.fromJson(json.decode(str));

String contactUsHeaderModelToJson(ContactUsHeaderModel data) =>
    json.encode(data.toJson());

class ContactUsHeaderModel {
  ContactUsHeaderData? data;
  Meta? meta;

  ContactUsHeaderModel({
    this.data,
    this.meta,
  });

  factory ContactUsHeaderModel.fromJson(Map<String, dynamic> json) =>
      ContactUsHeaderModel(
        data: json["data"] == null
            ? null
            : ContactUsHeaderData.fromJson(json["data"]),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "meta": meta?.toJson(),
      };
}

class ContactUsHeaderData {
  int? id;
  String? documentId;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? publishedAt;
  List<FormDatum>? formData;
  String? secDescription;
  dynamic formid;
  TextArea? textArea;
  SecBg? secBg;
  SecCta? secCta;

  ContactUsHeaderData({
    this.id,
    this.documentId,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.formData,
    this.secDescription,
    this.formid,
    this.textArea,
    this.secBg,
    this.secCta,
  });

  factory ContactUsHeaderData.fromJson(Map<String, dynamic> json) =>
      ContactUsHeaderData(
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
        formData: json["form_data"] == null
            ? []
            : List<FormDatum>.from(
                json["form_data"]!.map((x) => FormDatum.fromJson(x))),
        secDescription: json["sec_description"],
        formid: json["formid"],
        textArea: json["text_area"] == null
            ? null
            : TextArea.fromJson(json["text_area"]),
        secBg: json["sec_bg"] == null ? null : SecBg.fromJson(json["sec_bg"]),
        secCta:
            json["sec_cta"] == null ? null : SecCta.fromJson(json["sec_cta"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "documentId": documentId,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "publishedAt": publishedAt?.toIso8601String(),
        "form_data": formData == null
            ? []
            : List<dynamic>.from(formData!.map((x) => x.toJson())),
        "sec_description": secDescription,
        "formid": formid,
        "text_area": textArea?.toJson(),
        "sec_bg": secBg?.toJson(),
        "sec_cta": secCta?.toJson(),
      };
}

class FormDatum {
  String? name;
  String? type;
  String? label;
  bool? required;

  FormDatum({
    this.name,
    this.type,
    this.label,
    this.required,
  });

  factory FormDatum.fromJson(Map<String, dynamic> json) => FormDatum(
        name: json["name"],
        type: json["type"],
        label: json["label"],
        required: json["required"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "type": type,
        "label": label,
        "required": required,
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

class TextArea {
  int? id;
  String? secHeader;
  List<SecColorIdentifier>? secColorIdentifier;
  String? secDescription;

  TextArea({
    this.id,
    this.secHeader,
    this.secColorIdentifier,
    this.secDescription,
  });

  factory TextArea.fromJson(Map<String, dynamic> json) => TextArea(
        id: json["id"],
        secHeader: json["sec_header"],
        secColorIdentifier: json["sec_colorIdentifier"] == null
            ? []
            : List<SecColorIdentifier>.from(json["sec_colorIdentifier"]!
                .map((x) => SecColorIdentifier.fromJson(x))),
        secDescription: json["sec_description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "sec_header": secHeader,
        "sec_colorIdentifier": secColorIdentifier == null
            ? []
            : List<dynamic>.from(secColorIdentifier!.map((x) => x.toJson())),
        "sec_description": secDescription,
      };
}

class SecColorIdentifier {
  String? type;
  List<Child>? children;

  SecColorIdentifier({
    this.type,
    this.children,
  });

  factory SecColorIdentifier.fromJson(Map<String, dynamic> json) =>
      SecColorIdentifier(
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
