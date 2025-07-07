// To parse this JSON data, do
//
//     final videoModel = videoModelFromJson(jsonString);

import 'dart:convert';

VideoModel videoModelFromJson(String str) =>
    VideoModel.fromJson(json.decode(str));

String videoModelToJson(VideoModel data) => json.encode(data.toJson());

class VideoModel {
  final VideoData? data;
  final Meta? meta;

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
  final int? id;
  final String? documentId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? publishedAt;
  final String? alt;
  final String? videoUrl;
  final String? title;
  final String? secondaryVideoUrl;

  VideoData({
    this.id,
    this.documentId,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.alt,
    this.videoUrl,
    this.title,
    this.secondaryVideoUrl,
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
        secondaryVideoUrl: json["secondary_video_url"],
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
        "secondary_video_url": secondaryVideoUrl,
      };
}

class Meta {
  Meta();

  factory Meta.fromJson(Map<String, dynamic> json) => Meta();

  Map<String, dynamic> toJson() => {};
}
