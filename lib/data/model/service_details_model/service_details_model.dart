// To parse this JSON data, do
//
//     final serviceDetailsModel = serviceDetailsModelFromJson(jsonString);

import 'dart:convert';

ServiceDetailsModel serviceDetailsModelFromJson(String str) =>
    ServiceDetailsModel.fromJson(json.decode(str));

String serviceDetailsModelToJson(ServiceDetailsModel data) =>
    json.encode(data.toJson());

class ServiceDetailsModel {
  final ServiceDetailsData? data;
  final Meta? meta;

  ServiceDetailsModel({
    this.data,
    this.meta,
  });

  factory ServiceDetailsModel.fromJson(Map<String, dynamic> json) =>
      ServiceDetailsModel(
        data: json["data"] == null
            ? null
            : ServiceDetailsData.fromJson(json["data"]),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "meta": meta?.toJson(),
      };
}

class ServiceDetailsData {
  final int? id;
  final String? documentId;
  final String? title;
  final String? pageId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? publishedAt;
  final bool? serviceOfferingIsRequired;
  final String? globalUrl;
  final bool? innerPageIsRequired;
  final String? searchDescription;
  final List<InnerPage>? innerPage;

  ServiceDetailsData({
    this.id,
    this.documentId,
    this.title,
    this.pageId,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.serviceOfferingIsRequired,
    this.globalUrl,
    this.innerPageIsRequired,
    this.searchDescription,
    this.innerPage,
  });

  factory ServiceDetailsData.fromJson(Map<String, dynamic> json) =>
      ServiceDetailsData(
        id: json["id"],
        documentId: json["documentId"],
        title: json["title"],
        pageId: json["page_id"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        publishedAt: json["publishedAt"] == null
            ? null
            : DateTime.parse(json["publishedAt"]),
        serviceOfferingIsRequired: json["Service_Offering_isRequired"],
        globalUrl: json["global_url"],
        innerPageIsRequired: json["inner_page_isRequired"],
        searchDescription: json["search_description"],
        innerPage: json["inner_page"] == null
            ? []
            : List<InnerPage>.from(
                json["inner_page"]!.map((x) => InnerPage.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "documentId": documentId,
        "title": title,
        "page_id": pageId,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "publishedAt": publishedAt?.toIso8601String(),
        "Service_Offering_isRequired": serviceOfferingIsRequired,
        "global_url": globalUrl,
        "inner_page_isRequired": innerPageIsRequired,
        "search_description": searchDescription,
        "inner_page": innerPage == null
            ? []
            : List<dynamic>.from(innerPage!.map((x) => x.toJson())),
      };
}

class InnerPage {
  final String? component;
  final int? id;
  final SecBanner? secBanner;
  final String? secHeader;
  final String? secDescription;
  final SecImg? secImg;
  final List<SecAccordion>? secAccordion;
  final List<SecImg>? secBgImg;
  final List<SecCard>? secCard;
  final List<SecImg>? bgImg;
  final dynamic secLabel;
  final String? secondaryVideoUrl;
  final SecCta? secCta;

  InnerPage({
    this.component,
    this.id,
    this.secBanner,
    this.secHeader,
    this.secDescription,
    this.secImg,
    this.secAccordion,
    this.secBgImg,
    this.secCard,
    this.bgImg,
    this.secLabel,
    this.secondaryVideoUrl,
    this.secCta,
  });

  factory InnerPage.fromJson(Map<String, dynamic> json) => InnerPage(
        component: json["__component"],
        id: json["id"],
        secBanner: json["sec_banner"] == null
            ? null
            : SecBanner.fromJson(json["sec_banner"]),
        secHeader: json["sec_header"],
        secDescription: json["sec_description"],
        secImg:
            json["sec_img"] == null ? null : SecImg.fromJson(json["sec_img"]),
        secAccordion: json["sec_accordion"] == null
            ? []
            : List<SecAccordion>.from(
                json["sec_accordion"]!.map((x) => SecAccordion.fromJson(x))),
        secBgImg: json["sec_bg_img"] == null
            ? []
            : List<SecImg>.from(
                json["sec_bg_img"]!.map((x) => SecImg.fromJson(x))),
        secCard: json["sec_card"] == null
            ? []
            : List<SecCard>.from(
                json["sec_card"]!.map((x) => SecCard.fromJson(x))),
        bgImg: json["bg_img"] == null
            ? []
            : List<SecImg>.from(json["bg_img"]!.map((x) => SecImg.fromJson(x))),
        secLabel: json["sec_label"],
        secondaryVideoUrl: json["secondary_video_url"],
        secCta:
            json["sec_cta"] == null ? null : SecCta.fromJson(json["sec_cta"]),
      );

  Map<String, dynamic> toJson() => {
        "__component": component,
        "id": id,
        "sec_banner": secBanner?.toJson(),
        "sec_header": secHeader,
        "sec_description": secDescription,
        "sec_img": secImg?.toJson(),
        "sec_accordion": secAccordion == null
            ? []
            : List<dynamic>.from(secAccordion!.map((x) => x.toJson())),
        "sec_bg_img": secBgImg == null
            ? []
            : List<dynamic>.from(secBgImg!.map((x) => x.toJson())),
        "sec_card": secCard == null
            ? []
            : List<dynamic>.from(secCard!.map((x) => x.toJson())),
        "bg_img": bgImg == null
            ? []
            : List<dynamic>.from(bgImg!.map((x) => x.toJson())),
        "sec_label": secLabel,
        "secondary_video_url": secondaryVideoUrl,
        "sec_cta": secCta?.toJson(),
      };
}

class SecImg {
  final int? id;
  final String? url;
  final String? name;
  final Mime? mime;
  final String? label;

  SecImg({
    this.id,
    this.url,
    this.name,
    this.mime,
    this.label,
  });

  factory SecImg.fromJson(Map<String, dynamic> json) => SecImg(
        id: json["id"],
        url: json["url"],
        name: json["name"],
        mime: mimeValues.map[json["mime"]]!,
        label: json["label"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
        "name": name,
        "mime": mimeValues.reverse[mime],
        "label": label,
      };
}

enum Mime { IMG_PNG, VIDEO_AV1 }

final mimeValues =
    EnumValues({"img/png": Mime.IMG_PNG, "video/AV1": Mime.VIDEO_AV1});

class SecAccordion {
  final int? id;
  final dynamic secHeader;
  final String? secDescription;

  SecAccordion({
    this.id,
    this.secHeader,
    this.secDescription,
  });

  factory SecAccordion.fromJson(Map<String, dynamic> json) => SecAccordion(
        id: json["id"],
        secHeader: json["sec_header"],
        secDescription: json["sec_description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "sec_header": secHeader,
        "sec_description": secDescription,
      };
}

class SecBanner {
  final int? id;
  final String? secLabel;
  final String? secHeader;
  final String? secDescription;
  final dynamic secondaryVideoUrl;
  final SecImg? secImg;
  final SecCta? secCta;

  SecBanner({
    this.id,
    this.secLabel,
    this.secHeader,
    this.secDescription,
    this.secondaryVideoUrl,
    this.secImg,
    this.secCta,
  });

  factory SecBanner.fromJson(Map<String, dynamic> json) => SecBanner(
        id: json["id"],
        secLabel: json["sec_label"],
        secHeader: json["sec_header"],
        secDescription: json["sec_description"],
        secondaryVideoUrl: json["secondary_video_url"],
        secImg:
            json["sec_img"] == null ? null : SecImg.fromJson(json["sec_img"]),
        secCta:
            json["sec_cta"] == null ? null : SecCta.fromJson(json["sec_cta"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "sec_label": secLabel,
        "sec_header": secHeader,
        "sec_description": secDescription,
        "secondary_video_url": secondaryVideoUrl,
        "sec_img": secImg?.toJson(),
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

class SecCard {
  final int? id;
  final dynamic secHeader;
  final String? description;
  final SecImg? logoImg;
  final String? label;
  final String? secDescription;
  final dynamic intValue;
  final SecImg? secLogo;

  SecCard({
    this.id,
    this.secHeader,
    this.description,
    this.logoImg,
    this.label,
    this.secDescription,
    this.intValue,
    this.secLogo,
  });

  factory SecCard.fromJson(Map<String, dynamic> json) => SecCard(
        id: json["id"],
        secHeader: json["sec_header"],
        description: json["description"],
        logoImg:
            json["logo_img"] == null ? null : SecImg.fromJson(json["logo_img"]),
        label: json["label"],
        secDescription: json["sec_description"],
        intValue: json["int_value"],
        secLogo:
            json["sec_logo"] == null ? null : SecImg.fromJson(json["sec_logo"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "sec_header": secHeader,
        "description": description,
        "logo_img": logoImg?.toJson(),
        "label": label,
        "sec_description": secDescription,
        "int_value": intValue,
        "sec_logo": secLogo?.toJson(),
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
