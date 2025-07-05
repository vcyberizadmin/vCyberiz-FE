// To parse this JSON data, do
//
//     final headerModel = headerModelFromJson(jsonString);

import 'dart:convert';

HeaderModel headerModelFromJson(String str) =>
    HeaderModel.fromJson(json.decode(str));

String headerModelToJson(HeaderModel data) => json.encode(data.toJson());

class HeaderModel {
  final HeaderData? data;
  final Meta? meta;

  HeaderModel({
    this.data,
    this.meta,
  });

  factory HeaderModel.fromJson(Map<String, dynamic> json) => HeaderModel(
        data: json["data"] == null ? null : HeaderData.fromJson(json["data"]),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "meta": meta?.toJson(),
      };
}

class HeaderData {
  final int? id;
  final String? documentId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? publishedAt;
  final Navs? navs;
  final BrandLogo? brandLogo;

  HeaderData({
    this.id,
    this.documentId,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.navs,
    this.brandLogo,
  });

  factory HeaderData.fromJson(Map<String, dynamic> json) => HeaderData(
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
        navs: json["navs"] == null ? null : Navs.fromJson(json["navs"]),
        brandLogo: json["brand_logo"] == null
            ? null
            : BrandLogo.fromJson(json["brand_logo"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "documentId": documentId,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "publishedAt": publishedAt?.toIso8601String(),
        "navs": navs?.toJson(),
        "brand_logo": brandLogo?.toJson(),
      };
}

class BrandLogo {
  final int? id;
  final String? url;
  final String? name;
  final String? mime;
  final String? label;

  BrandLogo({
    this.id,
    this.url,
    this.name,
    this.mime,
    this.label,
  });

  factory BrandLogo.fromJson(Map<String, dynamic> json) => BrandLogo(
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

class Navs {
  final int? id;
  final List<NavWithInnerPage>? navWithInnerPage;
  final Cta? cta;
  final List<Cta>? navigations;

  Navs({
    this.id,
    this.navWithInnerPage,
    this.cta,
    this.navigations,
  });

  factory Navs.fromJson(Map<String, dynamic> json) => Navs(
        id: json["id"],
        navWithInnerPage: json["nav_with_inner_page"] == null
            ? []
            : List<NavWithInnerPage>.from(json["nav_with_inner_page"]!
                .map((x) => NavWithInnerPage.fromJson(x))),
        cta: json["cta"] == null ? null : Cta.fromJson(json["cta"]),
        navigations: json["navigations"] == null
            ? []
            : List<Cta>.from(json["navigations"]!.map((x) => Cta.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nav_with_inner_page": navWithInnerPage == null
            ? []
            : List<dynamic>.from(navWithInnerPage!.map((x) => x.toJson())),
        "cta": cta?.toJson(),
        "navigations": navigations == null
            ? []
            : List<dynamic>.from(navigations!.map((x) => x.toJson())),
      };
}

class Cta {
  final int? id;
  final String? label;
  final String? href;
  final bool? isExternal;
  final Type? type;

  Cta({
    this.id,
    this.label,
    this.href,
    this.isExternal,
    this.type,
  });

  factory Cta.fromJson(Map<String, dynamic> json) => Cta(
        id: json["id"],
        label: json["label"],
        href: json["href"],
        isExternal: json["isExternal"],
        type: typeValues.map[json["type"]]!,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "label": label,
        "href": href,
        "isExternal": isExternal,
        "type": typeValues.reverse[type],
      };
}

enum Type { NORMAL, PRIMARY }

final typeValues = EnumValues({"NORMAL": Type.NORMAL, "PRIMARY": Type.PRIMARY});

class NavWithInnerPage {
  final int? id;
  final String? secHeader;
  final String? colorIdentifier1;
  final String? colorIdentifier2;
  final List<NavSubCard>? navSubCard;

  NavWithInnerPage({
    this.id,
    this.secHeader,
    this.colorIdentifier1,
    this.colorIdentifier2,
    this.navSubCard,
  });

  factory NavWithInnerPage.fromJson(Map<String, dynamic> json) =>
      NavWithInnerPage(
        id: json["id"],
        secHeader: json["sec_header"],
        colorIdentifier1: json["color_identifier_1"],
        colorIdentifier2: json["color_identifier_2"],
        navSubCard: json["nav_sub_card"] == null
            ? []
            : List<NavSubCard>.from(
                json["nav_sub_card"]!.map((x) => NavSubCard.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "sec_header": secHeader,
        "color_identifier_1": colorIdentifier1,
        "color_identifier_2": colorIdentifier2,
        "nav_sub_card": navSubCard == null
            ? []
            : List<dynamic>.from(navSubCard!.map((x) => x.toJson())),
      };
}

class NavSubCard {
  final int? id;
  final String? secSubHeader;
  final List<SecSubCard>? secSubCard;

  NavSubCard({
    this.id,
    this.secSubHeader,
    this.secSubCard,
  });

  factory NavSubCard.fromJson(Map<String, dynamic> json) => NavSubCard(
        id: json["id"],
        secSubHeader: json["sec_sub_header"],
        secSubCard: json["sec_sub_card"] == null
            ? []
            : List<SecSubCard>.from(
                json["sec_sub_card"]!.map((x) => SecSubCard.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "sec_sub_header": secSubHeader,
        "sec_sub_card": secSubCard == null
            ? []
            : List<dynamic>.from(secSubCard!.map((x) => x.toJson())),
      };
}

class SecSubCard {
  final int? id;
  final String? secLabel;
  final List<Cta>? secCta;

  SecSubCard({
    this.id,
    this.secLabel,
    this.secCta,
  });

  factory SecSubCard.fromJson(Map<String, dynamic> json) => SecSubCard(
        id: json["id"],
        secLabel: json["sec_label"],
        secCta: json["sec_cta"] == null
            ? []
            : List<Cta>.from(json["sec_cta"]!.map((x) => Cta.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "sec_label": secLabel,
        "sec_cta": secCta == null
            ? []
            : List<dynamic>.from(secCta!.map((x) => x.toJson())),
      };
}

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
