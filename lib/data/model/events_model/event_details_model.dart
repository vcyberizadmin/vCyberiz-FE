// To parse this JSON data, do
//
//     final eventDetailsModel = eventDetailsModelFromJson(jsonString);

import 'dart:convert';

EventDetailsModel eventDetailsModelFromJson(String str) =>
    EventDetailsModel.fromJson(json.decode(str));

String eventDetailsModelToJson(EventDetailsModel data) =>
    json.encode(data.toJson());

class EventDetailsModel {
  final EventDetailsData? data;
  final Meta? meta;

  EventDetailsModel({
    this.data,
    this.meta,
  });

  factory EventDetailsModel.fromJson(Map<String, dynamic> json) =>
      EventDetailsModel(
        data: json["data"] == null
            ? null
            : EventDetailsData.fromJson(json["data"]),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "meta": meta?.toJson(),
      };
}

class EventDetailsData {
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
  final Sec? secImg;
  final Blog? blogAuthor;
  final List<Blog>? blogCategories;
  final List<Blog>? blogTags;
  final List<ShareWithFriend>? shareWithFriends;
  final List<EventContent>? eventContent;

  EventDetailsData({
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
    this.shareWithFriends,
    this.eventContent,
  });

  factory EventDetailsData.fromJson(Map<String, dynamic> json) =>
      EventDetailsData(
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
        secImg: json["sec_img"] == null ? null : Sec.fromJson(json["sec_img"]),
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
        shareWithFriends: json["share_with_friends"] == null
            ? []
            : List<ShareWithFriend>.from(json["share_with_friends"]!
                .map((x) => ShareWithFriend.fromJson(x))),
        eventContent: json["event_content"] == null
            ? []
            : List<EventContent>.from(
                json["event_content"]!.map((x) => EventContent.fromJson(x))),
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
        "share_with_friends": shareWithFriends == null
            ? []
            : List<dynamic>.from(shareWithFriends!.map((x) => x.toJson())),
        "event_content": eventContent == null
            ? []
            : List<dynamic>.from(eventContent!.map((x) => x.toJson())),
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

class EventContent {
  final String? component;
  final int? id;
  final String? secHeader;
  final String? secDescription;
  final String? secSubHeader;
  final String? secLocation;
  final SecCta? secCta;
  final Sec? secImg;

  EventContent({
    this.component,
    this.id,
    this.secHeader,
    this.secDescription,
    this.secSubHeader,
    this.secLocation,
    this.secCta,
    this.secImg,
  });

  factory EventContent.fromJson(Map<String, dynamic> json) => EventContent(
        component: json["__component"],
        id: json["id"],
        secHeader: json["sec_header"],
        secDescription: json["sec_description"],
        secSubHeader: json["sec_sub_header"],
        secLocation: json["sec_location"],
        secCta:
            json["sec_cta"] == null ? null : SecCta.fromJson(json["sec_cta"]),
        secImg: json["sec_img"] == null ? null : Sec.fromJson(json["sec_img"]),
      );

  Map<String, dynamic> toJson() => {
        "__component": component,
        "id": id,
        "sec_header": secHeader,
        "sec_description": secDescription,
        "sec_sub_header": secSubHeader,
        "sec_location": secLocation,
        "sec_cta": secCta?.toJson(),
        "sec_img": secImg?.toJson(),
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

class Sec {
  final int? id;
  final String? url;
  final String? name;
  final String? mime;
  final String? label;

  Sec({
    this.id,
    this.url,
    this.name,
    this.mime,
    this.label,
  });

  factory Sec.fromJson(Map<String, dynamic> json) => Sec(
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

class ShareWithFriend {
  final int? id;
  final String? documentId;
  final String? secHeader;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? publishedAt;
  final List<SecBody>? secBody;

  ShareWithFriend({
    this.id,
    this.documentId,
    this.secHeader,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.secBody,
  });

  factory ShareWithFriend.fromJson(Map<String, dynamic> json) =>
      ShareWithFriend(
        id: json["id"],
        documentId: json["documentId"],
        secHeader: json["sec_header"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        publishedAt: json["publishedAt"] == null
            ? null
            : DateTime.parse(json["publishedAt"]),
        secBody: json["sec_body"] == null
            ? []
            : List<SecBody>.from(
                json["sec_body"]!.map((x) => SecBody.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "documentId": documentId,
        "sec_header": secHeader,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "publishedAt": publishedAt?.toIso8601String(),
        "sec_body": secBody == null
            ? []
            : List<dynamic>.from(secBody!.map((x) => x.toJson())),
      };
}

class SecBody {
  final int? id;
  final SecCta? link;
  final List<Sec>? secLogo;

  SecBody({
    this.id,
    this.link,
    this.secLogo,
  });

  factory SecBody.fromJson(Map<String, dynamic> json) => SecBody(
        id: json["id"],
        link: json["link"] == null ? null : SecCta.fromJson(json["link"]),
        secLogo: json["sec_logo"] == null
            ? []
            : List<Sec>.from(json["sec_logo"]!.map((x) => Sec.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "link": link?.toJson(),
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
