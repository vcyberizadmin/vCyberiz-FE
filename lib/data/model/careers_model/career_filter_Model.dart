// To parse this JSON data, do
//
//     final careerFilterModel = careerFilterModelFromJson(jsonString);

import 'dart:convert';

CareerFilterModel careerFilterModelFromJson(String str) =>
    CareerFilterModel.fromJson(json.decode(str));

String careerFilterModelToJson(CareerFilterModel data) =>
    json.encode(data.toJson());

class CareerFilterModel {
  CareerFilterData? data;
  Meta? meta;

  CareerFilterModel({
    this.data,
    this.meta,
  });

  factory CareerFilterModel.fromJson(Map<String, dynamic> json) =>
      CareerFilterModel(
        data: json["data"] == null
            ? null
            : CareerFilterData.fromJson(json["data"]),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "meta": meta?.toJson(),
      };
}

class CareerFilterData {
  int? id;
  String? documentId;
  String? secDescription;
  List<Form>? form;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? publishedAt;
  SecHeaderLogo? secHeaderLogo;
  List<FormFieldIcon>? formFieldIcons;
  List<SecBody>? secBody;
  List<SecButton>? secButtons;

  CareerFilterData({
    this.id,
    this.documentId,
    this.secDescription,
    this.form,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.secHeaderLogo,
    this.formFieldIcons,
    this.secBody,
    this.secButtons,
  });

  factory CareerFilterData.fromJson(Map<String, dynamic> json) =>
      CareerFilterData(
        id: json["id"],
        documentId: json["documentId"],
        secDescription: json["sec_description"],
        form: json["form"] == null
            ? []
            : List<Form>.from(json["form"]!.map((x) => Form.fromJson(x))),
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        publishedAt: json["publishedAt"] == null
            ? null
            : DateTime.parse(json["publishedAt"]),
        secHeaderLogo: json["sec_headerLogo"] == null
            ? null
            : SecHeaderLogo.fromJson(json["sec_headerLogo"]),
        formFieldIcons: json["form_field_icons"] == null
            ? []
            : List<FormFieldIcon>.from(json["form_field_icons"]!
                .map((x) => FormFieldIcon.fromJson(x))),
        secBody: json["sec_body"] == null
            ? []
            : List<SecBody>.from(
                json["sec_body"]!.map((x) => SecBody.fromJson(x))),
        secButtons: json["sec_buttons"] == null
            ? []
            : List<SecButton>.from(
                json["sec_buttons"]!.map((x) => SecButton.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "documentId": documentId,
        "sec_description": secDescription,
        "form": form == null
            ? []
            : List<dynamic>.from(form!.map((x) => x.toJson())),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "publishedAt": publishedAt?.toIso8601String(),
        "sec_headerLogo": secHeaderLogo?.toJson(),
        "form_field_icons": formFieldIcons == null
            ? []
            : List<dynamic>.from(formFieldIcons!.map((x) => x.toJson())),
        "sec_body": secBody == null
            ? []
            : List<dynamic>.from(secBody!.map((x) => x.toJson())),
        "sec_buttons": secButtons == null
            ? []
            : List<dynamic>.from(secButtons!.map((x) => x.toJson())),
      };
}

class Form {
  String? id;
  String? name;
  String? type;
  String? label;

  Form({
    this.id,
    this.name,
    this.type,
    this.label,
  });

  factory Form.fromJson(Map<String, dynamic> json) => Form(
        id: json["id"],
        name: json["name"],
        type: json["type"],
        label: json["label"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "type": type,
        "label": label,
      };
}

class FormFieldIcon {
  int? id;
  String? fieldId;
  SecHeaderLogo? fieldIcon;

  FormFieldIcon({
    this.id,
    this.fieldId,
    this.fieldIcon,
  });

  factory FormFieldIcon.fromJson(Map<String, dynamic> json) => FormFieldIcon(
        id: json["id"],
        fieldId: json["field_id"],
        fieldIcon: json["field_icon"] == null
            ? null
            : SecHeaderLogo.fromJson(json["field_icon"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "field_id": fieldId,
        "field_icon": fieldIcon?.toJson(),
      };
}

class SecHeaderLogo {
  int? id;
  String? url;
  String? name;
  String? mime;
  String? label;

  SecHeaderLogo({
    this.id,
    this.url,
    this.name,
    this.mime,
    this.label,
  });

  factory SecHeaderLogo.fromJson(Map<String, dynamic> json) => SecHeaderLogo(
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

class SecBody {
  int? id;
  String? secHeader;
  List<SecItem>? secItems;
  List<SecHeaderLogo>? secLogo;

  SecBody({
    this.id,
    this.secHeader,
    this.secItems,
    this.secLogo,
  });

  factory SecBody.fromJson(Map<String, dynamic> json) => SecBody(
        id: json["id"],
        secHeader: json["sec_header"],
        secItems: json["sec_items"] == null
            ? []
            : List<SecItem>.from(
                json["sec_items"]!.map((x) => SecItem.fromJson(x))),
        secLogo: json["sec_logo"] == null
            ? []
            : List<SecHeaderLogo>.from(
                json["sec_logo"]!.map((x) => SecHeaderLogo.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "sec_header": secHeader,
        "sec_items": secItems == null
            ? []
            : List<dynamic>.from(secItems!.map((x) => x.toJson())),
        "sec_logo": secLogo == null
            ? []
            : List<dynamic>.from(secLogo!.map((x) => x.toJson())),
      };
}

class SecItem {
  int? id;
  String? secText;

  SecItem({
    this.id,
    this.secText,
  });

  factory SecItem.fromJson(Map<String, dynamic> json) => SecItem(
        id: json["id"],
        secText: json["sec_text"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "sec_text": secText,
      };
}

class SecButton {
  int? id;
  String? label;
  String? href;
  bool? isExternal;
  String? type;

  SecButton({
    this.id,
    this.label,
    this.href,
    this.isExternal,
    this.type,
  });

  factory SecButton.fromJson(Map<String, dynamic> json) => SecButton(
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
  Meta();

  factory Meta.fromJson(Map<String, dynamic> json) => Meta();

  Map<String, dynamic> toJson() => {};
}
