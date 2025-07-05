import 'package:freezed_annotation/freezed_annotation.dart';

part 'contact_us_banner_model.freezed.dart';
part 'contact_us_banner_model.g.dart';

@freezed
class ContactUsBanner with _$ContactUsBanner {
  const factory ContactUsBanner({
    @JsonKey(name: "data") required Data data,
    @JsonKey(name: "meta") required Meta meta,
  }) = _ContactUsBanner;

  factory ContactUsBanner.fromJson(Map<String, dynamic> json) =>
      _$ContactUsBannerFromJson(json);
}

@freezed
class Data with _$Data {
  const factory Data({
    @JsonKey(name: "id") required int id,
    @JsonKey(name: "documentId") required String documentId,
    @JsonKey(name: "sec_header") required String secHeader,
    @JsonKey(name: "createdAt") required DateTime createdAt,
    @JsonKey(name: "updatedAt") required DateTime updatedAt,
    @JsonKey(name: "publishedAt") required DateTime publishedAt,
    @JsonKey(name: "sec_bg") required SecBg secBg,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

@freezed
class SecBg with _$SecBg {
  const factory SecBg({
    @JsonKey(name: "id") required int id,
    @JsonKey(name: "url") required String url,
    @JsonKey(name: "name") required String name,
    @JsonKey(name: "mime") required String mime,
    @JsonKey(name: "label") required String label,
  }) = _SecBg;

  factory SecBg.fromJson(Map<String, dynamic> json) => _$SecBgFromJson(json);
}

@freezed
class Meta with _$Meta {
  const factory Meta() = _Meta;

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);
}
