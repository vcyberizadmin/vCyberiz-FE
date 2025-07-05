// To parse this JSON data, do
//
//     final aboutUsModel = aboutUsModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'about_us_model.freezed.dart';
part 'about_us_model.g.dart';

AboutUsModel aboutUsModelFromJson(String str) =>
    AboutUsModel.fromJson(json.decode(str));

String aboutUsModelToJson(AboutUsModel data) => json.encode(data.toJson());

@freezed
class AboutUsModel with _$AboutUsModel {
  const factory AboutUsModel({
    @JsonKey(name: "data") AboutUsData? data,
    @JsonKey(name: "meta") Meta? meta,
  }) = _AboutUsModel;

  factory AboutUsModel.fromJson(Map<String, dynamic> json) =>
      _$AboutUsModelFromJson(json);
}

@freezed
class AboutUsData with _$AboutUsData {
  const factory AboutUsData({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "documentId") String? documentId,
    @JsonKey(name: "sectionLabel") String? sectionLabel,
    @JsonKey(name: "heading") String? heading,
    @JsonKey(name: "description") String? description,
    @JsonKey(name: "createdAt") DateTime? createdAt,
    @JsonKey(name: "updatedAt") DateTime? updatedAt,
    @JsonKey(name: "publishedAt") DateTime? publishedAt,
    @JsonKey(name: "videoUrl") VideoUrl? videoUrl,
  }) = _AboutUsData;

  factory AboutUsData.fromJson(Map<String, dynamic> json) =>
      _$AboutUsDataFromJson(json);
}

@freezed
class VideoUrl with _$VideoUrl {
  const factory VideoUrl({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "documentId") String? documentId,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "alternativeText") dynamic alternativeText,
    @JsonKey(name: "caption") dynamic caption,
    @JsonKey(name: "width") int? width,
    @JsonKey(name: "height") int? height,
    @JsonKey(name: "formats") Formats? formats,
    @JsonKey(name: "hash") String? hash,
    @JsonKey(name: "ext") String? ext,
    @JsonKey(name: "mime") String? mime,
    @JsonKey(name: "size") double? size,
    @JsonKey(name: "url") String? url,
    @JsonKey(name: "previewUrl") dynamic previewUrl,
    @JsonKey(name: "provider") String? provider,
    @JsonKey(name: "provider_metadata") dynamic providerMetadata,
    @JsonKey(name: "createdAt") DateTime? createdAt,
    @JsonKey(name: "updatedAt") DateTime? updatedAt,
    @JsonKey(name: "publishedAt") DateTime? publishedAt,
  }) = _VideoUrl;

  factory VideoUrl.fromJson(Map<String, dynamic> json) =>
      _$VideoUrlFromJson(json);
}

@freezed
class Formats with _$Formats {
  const factory Formats({
    @JsonKey(name: "large") Large? large,
    @JsonKey(name: "small") Large? small,
    @JsonKey(name: "medium") Large? medium,
    @JsonKey(name: "thumbnail") Large? thumbnail,
  }) = _Formats;

  factory Formats.fromJson(Map<String, dynamic> json) =>
      _$FormatsFromJson(json);
}

@freezed
class Large with _$Large {
  const factory Large({
    @JsonKey(name: "ext") String? ext,
    @JsonKey(name: "url") String? url,
    @JsonKey(name: "hash") String? hash,
    @JsonKey(name: "mime") String? mime,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "path") dynamic path,
    @JsonKey(name: "size") double? size,
    @JsonKey(name: "width") int? width,
    @JsonKey(name: "height") int? height,
    @JsonKey(name: "sizeInBytes") int? sizeInBytes,
  }) = _Large;

  factory Large.fromJson(Map<String, dynamic> json) => _$LargeFromJson(json);
}

@freezed
class Meta with _$Meta {
  const factory Meta() = _Meta;

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);
}
