// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_us_banner_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ContactUsBannerImpl _$$ContactUsBannerImplFromJson(
        Map<String, dynamic> json) =>
    _$ContactUsBannerImpl(
      data: Data.fromJson(json['data'] as Map<String, dynamic>),
      meta: Meta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ContactUsBannerImplToJson(
        _$ContactUsBannerImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
      'meta': instance.meta,
    };

_$DataImpl _$$DataImplFromJson(Map<String, dynamic> json) => _$DataImpl(
      id: (json['id'] as num).toInt(),
      documentId: json['documentId'] as String,
      secHeader: json['sec_header'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      publishedAt: DateTime.parse(json['publishedAt'] as String),
      secBg: SecBg.fromJson(json['sec_bg'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$DataImplToJson(_$DataImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'documentId': instance.documentId,
      'sec_header': instance.secHeader,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'publishedAt': instance.publishedAt.toIso8601String(),
      'sec_bg': instance.secBg,
    };

_$SecBgImpl _$$SecBgImplFromJson(Map<String, dynamic> json) => _$SecBgImpl(
      id: (json['id'] as num).toInt(),
      url: json['url'] as String,
      name: json['name'] as String,
      mime: json['mime'] as String,
      label: json['label'] as String,
    );

Map<String, dynamic> _$$SecBgImplToJson(_$SecBgImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'name': instance.name,
      'mime': instance.mime,
      'label': instance.label,
    };

_$MetaImpl _$$MetaImplFromJson(Map<String, dynamic> json) => _$MetaImpl();

Map<String, dynamic> _$$MetaImplToJson(_$MetaImpl instance) =>
    <String, dynamic>{};
