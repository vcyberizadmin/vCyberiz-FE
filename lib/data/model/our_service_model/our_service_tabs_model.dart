// To parse this JSON data, do
//
//     final serviceTabsModel = serviceTabsModelFromJson(jsonString);

import 'dart:convert';

ServiceTabsModel serviceTabsModelFromJson(String str) =>
    ServiceTabsModel.fromJson(json.decode(str));

String serviceTabsModelToJson(ServiceTabsModel data) =>
    json.encode(data.toJson());

class ServiceTabsModel {
  final ServiceTabsData? data;
  final Meta? meta;

  ServiceTabsModel({
    this.data,
    this.meta,
  });

  factory ServiceTabsModel.fromJson(Map<String, dynamic> json) =>
      ServiceTabsModel(
        data: json["data"] == null
            ? null
            : ServiceTabsData.fromJson(json["data"]),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "meta": meta?.toJson(),
      };
}

class ServiceTabsData {
  final int? id;
  final String? documentId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? publishedAt;
  final List<Section>? section;

  ServiceTabsData({
    this.id,
    this.documentId,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.section,
  });

  factory ServiceTabsData.fromJson(Map<String, dynamic> json) =>
      ServiceTabsData(
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
        section: json["section"] == null
            ? []
            : List<Section>.from(
                json["section"]!.map((x) => Section.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "documentId": documentId,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "publishedAt": publishedAt?.toIso8601String(),
        "section": section == null
            ? []
            : List<dynamic>.from(section!.map((x) => x.toJson())),
      };
}

class Section {
  final int? id;
  final TabBody? tabBody;
  final TabHead? tabHead;

  Section({
    this.id,
    this.tabBody,
    this.tabHead,
  });

  factory Section.fromJson(Map<String, dynamic> json) => Section(
        id: json["id"],
        tabBody: json["tab_body"] == null
            ? null
            : TabBody.fromJson(json["tab_body"]),
        tabHead: json["tab_head"] == null
            ? null
            : TabHead.fromJson(json["tab_head"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "tab_body": tabBody?.toJson(),
        "tab_head": tabHead?.toJson(),
      };
}

class TabBody {
  final int? id;
  final String? secHeader;
  final String? secDescription;
  final ImgUrl? imgUrl;
  final List<SubSection>? subSection;

  TabBody({
    this.id,
    this.secHeader,
    this.secDescription,
    this.imgUrl,
    this.subSection,
  });

  factory TabBody.fromJson(Map<String, dynamic> json) => TabBody(
        id: json["id"],
        secHeader: json["sec_header"],
        secDescription: json["sec_description"],
        imgUrl:
            json["img_url"] == null ? null : ImgUrl.fromJson(json["img_url"]),
        subSection: json["sub_section"] == null
            ? []
            : List<SubSection>.from(
                json["sub_section"]!.map((x) => SubSection.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "sec_header": secHeader,
        "sec_description": secDescription,
        "img_url": imgUrl?.toJson(),
        "sub_section": subSection == null
            ? []
            : List<dynamic>.from(subSection!.map((x) => x.toJson())),
      };
}

class ImgUrl {
  final int? id;
  final String? url;
  final String? name;
  final String? mime;
  final String? label;

  ImgUrl({
    this.id,
    this.url,
    this.name,
    this.mime,
    this.label,
  });

  factory ImgUrl.fromJson(Map<String, dynamic> json) => ImgUrl(
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

class SubSection {
  final int? id;
  final String? label;
  final SecCta? secCta;

  SubSection({
    this.id,
    this.label,
    this.secCta,
  });

  factory SubSection.fromJson(Map<String, dynamic> json) => SubSection(
        id: json["id"],
        label: json["label"],
        secCta:
            json["sec_cta"] == null ? null : SecCta.fromJson(json["sec_cta"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "label": label,
        "sec_cta": secCta?.toJson(),
      };
}

class SecCta {
  final int? id;
  final String? label;
  final String? href;
  final bool? isExternal;
  final String? type;

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

class TabHead {
  final int? id;
  final String? tabHeading;
  final String? tabId;
  final List<ColorIdentifier>? colorIdentifier;

  TabHead({
    this.id,
    this.tabHeading,
    this.tabId,
    this.colorIdentifier,
  });

  factory TabHead.fromJson(Map<String, dynamic> json) => TabHead(
        id: json["id"],
        tabHeading: json["tab_heading"],
        tabId: json["tab_id"],
        colorIdentifier: json["color_identifier"] == null
            ? []
            : List<ColorIdentifier>.from(json["color_identifier"]!
                .map((x) => ColorIdentifier.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "tab_heading": tabHeading,
        "tab_id": tabId,
        "color_identifier": colorIdentifier == null
            ? []
            : List<dynamic>.from(colorIdentifier!.map((x) => x.toJson())),
      };
}

class ColorIdentifier {
  final String? type;
  final List<Child>? children;

  ColorIdentifier({
    this.type,
    this.children,
  });

  factory ColorIdentifier.fromJson(Map<String, dynamic> json) =>
      ColorIdentifier(
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
  final String? text;
  final String? type;

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
