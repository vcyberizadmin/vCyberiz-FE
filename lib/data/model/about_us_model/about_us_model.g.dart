// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'about_us_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AboutUsModelImpl _$$AboutUsModelImplFromJson(Map<String, dynamic> json) =>
    _$AboutUsModelImpl(
      data: json['data'] == null
          ? null
          : AboutUsData.fromJson(json['data'] as Map<String, dynamic>),
      meta: json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AboutUsModelImplToJson(_$AboutUsModelImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
      'meta': instance.meta,
    };

_$AboutUsDataImpl _$$AboutUsDataImplFromJson(Map<String, dynamic> json) =>
    _$AboutUsDataImpl(
      id: (json['id'] as num?)?.toInt(),
      documentId: json['documentId'] as String?,
      sectionLabel: json['sectionLabel'] as String?,
      heading: json['heading'] as String?,
      description: json['description'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      publishedAt: json['publishedAt'] == null
          ? null
          : DateTime.parse(json['publishedAt'] as String),
      videoUrl: json['videoUrl'] == null
          ? null
          : VideoUrl.fromJson(json['videoUrl'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AboutUsDataImplToJson(_$AboutUsDataImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'documentId': instance.documentId,
      'sectionLabel': instance.sectionLabel,
      'heading': instance.heading,
      'description': instance.description,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'publishedAt': instance.publishedAt?.toIso8601String(),
      'videoUrl': instance.videoUrl,
    };

_$VideoUrlImpl _$$VideoUrlImplFromJson(Map<String, dynamic> json) =>
    _$VideoUrlImpl(
      id: (json['id'] as num?)?.toInt(),
      documentId: json['documentId'] as String?,
      name: json['name'] as String?,
      alternativeText: json['alternativeText'],
      caption: json['caption'],
      width: (json['width'] as num?)?.toInt(),
      height: (json['height'] as num?)?.toInt(),
      formats: json['formats'] == null
          ? null
          : Formats.fromJson(json['formats'] as Map<String, dynamic>),
      hash: json['hash'] as String?,
      ext: json['ext'] as String?,
      mime: json['mime'] as String?,
      size: (json['size'] as num?)?.toDouble(),
      url: json['url'] as String?,
      previewUrl: json['previewUrl'],
      provider: json['provider'] as String?,
      providerMetadata: json['provider_metadata'],
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      publishedAt: json['publishedAt'] == null
          ? null
          : DateTime.parse(json['publishedAt'] as String),
    );

Map<String, dynamic> _$$VideoUrlImplToJson(_$VideoUrlImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'documentId': instance.documentId,
      'name': instance.name,
      'alternativeText': instance.alternativeText,
      'caption': instance.caption,
      'width': instance.width,
      'height': instance.height,
      'formats': instance.formats,
      'hash': instance.hash,
      'ext': instance.ext,
      'mime': instance.mime,
      'size': instance.size,
      'url': instance.url,
      'previewUrl': instance.previewUrl,
      'provider': instance.provider,
      'provider_metadata': instance.providerMetadata,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'publishedAt': instance.publishedAt?.toIso8601String(),
    };

_$FormatsImpl _$$FormatsImplFromJson(Map<String, dynamic> json) =>
    _$FormatsImpl(
      large: json['large'] == null
          ? null
          : Large.fromJson(json['large'] as Map<String, dynamic>),
      small: json['small'] == null
          ? null
          : Large.fromJson(json['small'] as Map<String, dynamic>),
      medium: json['medium'] == null
          ? null
          : Large.fromJson(json['medium'] as Map<String, dynamic>),
      thumbnail: json['thumbnail'] == null
          ? null
          : Large.fromJson(json['thumbnail'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$FormatsImplToJson(_$FormatsImpl instance) =>
    <String, dynamic>{
      'large': instance.large,
      'small': instance.small,
      'medium': instance.medium,
      'thumbnail': instance.thumbnail,
    };

_$LargeImpl _$$LargeImplFromJson(Map<String, dynamic> json) => _$LargeImpl(
      ext: json['ext'] as String?,
      url: json['url'] as String?,
      hash: json['hash'] as String?,
      mime: json['mime'] as String?,
      name: json['name'] as String?,
      path: json['path'],
      size: (json['size'] as num?)?.toDouble(),
      width: (json['width'] as num?)?.toInt(),
      height: (json['height'] as num?)?.toInt(),
      sizeInBytes: (json['sizeInBytes'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$LargeImplToJson(_$LargeImpl instance) =>
    <String, dynamic>{
      'ext': instance.ext,
      'url': instance.url,
      'hash': instance.hash,
      'mime': instance.mime,
      'name': instance.name,
      'path': instance.path,
      'size': instance.size,
      'width': instance.width,
      'height': instance.height,
      'sizeInBytes': instance.sizeInBytes,
    };

_$MetaImpl _$$MetaImplFromJson(Map<String, dynamic> json) => _$MetaImpl();

Map<String, dynamic> _$$MetaImplToJson(_$MetaImpl instance) =>
    <String, dynamic>{};
