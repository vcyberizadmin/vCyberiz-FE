// To parse this JSON data, do
//
//     final headerLoadingModel = headerLoadingModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'header_loading_model.freezed.dart';
part 'header_loading_model.g.dart';

HeaderLoadingModel headerLoadingModelFromJson(String str) =>
    HeaderLoadingModel.fromJson(json.decode(str));

String headerLoadingModelToJson(HeaderLoadingModel data) =>
    json.encode(data.toJson());

@freezed
class HeaderLoadingModel with _$HeaderLoadingModel {
  const factory HeaderLoadingModel({
    @JsonKey(name: "data") List<Datum>? data,
    @JsonKey(name: "meta") Meta? meta,
  }) = _HeaderLoadingModel;

  factory HeaderLoadingModel.fromJson(Map<String, dynamic> json) =>
      _$HeaderLoadingModelFromJson(json);
}

@freezed
class Datum with _$Datum {
  const factory Datum({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "documentId") String? documentId,
    @JsonKey(name: "info") String? info,
    @JsonKey(name: "createdAt") DateTime? createdAt,
    @JsonKey(name: "updatedAt") DateTime? updatedAt,
    @JsonKey(name: "publishedAt") DateTime? publishedAt,
    @JsonKey(name: "slug") String? slug,
  }) = _Datum;

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);
}

@freezed
class Meta with _$Meta {
  const factory Meta({
    @JsonKey(name: "pagination") Pagination? pagination,
  }) = _Meta;

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);
}

@freezed
class Pagination with _$Pagination {
  const factory Pagination({
    @JsonKey(name: "page") int? page,
    @JsonKey(name: "pageSize") int? pageSize,
    @JsonKey(name: "pageCount") int? pageCount,
    @JsonKey(name: "total") int? total,
  }) = _Pagination;

  factory Pagination.fromJson(Map<String, dynamic> json) =>
      _$PaginationFromJson(json);
}
