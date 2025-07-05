// To parse this JSON data, do
//
//     final bannerInfoModel = bannerInfoModelFromJson(jsonString);

import 'dart:convert';

BannerInfoModel bannerInfoModelFromJson(String str) =>
    BannerInfoModel.fromJson(json.decode(str));

String bannerInfoModelToJson(BannerInfoModel data) =>
    json.encode(data.toJson());

class BannerInfoModel {
  final Data? data;
  final Meta? meta;

  BannerInfoModel({
    this.data,
    this.meta,
  });

  factory BannerInfoModel.fromJson(Map<String, dynamic> json) =>
      BannerInfoModel(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "meta": meta?.toJson(),
      };
}

class Data {
  final int? id;
  final String? documentId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? publishedAt;
  final List<Carousel>? carousel;
  final List<InfoSection>? infoSection;

  Data({
    this.id,
    this.documentId,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.carousel,
    this.infoSection,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
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
        carousel: json["carousel"] == null
            ? []
            : List<Carousel>.from(
                json["carousel"]!.map((x) => Carousel.fromJson(x))),
        infoSection: json["InfoSection"] == null
            ? []
            : List<InfoSection>.from(
                json["InfoSection"]!.map((x) => InfoSection.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "documentId": documentId,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "publishedAt": publishedAt?.toIso8601String(),
        "carousel": carousel == null
            ? []
            : List<dynamic>.from(carousel!.map((x) => x.toJson())),
        "InfoSection": infoSection == null
            ? []
            : List<dynamic>.from(infoSection!.map((x) => x.toJson())),
      };
}

class Carousel {
  final int? id;
  final String? heading;
  final String? description;
  final String? videoUrl;
  final String? buttonLink;
  final String? buttonLabel;

  Carousel({
    this.id,
    this.heading,
    this.description,
    this.videoUrl,
    this.buttonLink,
    this.buttonLabel,
  });

  factory Carousel.fromJson(Map<String, dynamic> json) => Carousel(
        id: json["id"],
        heading: json["heading"],
        description: json["description"],
        videoUrl: json["videoUrl"],
        buttonLink: json["buttonLink"],
        buttonLabel: json["buttonLabel"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "heading": heading,
        "description": description,
        "videoUrl": videoUrl,
        "buttonLink": buttonLink,
        "buttonLabel": buttonLabel,
      };
}

class InfoSection {
  final int? id;
  final String? infoTitle;
  final String? infoDetail;
  final DateTime? publicationDate;

  InfoSection({
    this.id,
    this.infoTitle,
    this.infoDetail,
    this.publicationDate,
  });

  factory InfoSection.fromJson(Map<String, dynamic> json) => InfoSection(
        id: json["id"],
        infoTitle: json["InfoTitle"],
        infoDetail: json["InfoDetail"],
        publicationDate: json["publication_date"] == null
            ? null
            : DateTime.parse(json["publication_date"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "InfoTitle": infoTitle,
        "InfoDetail": infoDetail,
        "publication_date": publicationDate?.toIso8601String(),
      };
}

class Meta {
  Meta();

  factory Meta.fromJson(Map<String, dynamic> json) => Meta();

  Map<String, dynamic> toJson() => {};
}
