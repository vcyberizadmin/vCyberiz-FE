// ignore_for_file: public_member_api_docs, sort_constructors_first
// To parse this JSON data, do
//
//     final blogArticleModel = blogArticleModelFromJson(jsonString);

import 'dart:convert';

BlogArticleModel blogArticleModelFromJson(String str) =>
    BlogArticleModel.fromJson(json.decode(str));

String blogArticleModelToJson(BlogArticleModel data) =>
    json.encode(data.toJson());

class BlogArticleModel {
  BlogArticleData? data;
  Meta? meta;

  BlogArticleModel({
    this.data,
    this.meta,
  });

  factory BlogArticleModel.fromJson(Map<String, dynamic> json) =>
      BlogArticleModel(
        data: json["data"] == null
            ? null
            : BlogArticleData.fromJson(json["data"]),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "meta": meta?.toJson(),
      };
}

class BlogArticleData {
  int? id;
  String? documentId;
  String? blogId;
  String? title;
  String? description;
  DateTime? publicationDate;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? publishedAt;
  SecImg? secImg;
  Blog? blogAuthor;
  List<Blog>? blogCategories;
  SecCta? secCta;
  List<Blog>? blogTags;
  List<BlogSection>? blogSection;

  BlogArticleData({
    this.id,
    this.documentId,
    this.blogId,
    this.title,
    this.description,
    this.publicationDate,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.secImg,
    this.blogAuthor,
    this.blogCategories,
    this.secCta,
    this.blogTags,
    this.blogSection,
  });

  factory BlogArticleData.fromJson(Map<String, dynamic> json) =>
      BlogArticleData(
        id: json["id"],
        documentId: json["documentId"],
        blogId: json["blogId"],
        title: json["title"],
        description: json["description"],
        publicationDate: json["publication_date"] == null
            ? null
            : DateTime.parse(json["publication_date"]),
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        publishedAt: json["publishedAt"] == null
            ? null
            : DateTime.parse(json["publishedAt"]),
        secImg:
            json["sec_img"] == null ? null : SecImg.fromJson(json["sec_img"]),
        blogAuthor: json["blog_author"] == null
            ? null
            : Blog.fromJson(json["blog_author"]),
        blogCategories: json["blog_categories"] == null
            ? []
            : List<Blog>.from(
                json["blog_categories"]!.map((x) => Blog.fromJson(x))),
        secCta:
            json["sec_cta"] == null ? null : SecCta.fromJson(json["sec_cta"]),
        blogTags: json["blog_tags"] == null
            ? []
            : List<Blog>.from(json["blog_tags"]!.map((x) => Blog.fromJson(x))),
        blogSection: json["blog_section"] == null
            ? []
            : List<BlogSection>.from(
                json["blog_section"]!.map((x) => BlogSection.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "documentId": documentId,
        "blogId": blogId,
        "title": title,
        "description": description,
        "publication_date": publicationDate?.toIso8601String(),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "publishedAt": publishedAt?.toIso8601String(),
        "sec_img": secImg?.toJson(),
        "blog_author": blogAuthor?.toJson(),
        "blog_categories": blogCategories == null
            ? []
            : List<dynamic>.from(blogCategories!.map((x) => x.toJson())),
        "sec_cta": secCta?.toJson(),
        "blog_tags": blogTags == null
            ? []
            : List<dynamic>.from(blogTags!.map((x) => x.toJson())),
        "blog_section": blogSection == null
            ? []
            : List<dynamic>.from(blogSection!.map((x) => x.toJson())),
      };

  @override
  String toString() {
    return 'BlogArticleData(id: $id, documentId: $documentId, blogId: $blogId, title: $title, description: $description, publicationDate: $publicationDate, createdAt: $createdAt, updatedAt: $updatedAt, publishedAt: $publishedAt, secImg: $secImg, blogAuthor: $blogAuthor, blogCategories: $blogCategories, secCta: $secCta, blogTags: $blogTags, blogSection: $blogSection)';
  }
}

class Blog {
  int? id;
  String? documentId;
  String? name;
  String? uid;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? publishedAt;
  String? cid;
  String? tid;

  Blog({
    this.id,
    this.documentId,
    this.name,
    this.uid,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.cid,
    this.tid,
  });

  factory Blog.fromJson(Map<String, dynamic> json) => Blog(
        id: json["id"],
        documentId: json["documentId"],
        name: json["name"],
        uid: json["uid"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        publishedAt: json["publishedAt"] == null
            ? null
            : DateTime.parse(json["publishedAt"]),
        cid: json["cid"],
        tid: json["tid"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "documentId": documentId,
        "name": name,
        "uid": uid,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "publishedAt": publishedAt?.toIso8601String(),
        "cid": cid,
        "tid": tid,
      };
}

class BlogSection {
  String? component;
  int? id;
  String? header;
  String? content;
  List<SecImg>? secImg;

  BlogSection({
    this.component,
    this.id,
    this.header,
    this.content,
    this.secImg,
  });

  factory BlogSection.fromJson(Map<String, dynamic> json) => BlogSection(
        component: json["__component"],
        id: json["id"],
        header: json["header"],
        content: json["content"],
        secImg: json["sec_img"] == null
            ? []
            : List<SecImg>.from(
                json["sec_img"]!.map((x) => SecImg.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "__component": component,
        "id": id,
        "header": header,
        "content": content,
        "sec_img": secImg == null
            ? []
            : List<dynamic>.from(secImg!.map((x) => x.toJson())),
      };
}

class SecImg {
  int? id;
  String? url;
  String? name;
  String? mime;
  String? label;

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

class Meta {
  Meta();

  factory Meta.fromJson(Map<String, dynamic> json) => Meta();

  Map<String, dynamic> toJson() => {};
}
