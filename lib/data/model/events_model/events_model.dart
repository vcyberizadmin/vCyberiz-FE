// To parse this JSON data, do
//
//     final eventsListModel = eventsListModelFromJson(jsonString);

import 'dart:convert';

EventsListModel eventsListModelFromJson(String str) =>
    EventsListModel.fromJson(json.decode(str));

String eventsListModelToJson(EventsListModel data) =>
    json.encode(data.toJson());

class EventsListModel {
  final List<EventsListData>? data;
  final Meta? meta;

  EventsListModel({
    this.data,
    this.meta,
  });

  factory EventsListModel.fromJson(Map<String, dynamic> json) =>
      EventsListModel(
        data: json["data"] == null
            ? []
            : List<EventsListData>.from(
                json["data"]!.map((x) => EventsListData.fromJson(x))),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "meta": meta?.toJson(),
      };
}

class EventsListData {
  final int? id;
  final String? documentId;
  final String? eventPlatform;
  final String? eventTitle;
  final String? secDescription;
  final String? eventId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? publishedAt;
  final DateTime? publicationDate;
  final SecCta? secCta;
  final SecImg? secImg;
  final Blog? blogAuthor;
  final List<Blog>? blogCategories;
  final List<Blog>? blogTags;

  EventsListData({
    this.id,
    this.documentId,
    this.eventPlatform,
    this.eventTitle,
    this.secDescription,
    this.eventId,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.publicationDate,
    this.secCta,
    this.secImg,
    this.blogAuthor,
    this.blogCategories,
    this.blogTags,
  });

  factory EventsListData.fromJson(Map<String, dynamic> json) => EventsListData(
        id: json["id"],
        documentId: json["documentId"],
        eventPlatform: json["event_platform"],
        eventTitle: json["event_title"],
        secDescription: json["sec_description"],
        eventId: json["event_id"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        publishedAt: json["publishedAt"] == null
            ? null
            : DateTime.parse(json["publishedAt"]),
        publicationDate: json["publication_date"] == null
            ? null
            : DateTime.parse(json["publication_date"]),
        secCta:
            json["sec_cta"] == null ? null : SecCta.fromJson(json["sec_cta"]),
        secImg:
            json["sec_img"] == null ? null : SecImg.fromJson(json["sec_img"]),
        blogAuthor: json["blog_author"] == null
            ? null
            : Blog.fromJson(json["blog_author"]),
        blogCategories: json["blog_categories"] == null
            ? []
            : List<Blog>.from(
                json["blog_categories"]!.map((x) => Blog.fromJson(x))),
        blogTags: json["blog_tags"] == null
            ? []
            : List<Blog>.from(json["blog_tags"]!.map((x) => Blog.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "documentId": documentId,
        "event_platform": eventPlatform,
        "event_title": eventTitle,
        "sec_description": secDescription,
        "event_id": eventId,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "publishedAt": publishedAt?.toIso8601String(),
        "publication_date":
            "${publicationDate!.year.toString().padLeft(4, '0')}-${publicationDate!.month.toString().padLeft(2, '0')}-${publicationDate!.day.toString().padLeft(2, '0')}",
        "sec_cta": secCta?.toJson(),
        "sec_img": secImg?.toJson(),
        "blog_author": blogAuthor?.toJson(),
        "blog_categories": blogCategories == null
            ? []
            : List<dynamic>.from(blogCategories!.map((x) => x.toJson())),
        "blog_tags": blogTags == null
            ? []
            : List<dynamic>.from(blogTags!.map((x) => x.toJson())),
      };
}

class Blog {
  final int? id;
  final String? documentId;
  final String? name;
  final String? uid;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? publishedAt;
  final String? cid;
  final String? tid;

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

class SecImg {
  final int? id;
  final String? url;
  final String? name;
  final String? mime;
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

class Meta {
  final Pagination? pagination;

  Meta({
    this.pagination,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        pagination: json["pagination"] == null
            ? null
            : Pagination.fromJson(json["pagination"]),
      );

  Map<String, dynamic> toJson() => {
        "pagination": pagination?.toJson(),
      };
}

class Pagination {
  final int? page;
  final int? pageSize;
  final int? pageCount;
  final int? total;

  Pagination({
    this.page,
    this.pageSize,
    this.pageCount,
    this.total,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        page: json["page"],
        pageSize: json["pageSize"],
        pageCount: json["pageCount"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "pageSize": pageSize,
        "pageCount": pageCount,
        "total": total,
      };
}
