// To parse this JSON data, do
//
//     final footerModel = footerModelFromJson(jsonString);

import 'dart:convert';

FooterModel footerModelFromJson(String str) =>
    FooterModel.fromJson(json.decode(str));

String footerModelToJson(FooterModel data) => json.encode(data.toJson());

class FooterModel {
  FooterData? data;
  Meta? meta;

  FooterModel({
    this.data,
    this.meta,
  });

  factory FooterModel.fromJson(Map<String, dynamic> json) => FooterModel(
        data: json["data"] == null ? null : FooterData.fromJson(json["data"]),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "meta": meta?.toJson(),
      };
}

class FooterData {
  int? id;
  String? documentId;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? publishedAt;
  TryUs? tryUs;
  SiteMap? siteMap;
  TermsAndPolicies? termsAndPolicies;
  Subscribe? subscribe;

  FooterData({
    this.id,
    this.documentId,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.tryUs,
    this.siteMap,
    this.termsAndPolicies,
    this.subscribe,
  });

  factory FooterData.fromJson(Map<String, dynamic> json) => FooterData(
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
        tryUs: json["tryUs"] == null ? null : TryUs.fromJson(json["tryUs"]),
        siteMap:
            json["siteMap"] == null ? null : SiteMap.fromJson(json["siteMap"]),
        termsAndPolicies: json["termsAndPolicies"] == null
            ? null
            : TermsAndPolicies.fromJson(json["termsAndPolicies"]),
        subscribe: json["subscribe"] == null
            ? null
            : Subscribe.fromJson(json["subscribe"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "documentId": documentId,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "publishedAt": publishedAt?.toIso8601String(),
        "tryUs": tryUs?.toJson(),
        "siteMap": siteMap?.toJson(),
        "termsAndPolicies": termsAndPolicies?.toJson(),
        "subscribe": subscribe?.toJson(),
      };
}

class SiteMap {
  int? id;
  String? connectHeader;
  Brand? brand;
  List<Brand>? connect;
  Company? platform;
  Company? company;
  WithUs? withUs;

  SiteMap({
    this.id,
    this.connectHeader,
    this.brand,
    this.connect,
    this.platform,
    this.company,
    this.withUs,
  });

  factory SiteMap.fromJson(Map<String, dynamic> json) => SiteMap(
        id: json["id"],
        connectHeader: json["connect_header"],
        brand: json["brand"] == null ? null : Brand.fromJson(json["brand"]),
        connect: json["connect"] == null
            ? []
            : List<Brand>.from(json["connect"]!.map((x) => Brand.fromJson(x))),
        platform: json["platform"] == null
            ? null
            : Company.fromJson(json["platform"]),
        company:
            json["company"] == null ? null : Company.fromJson(json["company"]),
        withUs: json["withUs"] == null ? null : WithUs.fromJson(json["withUs"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "connect_header": connectHeader,
        "brand": brand?.toJson(),
        "connect": connect == null
            ? []
            : List<dynamic>.from(connect!.map((x) => x.toJson())),
        "platform": platform?.toJson(),
        "company": company?.toJson(),
        "withUs": withUs?.toJson(),
      };
}

class Brand {
  int? id;
  Cta? link;
  List<SecLogo>? secLogo;

  Brand({
    this.id,
    this.link,
    this.secLogo,
  });

  factory Brand.fromJson(Map<String, dynamic> json) => Brand(
        id: json["id"],
        link: json["link"] == null ? null : Cta.fromJson(json["link"]),
        secLogo: json["sec_logo"] == null
            ? []
            : List<SecLogo>.from(
                json["sec_logo"]!.map((x) => SecLogo.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "link": link?.toJson(),
        "sec_logo": secLogo == null
            ? []
            : List<dynamic>.from(secLogo!.map((x) => x.toJson())),
      };
}

class Cta {
  int? id;
  String? label;
  String? href;
  bool? isExternal;
  String? type;

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

class SecLogo {
  int? id;
  String? url;
  String? name;
  String? mime;
  String? label;

  SecLogo({
    this.id,
    this.url,
    this.name,
    this.mime,
    this.label,
  });

  factory SecLogo.fromJson(Map<String, dynamic> json) => SecLogo(
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

class Company {
  int? id;
  WithUs? referencesMap;
  Cta? cta;

  Company({
    this.id,
    this.referencesMap,
    this.cta,
  });

  factory Company.fromJson(Map<String, dynamic> json) => Company(
        id: json["id"],
        referencesMap: json["referencesMap"] == null
            ? null
            : WithUs.fromJson(json["referencesMap"]),
        cta: json["cta"] == null ? null : Cta.fromJson(json["cta"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "referencesMap": referencesMap?.toJson(),
        "cta": cta?.toJson(),
      };
}

class WithUs {
  int? id;
  String? label;
  List<Cta>? references;

  WithUs({
    this.id,
    this.label,
    this.references,
  });

  factory WithUs.fromJson(Map<String, dynamic> json) => WithUs(
        id: json["id"],
        label: json["label"],
        references: json["references"] == null
            ? []
            : List<Cta>.from(json["references"]!.map((x) => Cta.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "label": label,
        "references": references == null
            ? []
            : List<dynamic>.from(references!.map((x) => x.toJson())),
      };
}

class Subscribe {
  int? id;
  String? title;
  dynamic emailAddress;
  String? btnTitle;

  Subscribe({
    this.id,
    this.title,
    this.emailAddress,
    this.btnTitle,
  });

  factory Subscribe.fromJson(Map<String, dynamic> json) => Subscribe(
        id: json["id"],
        title: json["title"],
        emailAddress: json["email_address"],
        btnTitle: json["btnTitle"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "email_address": emailAddress,
        "btnTitle": btnTitle,
      };
}

class TermsAndPolicies {
  int? id;
  List<Cta>? references;

  TermsAndPolicies({
    this.id,
    this.references,
  });

  factory TermsAndPolicies.fromJson(Map<String, dynamic> json) =>
      TermsAndPolicies(
        id: json["id"],
        references: json["references"] == null
            ? []
            : List<Cta>.from(json["references"]!.map((x) => Cta.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "references": references == null
            ? []
            : List<dynamic>.from(references!.map((x) => x.toJson())),
      };
}

class TryUs {
  int? id;
  String? title;
  String? description;
  Cta? cta;
  List<SecLogo>? secLogo;

  TryUs({
    this.id,
    this.title,
    this.description,
    this.cta,
    this.secLogo,
  });

  factory TryUs.fromJson(Map<String, dynamic> json) => TryUs(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        cta: json["cta"] == null ? null : Cta.fromJson(json["cta"]),
        secLogo: json["sec_logo"] == null
            ? []
            : List<SecLogo>.from(
                json["sec_logo"]!.map((x) => SecLogo.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "cta": cta?.toJson(),
        "sec_logo": secLogo == null
            ? []
            : List<dynamic>.from(secLogo!.map((x) => x.toJson())),
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
