// ignore_for_file: public_member_api_docs, sort_constructors_first
// To parse this JSON data, do
//
//     final videoModel = videoModelFromJson(jsonString);

import 'dart:convert';

VideoModel videoModelFromJson(String str) =>
    VideoModel.fromJson(json.decode(str));

String videoModelToJson(VideoModel data) => json.encode(data.toJson());

class VideoModel {
  VideoData? data;
  Meta? meta;

  VideoModel({
    this.data,
    this.meta,
  });

  factory VideoModel.fromJson(Map<String, dynamic> json) => VideoModel(
        data: json["data"] == null ? null : VideoData.fromJson(json["data"]),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "meta": meta?.toJson(),
      };
}

class VideoData {
  int? id;
  String? documentId;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? publishedAt;
  String? alt;
  String? videoUrl;
  String? title;

  VideoData({
    this.id,
    this.documentId,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.alt,
    this.videoUrl,
    this.title,
  });

  factory VideoData.fromJson(Map<String, dynamic> json) => VideoData(
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
        alt: json["alt"],
        videoUrl: json["video_url"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "documentId": documentId,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "publishedAt": publishedAt?.toIso8601String(),
        "alt": alt,
        "video_url": videoUrl,
        "title": title,
      };

  @override
  String toString() {
    return 'VideoData(id: $id, documentId: $documentId, createdAt: $createdAt, updatedAt: $updatedAt, publishedAt: $publishedAt, alt: $alt, videoUrl: $videoUrl, title: $title)';
  }
}

class Meta {
  Meta();

  factory Meta.fromJson(Map<String, dynamic> json) => Meta();

  Map<String, dynamic> toJson() => {};
}
