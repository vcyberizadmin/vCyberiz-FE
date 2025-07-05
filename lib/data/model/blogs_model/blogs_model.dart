// To parse this JSON data, do
//
//     final blogsModel = blogsModelFromJson(jsonString);

import 'dart:convert';

BlogsModel blogsModelFromJson(String str) =>
    BlogsModel.fromJson(json.decode(str));

String blogsModelToJson(BlogsModel data) => json.encode(data.toJson());

class BlogsModel {
  final BlogsData data;
  final Meta meta;

  BlogsModel({
    required this.data,
    required this.meta,
  });

  factory BlogsModel.fromJson(Map<String, dynamic> json) => BlogsModel(
        data: BlogsData.fromJson(json["data"]),
        meta: Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "meta": meta.toJson(),
      };
}

class BlogsData {
  final int id;
  final String documentId;
  final String sectionLabel;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime publishedAt;
  final String heading;
  final String description;
  final ButtonLink buttonLink;
  final List<Blog> blogs;

  BlogsData({
    required this.id,
    required this.documentId,
    required this.sectionLabel,
    required this.createdAt,
    required this.updatedAt,
    required this.publishedAt,
    required this.heading,
    required this.description,
    required this.buttonLink,
    required this.blogs,
  });

  factory BlogsData.fromJson(Map<String, dynamic> json) => BlogsData(
        id: json["id"],
        documentId: json["documentId"],
        sectionLabel: json["sectionLabel"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        publishedAt: DateTime.parse(json["publishedAt"]),
        heading: json["heading"],
        description: json["description"],
        buttonLink: ButtonLink.fromJson(json["buttonLink"]),
        blogs: List<Blog>.from(json["blogs"].map((x) => Blog.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "documentId": documentId,
        "sectionLabel": sectionLabel,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "publishedAt": publishedAt.toIso8601String(),
        "heading": heading,
        "description": description,
        "buttonLink": buttonLink.toJson(),
        "blogs": List<dynamic>.from(blogs.map((x) => x.toJson())),
      };
}

class Blog {
  final int id;
  final String heading;
  final DateTime publishedDate;
  final List<ImgUrl> imgUrl;

  Blog({
    required this.id,
    required this.heading,
    required this.publishedDate,
    required this.imgUrl,
  });

  factory Blog.fromJson(Map<String, dynamic> json) => Blog(
        id: json["id"],
        heading: json["heading"],
        publishedDate: DateTime.parse(json["publishedDate"]),
        imgUrl:
            List<ImgUrl>.from(json["img_url"].map((x) => ImgUrl.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "heading": heading,
        "publishedDate":
            "${publishedDate.year.toString().padLeft(4, '0')}-${publishedDate.month.toString().padLeft(2, '0')}-${publishedDate.day.toString().padLeft(2, '0')}",
        "img_url": List<dynamic>.from(imgUrl.map((x) => x.toJson())),
      };
}

class ImgUrl {
  final int id;
  final String url;
  final String name;
  final String mime;
  final String label;

  ImgUrl({
    required this.id,
    required this.url,
    required this.name,
    required this.mime,
    required this.label,
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

class ButtonLink {
  final int id;
  final String label;
  final String href;
  final dynamic isExternal;
  final String type;

  ButtonLink({
    required this.id,
    required this.label,
    required this.href,
    required this.isExternal,
    required this.type,
  });

  factory ButtonLink.fromJson(Map<String, dynamic> json) => ButtonLink(
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
