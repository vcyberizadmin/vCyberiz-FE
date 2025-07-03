// ignore_for_file: public_member_api_docs, sort_constructors_first
// To parse this JSON data, do
//
//     final searchModel = searchModelFromJson(jsonString);

import 'dart:convert';

SearchModel searchModelFromJson(String str) =>
    SearchModel.fromJson(json.decode(str));

String searchModelToJson(SearchModel data) => json.encode(data.toJson());

class SearchModel {
  final List<Result>? results;

  SearchModel({
    this.results,
  });

  factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
        results: json["results"] == null
            ? []
            : List<Result>.from(
                json["results"]!.map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "results": results == null
            ? []
            : List<dynamic>.from(results!.map((x) => x.toJson())),
      };

  @override
  String toString() => 'SearchModel(results: $results)';
}

class Result {
  final String? indexUid;
  final List<Hit>? hits;
  final String? query;
  final int? processingTimeMs;
  final int? limit;
  final int? offset;
  final int? estimatedTotalHits;

  Result({
    this.indexUid,
    this.hits,
    this.query,
    this.processingTimeMs,
    this.limit,
    this.offset,
    this.estimatedTotalHits,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        indexUid: json["indexUid"],
        hits: json["hits"] == null
            ? []
            : List<Hit>.from(json["hits"]!.map((x) => Hit.fromJson(x))),
        query: json["query"],
        processingTimeMs: json["processingTimeMs"],
        limit: json["limit"],
        offset: json["offset"],
        estimatedTotalHits: json["estimatedTotalHits"],
      );

  Map<String, dynamic> toJson() => {
        "indexUid": indexUid,
        "hits": hits == null
            ? []
            : List<dynamic>.from(hits!.map((x) => x.toJson())),
        "query": query,
        "processingTimeMs": processingTimeMs,
        "limit": limit,
        "offset": offset,
        "estimatedTotalHits": estimatedTotalHits,
      };
}

class Hit {
  final String? meilisearchId;
  final int? id;
  final String? documentId;
  final String? eventPlatform;
  final String? eventTitle;
  final String? secHeader;
  final String? searchHeader;
  final String? heading;
  final String? title;
  final String? name;
  final String? secDescription;
  final String? searchDescription;
  final String? description;
  final String? bio;
  final String? content;
  final String? secLabel;
  final String? eventId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? publishedAt;
  final DateTime? publicationDate;
  final dynamic globalUrl;
  final dynamic innerPageRequired;
  final HitBlogAuthor? blogAuthor;
  final List<HitBlogAuthor>? blogCategories;
  final List<HitBlogAuthor>? blogTags;
  final List<HitEventContent>? eventContent;
  final HitSecCta? secCta;
  final HitSecHeaderLogo? secImg;
  final List<HitBlogAuthor>? shareWithFriends;
  final Formatted? formatted;
  final MatchesPosition? matchesPosition;
  final double? rankingScore;
  final List<Form>? form;
  final HitSecHeaderLogo? secHeaderLogo;
  final List<HitFormFieldIcon>? formFieldIcons;
  final List<HitSecBody>? secBody;
  final List<HitSecCta>? secButtons;

  Hit(
      {this.meilisearchId,
      this.id,
      this.documentId,
      this.eventPlatform,
      this.eventTitle,
      this.secHeader,
      this.searchHeader,
      this.name,
      this.title,
      this.heading,
      this.description,
      this.secDescription,
      this.searchDescription,
      this.bio,
      this.content,
      this.eventId,
      this.createdAt,
      this.updatedAt,
      this.publishedAt,
      this.publicationDate,
      this.globalUrl,
      this.blogAuthor,
      this.blogCategories,
      this.blogTags,
      this.eventContent,
      this.secCta,
      this.secImg,
      this.shareWithFriends,
      this.formatted,
      this.matchesPosition,
      this.rankingScore,
      this.form,
      this.secHeaderLogo,
      this.formFieldIcons,
      this.secBody,
      this.secLabel,
      this.secButtons,
      this.innerPageRequired});

  factory Hit.fromJson(Map<String, dynamic> json) => Hit(
        meilisearchId: json["_meilisearch_id"],
        id: json["id"],
        documentId: json["documentId"],
        eventPlatform: json["event_platform"],
        eventTitle: json["event_title"],
        secHeader: json["sec_header"],
        searchHeader: json["search_header"],
        heading: json["heading"],
        name: json["name"],
        title: json["title"],
        secDescription: json["sec_description"],
        searchDescription: json["search_description"],
        description: json["description"],
        secLabel: json["sec_label"],
        bio: json["bio"],
        content: json["content"],
        eventId: json["event_id"],
        innerPageRequired: json['inner_page_isRequired'],
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
        globalUrl: json["global_url"],
        blogAuthor: json["blog_author"] == null
            ? null
            : HitBlogAuthor.fromJson(json["blog_author"]),
        blogCategories: json["blog_categories"] == null
            ? []
            : List<HitBlogAuthor>.from(
                json["blog_categories"]!.map((x) => HitBlogAuthor.fromJson(x))),
        blogTags: json["blog_tags"] == null
            ? []
            : List<HitBlogAuthor>.from(
                json["blog_tags"]!.map((x) => HitBlogAuthor.fromJson(x))),
        eventContent: json["event_content"] == null
            ? []
            : List<HitEventContent>.from(
                json["event_content"]!.map((x) => HitEventContent.fromJson(x))),
        secCta: json["sec_cta"] == null
            ? null
            : HitSecCta.fromJson(json["sec_cta"]),
        secImg: json["sec_img"] == null
            ? null
            : HitSecHeaderLogo.fromJson(json["sec_img"]),
        shareWithFriends: json["share_with_friends"] == null
            ? []
            : List<HitBlogAuthor>.from(json["share_with_friends"]!
                .map((x) => HitBlogAuthor.fromJson(x))),
        formatted: json["_formatted"] == null
            ? null
            : Formatted.fromJson(json["_formatted"]),
        matchesPosition: json["_matchesPosition"] == null
            ? null
            : MatchesPosition.fromJson(json["_matchesPosition"]),
        rankingScore: json["_rankingScore"]?.toDouble(),
        form: json["form"] == null
            ? []
            : List<Form>.from(json["form"]!.map((x) => Form.fromJson(x))),
        secHeaderLogo: json["sec_headerLogo"] == null
            ? null
            : HitSecHeaderLogo.fromJson(json["sec_headerLogo"]),
        formFieldIcons: json["form_field_icons"] == null
            ? []
            : List<HitFormFieldIcon>.from(json["form_field_icons"]!
                .map((x) => HitFormFieldIcon.fromJson(x))),
        secBody: json["sec_body"] == null
            ? []
            : List<HitSecBody>.from(
                json["sec_body"]!.map((x) => HitSecBody.fromJson(x))),
        secButtons: json["sec_buttons"] == null
            ? []
            : List<HitSecCta>.from(
                json["sec_buttons"]!.map((x) => HitSecCta.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "_meilisearch_id": meilisearchId,
        "id": id,
        "documentId": documentId,
        "event_platform": eventPlatform,
        "event_title": eventTitle,
        "sec_header": secHeader,
        "heading": heading,
        "search_header": searchHeader,
        "title": title,
        "search_description": searchDescription,
        'sec_label': secLabel,
        "name": name,
        "inner_page_isRequired": innerPageRequired,
        "sec_description": secDescription,
        "description": description,
        "bio": bio,
        "content": content,
        "event_id": eventId,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "publishedAt": publishedAt?.toIso8601String(),
        "publication_date":
            "${publicationDate!.year.toString().padLeft(4, '0')}-${publicationDate!.month.toString().padLeft(2, '0')}-${publicationDate!.day.toString().padLeft(2, '0')}",
        "global_url": globalUrl,
        "blog_author": blogAuthor?.toJson(),
        "blog_categories": blogCategories == null
            ? []
            : List<dynamic>.from(blogCategories!.map((x) => x.toJson())),
        "blog_tags": blogTags == null
            ? []
            : List<dynamic>.from(blogTags!.map((x) => x.toJson())),
        "event_content": eventContent == null
            ? []
            : List<dynamic>.from(eventContent!.map((x) => x.toJson())),
        "sec_cta": secCta?.toJson(),
        "sec_img": secImg?.toJson(),
        "share_with_friends": shareWithFriends == null
            ? []
            : List<dynamic>.from(shareWithFriends!.map((x) => x.toJson())),
        "_formatted": formatted?.toJson(),
        "_matchesPosition": matchesPosition?.toJson(),
        "_rankingScore": rankingScore,
        "form": form == null
            ? []
            : List<dynamic>.from(form!.map((x) => x.toJson())),
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

  @override
  String toString() {
    return 'Hit(meilisearchId: $meilisearchId,search_description: $searchDescription, inner_page_isRequired: $innerPageRequired, id: $id, documentId: $documentId, eventPlatform: $eventPlatform, eventTitle: $eventTitle, secHeader: $secHeader, heading: $heading, title: $title, name: $name, secDescription: $secDescription, description: $description, bio: $bio, content: $content, eventId: $eventId, createdAt: $createdAt, updatedAt: $updatedAt, publishedAt: $publishedAt, publicationDate: $publicationDate, globalUrl: $globalUrl, blogAuthor: $blogAuthor, blogCategories: $blogCategories, blogTags: $blogTags, eventContent: $eventContent, secCta: $secCta, secImg: $secImg, shareWithFriends: $shareWithFriends, formatted: $formatted, matchesPosition: $matchesPosition, rankingScore: $rankingScore, form: $form, secHeaderLogo: $secHeaderLogo, formFieldIcons: $formFieldIcons, secBody: $secBody, secButtons: $secButtons)';
  }
}

class HitBlogAuthor {
  final int? id;
  final String? documentId;
  final String? name;
  final String? uid;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? publishedAt;
  final dynamic locale;
  final String? cid;
  final String? tid;
  final String? secHeader;

  HitBlogAuthor({
    this.id,
    this.documentId,
    this.name,
    this.uid,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.locale,
    this.cid,
    this.tid,
    this.secHeader,
  });

  factory HitBlogAuthor.fromJson(Map<String, dynamic> json) => HitBlogAuthor(
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
        locale: json["locale"],
        cid: json["cid"],
        tid: json["tid"],
        secHeader: json["sec_header"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "documentId": documentId,
        "name": name,
        "uid": uid,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "publishedAt": publishedAt?.toIso8601String(),
        "locale": locale,
        "cid": cid,
        "tid": tid,
        "sec_header": secHeader,
      };
}

class HitEventContent {
  final String? component;
  final int? id;
  final String? secHeader;
  final String? secDescription;
  final String? secSubHeader;
  final String? secLocation;

  HitEventContent({
    this.component,
    this.id,
    this.secHeader,
    this.secDescription,
    this.secSubHeader,
    this.secLocation,
  });

  factory HitEventContent.fromJson(Map<String, dynamic> json) =>
      HitEventContent(
        component: json["__component"],
        id: json["id"],
        secHeader: json["sec_header"],
        secDescription: json["sec_description"],
        secSubHeader: json["sec_sub_header"],
        secLocation: json["sec_location"],
      );

  Map<String, dynamic> toJson() => {
        "__component": component,
        "id": id,
        "sec_header": secHeader,
        "sec_description": secDescription,
        "sec_sub_header": secSubHeader,
        "sec_location": secLocation,
      };
}

class Form {
  final String? id;
  final String? name;
  final String? type;
  final String? label;

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

class HitFormFieldIcon {
  final int? id;
  final String? fieldId;

  HitFormFieldIcon({
    this.id,
    this.fieldId,
  });

  factory HitFormFieldIcon.fromJson(Map<String, dynamic> json) =>
      HitFormFieldIcon(
        id: json["id"],
        fieldId: json["field_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "field_id": fieldId,
      };
}

class Formatted {
  final String? meilisearchId;
  final String? id;
  final String? documentId;
  final String? eventPlatform;
  final String? eventTitle;
  final String? secDescription;
  final String? eventId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? publishedAt;
  final DateTime? publicationDate;
  final dynamic globalUrl;
  final FormattedBlogAuthor? blogAuthor;
  final List<FormattedBlogAuthor>? blogCategories;
  final List<FormattedBlogAuthor>? blogTags;
  final List<FormattedEventContent>? eventContent;
  final FormattedSecCta? secCta;
  final FormattedSecHeaderLogo? secImg;
  final List<FormattedBlogAuthor>? shareWithFriends;
  final List<Form>? form;
  final FormattedSecHeaderLogo? secHeaderLogo;
  final List<FormattedFormFieldIcon>? formFieldIcons;
  final List<FormattedSecBody>? secBody;
  final List<FormattedSecCta>? secButtons;

  Formatted({
    this.meilisearchId,
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
    this.globalUrl,
    this.blogAuthor,
    this.blogCategories,
    this.blogTags,
    this.eventContent,
    this.secCta,
    this.secImg,
    this.shareWithFriends,
    this.form,
    this.secHeaderLogo,
    this.formFieldIcons,
    this.secBody,
    this.secButtons,
  });

  factory Formatted.fromJson(Map<String, dynamic> json) => Formatted(
        meilisearchId: json["_meilisearch_id"],
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
        globalUrl: json["global_url"],
        blogAuthor: json["blog_author"] == null
            ? null
            : FormattedBlogAuthor.fromJson(json["blog_author"]),
        blogCategories: json["blog_categories"] == null
            ? []
            : List<FormattedBlogAuthor>.from(json["blog_categories"]!
                .map((x) => FormattedBlogAuthor.fromJson(x))),
        blogTags: json["blog_tags"] == null
            ? []
            : List<FormattedBlogAuthor>.from(
                json["blog_tags"]!.map((x) => FormattedBlogAuthor.fromJson(x))),
        eventContent: json["event_content"] == null
            ? []
            : List<FormattedEventContent>.from(json["event_content"]!
                .map((x) => FormattedEventContent.fromJson(x))),
        secCta: json["sec_cta"] == null
            ? null
            : FormattedSecCta.fromJson(json["sec_cta"]),
        secImg: json["sec_img"] == null
            ? null
            : FormattedSecHeaderLogo.fromJson(json["sec_img"]),
        shareWithFriends: json["share_with_friends"] == null
            ? []
            : List<FormattedBlogAuthor>.from(json["share_with_friends"]!
                .map((x) => FormattedBlogAuthor.fromJson(x))),
        form: json["form"] == null
            ? []
            : List<Form>.from(json["form"]!.map((x) => Form.fromJson(x))),
        secHeaderLogo: json["sec_headerLogo"] == null
            ? null
            : FormattedSecHeaderLogo.fromJson(json["sec_headerLogo"]),
        formFieldIcons: json["form_field_icons"] == null
            ? []
            : List<FormattedFormFieldIcon>.from(json["form_field_icons"]!
                .map((x) => FormattedFormFieldIcon.fromJson(x))),
        secBody: json["sec_body"] == null
            ? []
            : List<FormattedSecBody>.from(
                json["sec_body"]!.map((x) => FormattedSecBody.fromJson(x))),
        secButtons: json["sec_buttons"] == null
            ? []
            : List<FormattedSecCta>.from(
                json["sec_buttons"]!.map((x) => FormattedSecCta.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "_meilisearch_id": meilisearchId,
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
        "global_url": globalUrl,
        "blog_author": blogAuthor?.toJson(),
        "blog_categories": blogCategories == null
            ? []
            : List<dynamic>.from(blogCategories!.map((x) => x.toJson())),
        "blog_tags": blogTags == null
            ? []
            : List<dynamic>.from(blogTags!.map((x) => x.toJson())),
        "event_content": eventContent == null
            ? []
            : List<dynamic>.from(eventContent!.map((x) => x.toJson())),
        "sec_cta": secCta?.toJson(),
        "sec_img": secImg?.toJson(),
        "share_with_friends": shareWithFriends == null
            ? []
            : List<dynamic>.from(shareWithFriends!.map((x) => x.toJson())),
        "form": form == null
            ? []
            : List<dynamic>.from(form!.map((x) => x.toJson())),
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

class FormattedBlogAuthor {
  final String? id;
  final String? documentId;
  final String? name;
  final String? uid;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? publishedAt;
  final dynamic locale;
  final String? cid;
  final String? tid;
  final String? secHeader;

  FormattedBlogAuthor({
    this.id,
    this.documentId,
    this.name,
    this.uid,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.locale,
    this.cid,
    this.tid,
    this.secHeader,
  });

  factory FormattedBlogAuthor.fromJson(Map<String, dynamic> json) =>
      FormattedBlogAuthor(
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
        locale: json["locale"],
        cid: json["cid"],
        tid: json["tid"],
        secHeader: json["sec_header"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "documentId": documentId,
        "name": name,
        "uid": uid,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "publishedAt": publishedAt?.toIso8601String(),
        "locale": locale,
        "cid": cid,
        "tid": tid,
        "sec_header": secHeader,
      };
}

class FormattedEventContent {
  final String? component;
  final String? id;
  final String? secHeader;
  final String? secDescription;
  final String? secSubHeader;
  final String? secLocation;

  FormattedEventContent({
    this.component,
    this.id,
    this.secHeader,
    this.secDescription,
    this.secSubHeader,
    this.secLocation,
  });

  factory FormattedEventContent.fromJson(Map<String, dynamic> json) =>
      FormattedEventContent(
        component: json["__component"],
        id: json["id"],
        secHeader: json["sec_header"],
        secDescription: json["sec_description"],
        secSubHeader: json["sec_sub_header"],
        secLocation: json["sec_location"],
      );

  Map<String, dynamic> toJson() => {
        "__component": component,
        "id": id,
        "sec_header": secHeader,
        "sec_description": secDescription,
        "sec_sub_header": secSubHeader,
        "sec_location": secLocation,
      };
}

class FormattedFormFieldIcon {
  final String? id;
  final String? fieldId;

  FormattedFormFieldIcon({
    this.id,
    this.fieldId,
  });

  factory FormattedFormFieldIcon.fromJson(Map<String, dynamic> json) =>
      FormattedFormFieldIcon(
        id: json["id"],
        fieldId: json["field_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "field_id": fieldId,
      };
}

class FormattedSecBody {
  final String? id;
  final String? secHeader;

  FormattedSecBody({
    this.id,
    this.secHeader,
  });

  factory FormattedSecBody.fromJson(Map<String, dynamic> json) =>
      FormattedSecBody(
        id: json["id"],
        secHeader: json["sec_header"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "sec_header": secHeader,
      };
}

class FormattedSecCta {
  final String? id;
  final String? label;
  final String? href;
  final bool? isExternal;
  final String? type;

  FormattedSecCta({
    this.id,
    this.label,
    this.href,
    this.isExternal,
    this.type,
  });

  factory FormattedSecCta.fromJson(Map<String, dynamic> json) =>
      FormattedSecCta(
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

class FormattedSecHeaderLogo {
  final String? id;
  final String? url;
  final String? name;
  final String? mime;
  final String? label;

  FormattedSecHeaderLogo({
    this.id,
    this.url,
    this.name,
    this.mime,
    this.label,
  });

  factory FormattedSecHeaderLogo.fromJson(Map<String, dynamic> json) =>
      FormattedSecHeaderLogo(
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

class MatchesPosition {
  final List<BlogTags>? blogTagsName;
  final List<BlogTags>? blogTagsTid;
  final List<EventTitle>? eventTitle;
  final List<EventTitle>? secDescription;

  MatchesPosition({
    this.blogTagsName,
    this.blogTagsTid,
    this.eventTitle,
    this.secDescription,
  });

  factory MatchesPosition.fromJson(Map<String, dynamic> json) =>
      MatchesPosition(
        blogTagsName: json["blog_tags.name"] == null
            ? []
            : List<BlogTags>.from(
                json["blog_tags.name"]!.map((x) => BlogTags.fromJson(x))),
        blogTagsTid: json["blog_tags.tid"] == null
            ? []
            : List<BlogTags>.from(
                json["blog_tags.tid"]!.map((x) => BlogTags.fromJson(x))),
        eventTitle: json["event_title"] == null
            ? []
            : List<EventTitle>.from(
                json["event_title"]!.map((x) => EventTitle.fromJson(x))),
        secDescription: json["sec_description"] == null
            ? []
            : List<EventTitle>.from(
                json["sec_description"]!.map((x) => EventTitle.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "blog_tags.name": blogTagsName == null
            ? []
            : List<dynamic>.from(blogTagsName!.map((x) => x.toJson())),
        "blog_tags.tid": blogTagsTid == null
            ? []
            : List<dynamic>.from(blogTagsTid!.map((x) => x.toJson())),
        "event_title": eventTitle == null
            ? []
            : List<dynamic>.from(eventTitle!.map((x) => x.toJson())),
        "sec_description": secDescription == null
            ? []
            : List<dynamic>.from(secDescription!.map((x) => x.toJson())),
      };
}

class BlogTags {
  final int? start;
  final int? length;
  final List<int>? indices;

  BlogTags({
    this.start,
    this.length,
    this.indices,
  });

  factory BlogTags.fromJson(Map<String, dynamic> json) => BlogTags(
        start: json["start"],
        length: json["length"],
        indices: json["indices"] == null
            ? []
            : List<int>.from(json["indices"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "start": start,
        "length": length,
        "indices":
            indices == null ? [] : List<dynamic>.from(indices!.map((x) => x)),
      };
}

class EventTitle {
  final int? start;
  final int? length;

  EventTitle({
    this.start,
    this.length,
  });

  factory EventTitle.fromJson(Map<String, dynamic> json) => EventTitle(
        start: json["start"],
        length: json["length"],
      );

  Map<String, dynamic> toJson() => {
        "start": start,
        "length": length,
      };
}

class HitSecBody {
  final int? id;
  final String? secHeader;

  HitSecBody({
    this.id,
    this.secHeader,
  });

  factory HitSecBody.fromJson(Map<String, dynamic> json) => HitSecBody(
        id: json["id"],
        secHeader: json["sec_header"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "sec_header": secHeader,
      };
}

class HitSecCta {
  final int? id;
  final String? label;
  final String? href;
  final bool? isExternal;
  final String? type;

  HitSecCta({
    this.id,
    this.label,
    this.href,
    this.isExternal,
    this.type,
  });

  factory HitSecCta.fromJson(Map<String, dynamic> json) => HitSecCta(
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

class HitSecHeaderLogo {
  final int? id;
  final String? url;
  final String? name;
  final String? mime;
  final String? label;

  HitSecHeaderLogo({
    this.id,
    this.url,
    this.name,
    this.mime,
    this.label,
  });

  factory HitSecHeaderLogo.fromJson(Map<String, dynamic> json) =>
      HitSecHeaderLogo(
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
