// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'about_us_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AboutUsModel _$AboutUsModelFromJson(Map<String, dynamic> json) {
  return _AboutUsModel.fromJson(json);
}

/// @nodoc
mixin _$AboutUsModel {
  @JsonKey(name: "data")
  AboutUsData? get data => throw _privateConstructorUsedError;
  @JsonKey(name: "meta")
  Meta? get meta => throw _privateConstructorUsedError;

  /// Serializes this AboutUsModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AboutUsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AboutUsModelCopyWith<AboutUsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AboutUsModelCopyWith<$Res> {
  factory $AboutUsModelCopyWith(
          AboutUsModel value, $Res Function(AboutUsModel) then) =
      _$AboutUsModelCopyWithImpl<$Res, AboutUsModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "data") AboutUsData? data,
      @JsonKey(name: "meta") Meta? meta});

  $AboutUsDataCopyWith<$Res>? get data;
  $MetaCopyWith<$Res>? get meta;
}

/// @nodoc
class _$AboutUsModelCopyWithImpl<$Res, $Val extends AboutUsModel>
    implements $AboutUsModelCopyWith<$Res> {
  _$AboutUsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AboutUsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? meta = freezed,
  }) {
    return _then(_value.copyWith(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as AboutUsData?,
      meta: freezed == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as Meta?,
    ) as $Val);
  }

  /// Create a copy of AboutUsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AboutUsDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $AboutUsDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }

  /// Create a copy of AboutUsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MetaCopyWith<$Res>? get meta {
    if (_value.meta == null) {
      return null;
    }

    return $MetaCopyWith<$Res>(_value.meta!, (value) {
      return _then(_value.copyWith(meta: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AboutUsModelImplCopyWith<$Res>
    implements $AboutUsModelCopyWith<$Res> {
  factory _$$AboutUsModelImplCopyWith(
          _$AboutUsModelImpl value, $Res Function(_$AboutUsModelImpl) then) =
      __$$AboutUsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "data") AboutUsData? data,
      @JsonKey(name: "meta") Meta? meta});

  @override
  $AboutUsDataCopyWith<$Res>? get data;
  @override
  $MetaCopyWith<$Res>? get meta;
}

/// @nodoc
class __$$AboutUsModelImplCopyWithImpl<$Res>
    extends _$AboutUsModelCopyWithImpl<$Res, _$AboutUsModelImpl>
    implements _$$AboutUsModelImplCopyWith<$Res> {
  __$$AboutUsModelImplCopyWithImpl(
      _$AboutUsModelImpl _value, $Res Function(_$AboutUsModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of AboutUsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? meta = freezed,
  }) {
    return _then(_$AboutUsModelImpl(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as AboutUsData?,
      meta: freezed == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as Meta?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AboutUsModelImpl implements _AboutUsModel {
  const _$AboutUsModelImpl(
      {@JsonKey(name: "data") this.data, @JsonKey(name: "meta") this.meta});

  factory _$AboutUsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AboutUsModelImplFromJson(json);

  @override
  @JsonKey(name: "data")
  final AboutUsData? data;
  @override
  @JsonKey(name: "meta")
  final Meta? meta;

  @override
  String toString() {
    return 'AboutUsModel(data: $data, meta: $meta)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AboutUsModelImpl &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.meta, meta) || other.meta == meta));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, data, meta);

  /// Create a copy of AboutUsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AboutUsModelImplCopyWith<_$AboutUsModelImpl> get copyWith =>
      __$$AboutUsModelImplCopyWithImpl<_$AboutUsModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AboutUsModelImplToJson(
      this,
    );
  }
}

abstract class _AboutUsModel implements AboutUsModel {
  const factory _AboutUsModel(
      {@JsonKey(name: "data") final AboutUsData? data,
      @JsonKey(name: "meta") final Meta? meta}) = _$AboutUsModelImpl;

  factory _AboutUsModel.fromJson(Map<String, dynamic> json) =
      _$AboutUsModelImpl.fromJson;

  @override
  @JsonKey(name: "data")
  AboutUsData? get data;
  @override
  @JsonKey(name: "meta")
  Meta? get meta;

  /// Create a copy of AboutUsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AboutUsModelImplCopyWith<_$AboutUsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AboutUsData _$AboutUsDataFromJson(Map<String, dynamic> json) {
  return _AboutUsData.fromJson(json);
}

/// @nodoc
mixin _$AboutUsData {
  @JsonKey(name: "id")
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "documentId")
  String? get documentId => throw _privateConstructorUsedError;
  @JsonKey(name: "sectionLabel")
  String? get sectionLabel => throw _privateConstructorUsedError;
  @JsonKey(name: "heading")
  String? get heading => throw _privateConstructorUsedError;
  @JsonKey(name: "description")
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: "createdAt")
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "updatedAt")
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: "publishedAt")
  DateTime? get publishedAt => throw _privateConstructorUsedError;
  @JsonKey(name: "videoUrl")
  VideoUrl? get videoUrl => throw _privateConstructorUsedError;

  /// Serializes this AboutUsData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AboutUsData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AboutUsDataCopyWith<AboutUsData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AboutUsDataCopyWith<$Res> {
  factory $AboutUsDataCopyWith(
          AboutUsData value, $Res Function(AboutUsData) then) =
      _$AboutUsDataCopyWithImpl<$Res, AboutUsData>;
  @useResult
  $Res call(
      {@JsonKey(name: "id") int? id,
      @JsonKey(name: "documentId") String? documentId,
      @JsonKey(name: "sectionLabel") String? sectionLabel,
      @JsonKey(name: "heading") String? heading,
      @JsonKey(name: "description") String? description,
      @JsonKey(name: "createdAt") DateTime? createdAt,
      @JsonKey(name: "updatedAt") DateTime? updatedAt,
      @JsonKey(name: "publishedAt") DateTime? publishedAt,
      @JsonKey(name: "videoUrl") VideoUrl? videoUrl});

  $VideoUrlCopyWith<$Res>? get videoUrl;
}

/// @nodoc
class _$AboutUsDataCopyWithImpl<$Res, $Val extends AboutUsData>
    implements $AboutUsDataCopyWith<$Res> {
  _$AboutUsDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AboutUsData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? documentId = freezed,
    Object? sectionLabel = freezed,
    Object? heading = freezed,
    Object? description = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? publishedAt = freezed,
    Object? videoUrl = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      documentId: freezed == documentId
          ? _value.documentId
          : documentId // ignore: cast_nullable_to_non_nullable
              as String?,
      sectionLabel: freezed == sectionLabel
          ? _value.sectionLabel
          : sectionLabel // ignore: cast_nullable_to_non_nullable
              as String?,
      heading: freezed == heading
          ? _value.heading
          : heading // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      publishedAt: freezed == publishedAt
          ? _value.publishedAt
          : publishedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      videoUrl: freezed == videoUrl
          ? _value.videoUrl
          : videoUrl // ignore: cast_nullable_to_non_nullable
              as VideoUrl?,
    ) as $Val);
  }

  /// Create a copy of AboutUsData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VideoUrlCopyWith<$Res>? get videoUrl {
    if (_value.videoUrl == null) {
      return null;
    }

    return $VideoUrlCopyWith<$Res>(_value.videoUrl!, (value) {
      return _then(_value.copyWith(videoUrl: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AboutUsDataImplCopyWith<$Res>
    implements $AboutUsDataCopyWith<$Res> {
  factory _$$AboutUsDataImplCopyWith(
          _$AboutUsDataImpl value, $Res Function(_$AboutUsDataImpl) then) =
      __$$AboutUsDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "id") int? id,
      @JsonKey(name: "documentId") String? documentId,
      @JsonKey(name: "sectionLabel") String? sectionLabel,
      @JsonKey(name: "heading") String? heading,
      @JsonKey(name: "description") String? description,
      @JsonKey(name: "createdAt") DateTime? createdAt,
      @JsonKey(name: "updatedAt") DateTime? updatedAt,
      @JsonKey(name: "publishedAt") DateTime? publishedAt,
      @JsonKey(name: "videoUrl") VideoUrl? videoUrl});

  @override
  $VideoUrlCopyWith<$Res>? get videoUrl;
}

/// @nodoc
class __$$AboutUsDataImplCopyWithImpl<$Res>
    extends _$AboutUsDataCopyWithImpl<$Res, _$AboutUsDataImpl>
    implements _$$AboutUsDataImplCopyWith<$Res> {
  __$$AboutUsDataImplCopyWithImpl(
      _$AboutUsDataImpl _value, $Res Function(_$AboutUsDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of AboutUsData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? documentId = freezed,
    Object? sectionLabel = freezed,
    Object? heading = freezed,
    Object? description = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? publishedAt = freezed,
    Object? videoUrl = freezed,
  }) {
    return _then(_$AboutUsDataImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      documentId: freezed == documentId
          ? _value.documentId
          : documentId // ignore: cast_nullable_to_non_nullable
              as String?,
      sectionLabel: freezed == sectionLabel
          ? _value.sectionLabel
          : sectionLabel // ignore: cast_nullable_to_non_nullable
              as String?,
      heading: freezed == heading
          ? _value.heading
          : heading // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      publishedAt: freezed == publishedAt
          ? _value.publishedAt
          : publishedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      videoUrl: freezed == videoUrl
          ? _value.videoUrl
          : videoUrl // ignore: cast_nullable_to_non_nullable
              as VideoUrl?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AboutUsDataImpl implements _AboutUsData {
  const _$AboutUsDataImpl(
      {@JsonKey(name: "id") this.id,
      @JsonKey(name: "documentId") this.documentId,
      @JsonKey(name: "sectionLabel") this.sectionLabel,
      @JsonKey(name: "heading") this.heading,
      @JsonKey(name: "description") this.description,
      @JsonKey(name: "createdAt") this.createdAt,
      @JsonKey(name: "updatedAt") this.updatedAt,
      @JsonKey(name: "publishedAt") this.publishedAt,
      @JsonKey(name: "videoUrl") this.videoUrl});

  factory _$AboutUsDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$AboutUsDataImplFromJson(json);

  @override
  @JsonKey(name: "id")
  final int? id;
  @override
  @JsonKey(name: "documentId")
  final String? documentId;
  @override
  @JsonKey(name: "sectionLabel")
  final String? sectionLabel;
  @override
  @JsonKey(name: "heading")
  final String? heading;
  @override
  @JsonKey(name: "description")
  final String? description;
  @override
  @JsonKey(name: "createdAt")
  final DateTime? createdAt;
  @override
  @JsonKey(name: "updatedAt")
  final DateTime? updatedAt;
  @override
  @JsonKey(name: "publishedAt")
  final DateTime? publishedAt;
  @override
  @JsonKey(name: "videoUrl")
  final VideoUrl? videoUrl;

  @override
  String toString() {
    return 'AboutUsData(id: $id, documentId: $documentId, sectionLabel: $sectionLabel, heading: $heading, description: $description, createdAt: $createdAt, updatedAt: $updatedAt, publishedAt: $publishedAt, videoUrl: $videoUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AboutUsDataImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.documentId, documentId) ||
                other.documentId == documentId) &&
            (identical(other.sectionLabel, sectionLabel) ||
                other.sectionLabel == sectionLabel) &&
            (identical(other.heading, heading) || other.heading == heading) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.publishedAt, publishedAt) ||
                other.publishedAt == publishedAt) &&
            (identical(other.videoUrl, videoUrl) ||
                other.videoUrl == videoUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, documentId, sectionLabel,
      heading, description, createdAt, updatedAt, publishedAt, videoUrl);

  /// Create a copy of AboutUsData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AboutUsDataImplCopyWith<_$AboutUsDataImpl> get copyWith =>
      __$$AboutUsDataImplCopyWithImpl<_$AboutUsDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AboutUsDataImplToJson(
      this,
    );
  }
}

abstract class _AboutUsData implements AboutUsData {
  const factory _AboutUsData(
      {@JsonKey(name: "id") final int? id,
      @JsonKey(name: "documentId") final String? documentId,
      @JsonKey(name: "sectionLabel") final String? sectionLabel,
      @JsonKey(name: "heading") final String? heading,
      @JsonKey(name: "description") final String? description,
      @JsonKey(name: "createdAt") final DateTime? createdAt,
      @JsonKey(name: "updatedAt") final DateTime? updatedAt,
      @JsonKey(name: "publishedAt") final DateTime? publishedAt,
      @JsonKey(name: "videoUrl") final VideoUrl? videoUrl}) = _$AboutUsDataImpl;

  factory _AboutUsData.fromJson(Map<String, dynamic> json) =
      _$AboutUsDataImpl.fromJson;

  @override
  @JsonKey(name: "id")
  int? get id;
  @override
  @JsonKey(name: "documentId")
  String? get documentId;
  @override
  @JsonKey(name: "sectionLabel")
  String? get sectionLabel;
  @override
  @JsonKey(name: "heading")
  String? get heading;
  @override
  @JsonKey(name: "description")
  String? get description;
  @override
  @JsonKey(name: "createdAt")
  DateTime? get createdAt;
  @override
  @JsonKey(name: "updatedAt")
  DateTime? get updatedAt;
  @override
  @JsonKey(name: "publishedAt")
  DateTime? get publishedAt;
  @override
  @JsonKey(name: "videoUrl")
  VideoUrl? get videoUrl;

  /// Create a copy of AboutUsData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AboutUsDataImplCopyWith<_$AboutUsDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

VideoUrl _$VideoUrlFromJson(Map<String, dynamic> json) {
  return _VideoUrl.fromJson(json);
}

/// @nodoc
mixin _$VideoUrl {
  @JsonKey(name: "id")
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "documentId")
  String? get documentId => throw _privateConstructorUsedError;
  @JsonKey(name: "name")
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: "alternativeText")
  dynamic get alternativeText => throw _privateConstructorUsedError;
  @JsonKey(name: "caption")
  dynamic get caption => throw _privateConstructorUsedError;
  @JsonKey(name: "width")
  int? get width => throw _privateConstructorUsedError;
  @JsonKey(name: "height")
  int? get height => throw _privateConstructorUsedError;
  @JsonKey(name: "formats")
  Formats? get formats => throw _privateConstructorUsedError;
  @JsonKey(name: "hash")
  String? get hash => throw _privateConstructorUsedError;
  @JsonKey(name: "ext")
  String? get ext => throw _privateConstructorUsedError;
  @JsonKey(name: "mime")
  String? get mime => throw _privateConstructorUsedError;
  @JsonKey(name: "size")
  double? get size => throw _privateConstructorUsedError;
  @JsonKey(name: "url")
  String? get url => throw _privateConstructorUsedError;
  @JsonKey(name: "previewUrl")
  dynamic get previewUrl => throw _privateConstructorUsedError;
  @JsonKey(name: "provider")
  String? get provider => throw _privateConstructorUsedError;
  @JsonKey(name: "provider_metadata")
  dynamic get providerMetadata => throw _privateConstructorUsedError;
  @JsonKey(name: "createdAt")
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "updatedAt")
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: "publishedAt")
  DateTime? get publishedAt => throw _privateConstructorUsedError;

  /// Serializes this VideoUrl to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VideoUrl
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VideoUrlCopyWith<VideoUrl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VideoUrlCopyWith<$Res> {
  factory $VideoUrlCopyWith(VideoUrl value, $Res Function(VideoUrl) then) =
      _$VideoUrlCopyWithImpl<$Res, VideoUrl>;
  @useResult
  $Res call(
      {@JsonKey(name: "id") int? id,
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
      @JsonKey(name: "publishedAt") DateTime? publishedAt});

  $FormatsCopyWith<$Res>? get formats;
}

/// @nodoc
class _$VideoUrlCopyWithImpl<$Res, $Val extends VideoUrl>
    implements $VideoUrlCopyWith<$Res> {
  _$VideoUrlCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VideoUrl
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? documentId = freezed,
    Object? name = freezed,
    Object? alternativeText = freezed,
    Object? caption = freezed,
    Object? width = freezed,
    Object? height = freezed,
    Object? formats = freezed,
    Object? hash = freezed,
    Object? ext = freezed,
    Object? mime = freezed,
    Object? size = freezed,
    Object? url = freezed,
    Object? previewUrl = freezed,
    Object? provider = freezed,
    Object? providerMetadata = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? publishedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      documentId: freezed == documentId
          ? _value.documentId
          : documentId // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      alternativeText: freezed == alternativeText
          ? _value.alternativeText
          : alternativeText // ignore: cast_nullable_to_non_nullable
              as dynamic,
      caption: freezed == caption
          ? _value.caption
          : caption // ignore: cast_nullable_to_non_nullable
              as dynamic,
      width: freezed == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int?,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int?,
      formats: freezed == formats
          ? _value.formats
          : formats // ignore: cast_nullable_to_non_nullable
              as Formats?,
      hash: freezed == hash
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String?,
      ext: freezed == ext
          ? _value.ext
          : ext // ignore: cast_nullable_to_non_nullable
              as String?,
      mime: freezed == mime
          ? _value.mime
          : mime // ignore: cast_nullable_to_non_nullable
              as String?,
      size: freezed == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as double?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      previewUrl: freezed == previewUrl
          ? _value.previewUrl
          : previewUrl // ignore: cast_nullable_to_non_nullable
              as dynamic,
      provider: freezed == provider
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as String?,
      providerMetadata: freezed == providerMetadata
          ? _value.providerMetadata
          : providerMetadata // ignore: cast_nullable_to_non_nullable
              as dynamic,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      publishedAt: freezed == publishedAt
          ? _value.publishedAt
          : publishedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  /// Create a copy of VideoUrl
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FormatsCopyWith<$Res>? get formats {
    if (_value.formats == null) {
      return null;
    }

    return $FormatsCopyWith<$Res>(_value.formats!, (value) {
      return _then(_value.copyWith(formats: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$VideoUrlImplCopyWith<$Res>
    implements $VideoUrlCopyWith<$Res> {
  factory _$$VideoUrlImplCopyWith(
          _$VideoUrlImpl value, $Res Function(_$VideoUrlImpl) then) =
      __$$VideoUrlImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "id") int? id,
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
      @JsonKey(name: "publishedAt") DateTime? publishedAt});

  @override
  $FormatsCopyWith<$Res>? get formats;
}

/// @nodoc
class __$$VideoUrlImplCopyWithImpl<$Res>
    extends _$VideoUrlCopyWithImpl<$Res, _$VideoUrlImpl>
    implements _$$VideoUrlImplCopyWith<$Res> {
  __$$VideoUrlImplCopyWithImpl(
      _$VideoUrlImpl _value, $Res Function(_$VideoUrlImpl) _then)
      : super(_value, _then);

  /// Create a copy of VideoUrl
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? documentId = freezed,
    Object? name = freezed,
    Object? alternativeText = freezed,
    Object? caption = freezed,
    Object? width = freezed,
    Object? height = freezed,
    Object? formats = freezed,
    Object? hash = freezed,
    Object? ext = freezed,
    Object? mime = freezed,
    Object? size = freezed,
    Object? url = freezed,
    Object? previewUrl = freezed,
    Object? provider = freezed,
    Object? providerMetadata = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? publishedAt = freezed,
  }) {
    return _then(_$VideoUrlImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      documentId: freezed == documentId
          ? _value.documentId
          : documentId // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      alternativeText: freezed == alternativeText
          ? _value.alternativeText
          : alternativeText // ignore: cast_nullable_to_non_nullable
              as dynamic,
      caption: freezed == caption
          ? _value.caption
          : caption // ignore: cast_nullable_to_non_nullable
              as dynamic,
      width: freezed == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int?,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int?,
      formats: freezed == formats
          ? _value.formats
          : formats // ignore: cast_nullable_to_non_nullable
              as Formats?,
      hash: freezed == hash
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String?,
      ext: freezed == ext
          ? _value.ext
          : ext // ignore: cast_nullable_to_non_nullable
              as String?,
      mime: freezed == mime
          ? _value.mime
          : mime // ignore: cast_nullable_to_non_nullable
              as String?,
      size: freezed == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as double?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      previewUrl: freezed == previewUrl
          ? _value.previewUrl
          : previewUrl // ignore: cast_nullable_to_non_nullable
              as dynamic,
      provider: freezed == provider
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as String?,
      providerMetadata: freezed == providerMetadata
          ? _value.providerMetadata
          : providerMetadata // ignore: cast_nullable_to_non_nullable
              as dynamic,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      publishedAt: freezed == publishedAt
          ? _value.publishedAt
          : publishedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VideoUrlImpl implements _VideoUrl {
  const _$VideoUrlImpl(
      {@JsonKey(name: "id") this.id,
      @JsonKey(name: "documentId") this.documentId,
      @JsonKey(name: "name") this.name,
      @JsonKey(name: "alternativeText") this.alternativeText,
      @JsonKey(name: "caption") this.caption,
      @JsonKey(name: "width") this.width,
      @JsonKey(name: "height") this.height,
      @JsonKey(name: "formats") this.formats,
      @JsonKey(name: "hash") this.hash,
      @JsonKey(name: "ext") this.ext,
      @JsonKey(name: "mime") this.mime,
      @JsonKey(name: "size") this.size,
      @JsonKey(name: "url") this.url,
      @JsonKey(name: "previewUrl") this.previewUrl,
      @JsonKey(name: "provider") this.provider,
      @JsonKey(name: "provider_metadata") this.providerMetadata,
      @JsonKey(name: "createdAt") this.createdAt,
      @JsonKey(name: "updatedAt") this.updatedAt,
      @JsonKey(name: "publishedAt") this.publishedAt});

  factory _$VideoUrlImpl.fromJson(Map<String, dynamic> json) =>
      _$$VideoUrlImplFromJson(json);

  @override
  @JsonKey(name: "id")
  final int? id;
  @override
  @JsonKey(name: "documentId")
  final String? documentId;
  @override
  @JsonKey(name: "name")
  final String? name;
  @override
  @JsonKey(name: "alternativeText")
  final dynamic alternativeText;
  @override
  @JsonKey(name: "caption")
  final dynamic caption;
  @override
  @JsonKey(name: "width")
  final int? width;
  @override
  @JsonKey(name: "height")
  final int? height;
  @override
  @JsonKey(name: "formats")
  final Formats? formats;
  @override
  @JsonKey(name: "hash")
  final String? hash;
  @override
  @JsonKey(name: "ext")
  final String? ext;
  @override
  @JsonKey(name: "mime")
  final String? mime;
  @override
  @JsonKey(name: "size")
  final double? size;
  @override
  @JsonKey(name: "url")
  final String? url;
  @override
  @JsonKey(name: "previewUrl")
  final dynamic previewUrl;
  @override
  @JsonKey(name: "provider")
  final String? provider;
  @override
  @JsonKey(name: "provider_metadata")
  final dynamic providerMetadata;
  @override
  @JsonKey(name: "createdAt")
  final DateTime? createdAt;
  @override
  @JsonKey(name: "updatedAt")
  final DateTime? updatedAt;
  @override
  @JsonKey(name: "publishedAt")
  final DateTime? publishedAt;

  @override
  String toString() {
    return 'VideoUrl(id: $id, documentId: $documentId, name: $name, alternativeText: $alternativeText, caption: $caption, width: $width, height: $height, formats: $formats, hash: $hash, ext: $ext, mime: $mime, size: $size, url: $url, previewUrl: $previewUrl, provider: $provider, providerMetadata: $providerMetadata, createdAt: $createdAt, updatedAt: $updatedAt, publishedAt: $publishedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VideoUrlImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.documentId, documentId) ||
                other.documentId == documentId) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality()
                .equals(other.alternativeText, alternativeText) &&
            const DeepCollectionEquality().equals(other.caption, caption) &&
            (identical(other.width, width) || other.width == width) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.formats, formats) || other.formats == formats) &&
            (identical(other.hash, hash) || other.hash == hash) &&
            (identical(other.ext, ext) || other.ext == ext) &&
            (identical(other.mime, mime) || other.mime == mime) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.url, url) || other.url == url) &&
            const DeepCollectionEquality()
                .equals(other.previewUrl, previewUrl) &&
            (identical(other.provider, provider) ||
                other.provider == provider) &&
            const DeepCollectionEquality()
                .equals(other.providerMetadata, providerMetadata) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.publishedAt, publishedAt) ||
                other.publishedAt == publishedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        documentId,
        name,
        const DeepCollectionEquality().hash(alternativeText),
        const DeepCollectionEquality().hash(caption),
        width,
        height,
        formats,
        hash,
        ext,
        mime,
        size,
        url,
        const DeepCollectionEquality().hash(previewUrl),
        provider,
        const DeepCollectionEquality().hash(providerMetadata),
        createdAt,
        updatedAt,
        publishedAt
      ]);

  /// Create a copy of VideoUrl
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VideoUrlImplCopyWith<_$VideoUrlImpl> get copyWith =>
      __$$VideoUrlImplCopyWithImpl<_$VideoUrlImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VideoUrlImplToJson(
      this,
    );
  }
}

abstract class _VideoUrl implements VideoUrl {
  const factory _VideoUrl(
          {@JsonKey(name: "id") final int? id,
          @JsonKey(name: "documentId") final String? documentId,
          @JsonKey(name: "name") final String? name,
          @JsonKey(name: "alternativeText") final dynamic alternativeText,
          @JsonKey(name: "caption") final dynamic caption,
          @JsonKey(name: "width") final int? width,
          @JsonKey(name: "height") final int? height,
          @JsonKey(name: "formats") final Formats? formats,
          @JsonKey(name: "hash") final String? hash,
          @JsonKey(name: "ext") final String? ext,
          @JsonKey(name: "mime") final String? mime,
          @JsonKey(name: "size") final double? size,
          @JsonKey(name: "url") final String? url,
          @JsonKey(name: "previewUrl") final dynamic previewUrl,
          @JsonKey(name: "provider") final String? provider,
          @JsonKey(name: "provider_metadata") final dynamic providerMetadata,
          @JsonKey(name: "createdAt") final DateTime? createdAt,
          @JsonKey(name: "updatedAt") final DateTime? updatedAt,
          @JsonKey(name: "publishedAt") final DateTime? publishedAt}) =
      _$VideoUrlImpl;

  factory _VideoUrl.fromJson(Map<String, dynamic> json) =
      _$VideoUrlImpl.fromJson;

  @override
  @JsonKey(name: "id")
  int? get id;
  @override
  @JsonKey(name: "documentId")
  String? get documentId;
  @override
  @JsonKey(name: "name")
  String? get name;
  @override
  @JsonKey(name: "alternativeText")
  dynamic get alternativeText;
  @override
  @JsonKey(name: "caption")
  dynamic get caption;
  @override
  @JsonKey(name: "width")
  int? get width;
  @override
  @JsonKey(name: "height")
  int? get height;
  @override
  @JsonKey(name: "formats")
  Formats? get formats;
  @override
  @JsonKey(name: "hash")
  String? get hash;
  @override
  @JsonKey(name: "ext")
  String? get ext;
  @override
  @JsonKey(name: "mime")
  String? get mime;
  @override
  @JsonKey(name: "size")
  double? get size;
  @override
  @JsonKey(name: "url")
  String? get url;
  @override
  @JsonKey(name: "previewUrl")
  dynamic get previewUrl;
  @override
  @JsonKey(name: "provider")
  String? get provider;
  @override
  @JsonKey(name: "provider_metadata")
  dynamic get providerMetadata;
  @override
  @JsonKey(name: "createdAt")
  DateTime? get createdAt;
  @override
  @JsonKey(name: "updatedAt")
  DateTime? get updatedAt;
  @override
  @JsonKey(name: "publishedAt")
  DateTime? get publishedAt;

  /// Create a copy of VideoUrl
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VideoUrlImplCopyWith<_$VideoUrlImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Formats _$FormatsFromJson(Map<String, dynamic> json) {
  return _Formats.fromJson(json);
}

/// @nodoc
mixin _$Formats {
  @JsonKey(name: "large")
  Large? get large => throw _privateConstructorUsedError;
  @JsonKey(name: "small")
  Large? get small => throw _privateConstructorUsedError;
  @JsonKey(name: "medium")
  Large? get medium => throw _privateConstructorUsedError;
  @JsonKey(name: "thumbnail")
  Large? get thumbnail => throw _privateConstructorUsedError;

  /// Serializes this Formats to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Formats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FormatsCopyWith<Formats> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FormatsCopyWith<$Res> {
  factory $FormatsCopyWith(Formats value, $Res Function(Formats) then) =
      _$FormatsCopyWithImpl<$Res, Formats>;
  @useResult
  $Res call(
      {@JsonKey(name: "large") Large? large,
      @JsonKey(name: "small") Large? small,
      @JsonKey(name: "medium") Large? medium,
      @JsonKey(name: "thumbnail") Large? thumbnail});

  $LargeCopyWith<$Res>? get large;
  $LargeCopyWith<$Res>? get small;
  $LargeCopyWith<$Res>? get medium;
  $LargeCopyWith<$Res>? get thumbnail;
}

/// @nodoc
class _$FormatsCopyWithImpl<$Res, $Val extends Formats>
    implements $FormatsCopyWith<$Res> {
  _$FormatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Formats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? large = freezed,
    Object? small = freezed,
    Object? medium = freezed,
    Object? thumbnail = freezed,
  }) {
    return _then(_value.copyWith(
      large: freezed == large
          ? _value.large
          : large // ignore: cast_nullable_to_non_nullable
              as Large?,
      small: freezed == small
          ? _value.small
          : small // ignore: cast_nullable_to_non_nullable
              as Large?,
      medium: freezed == medium
          ? _value.medium
          : medium // ignore: cast_nullable_to_non_nullable
              as Large?,
      thumbnail: freezed == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as Large?,
    ) as $Val);
  }

  /// Create a copy of Formats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LargeCopyWith<$Res>? get large {
    if (_value.large == null) {
      return null;
    }

    return $LargeCopyWith<$Res>(_value.large!, (value) {
      return _then(_value.copyWith(large: value) as $Val);
    });
  }

  /// Create a copy of Formats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LargeCopyWith<$Res>? get small {
    if (_value.small == null) {
      return null;
    }

    return $LargeCopyWith<$Res>(_value.small!, (value) {
      return _then(_value.copyWith(small: value) as $Val);
    });
  }

  /// Create a copy of Formats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LargeCopyWith<$Res>? get medium {
    if (_value.medium == null) {
      return null;
    }

    return $LargeCopyWith<$Res>(_value.medium!, (value) {
      return _then(_value.copyWith(medium: value) as $Val);
    });
  }

  /// Create a copy of Formats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LargeCopyWith<$Res>? get thumbnail {
    if (_value.thumbnail == null) {
      return null;
    }

    return $LargeCopyWith<$Res>(_value.thumbnail!, (value) {
      return _then(_value.copyWith(thumbnail: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FormatsImplCopyWith<$Res> implements $FormatsCopyWith<$Res> {
  factory _$$FormatsImplCopyWith(
          _$FormatsImpl value, $Res Function(_$FormatsImpl) then) =
      __$$FormatsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "large") Large? large,
      @JsonKey(name: "small") Large? small,
      @JsonKey(name: "medium") Large? medium,
      @JsonKey(name: "thumbnail") Large? thumbnail});

  @override
  $LargeCopyWith<$Res>? get large;
  @override
  $LargeCopyWith<$Res>? get small;
  @override
  $LargeCopyWith<$Res>? get medium;
  @override
  $LargeCopyWith<$Res>? get thumbnail;
}

/// @nodoc
class __$$FormatsImplCopyWithImpl<$Res>
    extends _$FormatsCopyWithImpl<$Res, _$FormatsImpl>
    implements _$$FormatsImplCopyWith<$Res> {
  __$$FormatsImplCopyWithImpl(
      _$FormatsImpl _value, $Res Function(_$FormatsImpl) _then)
      : super(_value, _then);

  /// Create a copy of Formats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? large = freezed,
    Object? small = freezed,
    Object? medium = freezed,
    Object? thumbnail = freezed,
  }) {
    return _then(_$FormatsImpl(
      large: freezed == large
          ? _value.large
          : large // ignore: cast_nullable_to_non_nullable
              as Large?,
      small: freezed == small
          ? _value.small
          : small // ignore: cast_nullable_to_non_nullable
              as Large?,
      medium: freezed == medium
          ? _value.medium
          : medium // ignore: cast_nullable_to_non_nullable
              as Large?,
      thumbnail: freezed == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as Large?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FormatsImpl implements _Formats {
  const _$FormatsImpl(
      {@JsonKey(name: "large") this.large,
      @JsonKey(name: "small") this.small,
      @JsonKey(name: "medium") this.medium,
      @JsonKey(name: "thumbnail") this.thumbnail});

  factory _$FormatsImpl.fromJson(Map<String, dynamic> json) =>
      _$$FormatsImplFromJson(json);

  @override
  @JsonKey(name: "large")
  final Large? large;
  @override
  @JsonKey(name: "small")
  final Large? small;
  @override
  @JsonKey(name: "medium")
  final Large? medium;
  @override
  @JsonKey(name: "thumbnail")
  final Large? thumbnail;

  @override
  String toString() {
    return 'Formats(large: $large, small: $small, medium: $medium, thumbnail: $thumbnail)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FormatsImpl &&
            (identical(other.large, large) || other.large == large) &&
            (identical(other.small, small) || other.small == small) &&
            (identical(other.medium, medium) || other.medium == medium) &&
            (identical(other.thumbnail, thumbnail) ||
                other.thumbnail == thumbnail));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, large, small, medium, thumbnail);

  /// Create a copy of Formats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FormatsImplCopyWith<_$FormatsImpl> get copyWith =>
      __$$FormatsImplCopyWithImpl<_$FormatsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FormatsImplToJson(
      this,
    );
  }
}

abstract class _Formats implements Formats {
  const factory _Formats(
      {@JsonKey(name: "large") final Large? large,
      @JsonKey(name: "small") final Large? small,
      @JsonKey(name: "medium") final Large? medium,
      @JsonKey(name: "thumbnail") final Large? thumbnail}) = _$FormatsImpl;

  factory _Formats.fromJson(Map<String, dynamic> json) = _$FormatsImpl.fromJson;

  @override
  @JsonKey(name: "large")
  Large? get large;
  @override
  @JsonKey(name: "small")
  Large? get small;
  @override
  @JsonKey(name: "medium")
  Large? get medium;
  @override
  @JsonKey(name: "thumbnail")
  Large? get thumbnail;

  /// Create a copy of Formats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FormatsImplCopyWith<_$FormatsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Large _$LargeFromJson(Map<String, dynamic> json) {
  return _Large.fromJson(json);
}

/// @nodoc
mixin _$Large {
  @JsonKey(name: "ext")
  String? get ext => throw _privateConstructorUsedError;
  @JsonKey(name: "url")
  String? get url => throw _privateConstructorUsedError;
  @JsonKey(name: "hash")
  String? get hash => throw _privateConstructorUsedError;
  @JsonKey(name: "mime")
  String? get mime => throw _privateConstructorUsedError;
  @JsonKey(name: "name")
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: "path")
  dynamic get path => throw _privateConstructorUsedError;
  @JsonKey(name: "size")
  double? get size => throw _privateConstructorUsedError;
  @JsonKey(name: "width")
  int? get width => throw _privateConstructorUsedError;
  @JsonKey(name: "height")
  int? get height => throw _privateConstructorUsedError;
  @JsonKey(name: "sizeInBytes")
  int? get sizeInBytes => throw _privateConstructorUsedError;

  /// Serializes this Large to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Large
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LargeCopyWith<Large> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LargeCopyWith<$Res> {
  factory $LargeCopyWith(Large value, $Res Function(Large) then) =
      _$LargeCopyWithImpl<$Res, Large>;
  @useResult
  $Res call(
      {@JsonKey(name: "ext") String? ext,
      @JsonKey(name: "url") String? url,
      @JsonKey(name: "hash") String? hash,
      @JsonKey(name: "mime") String? mime,
      @JsonKey(name: "name") String? name,
      @JsonKey(name: "path") dynamic path,
      @JsonKey(name: "size") double? size,
      @JsonKey(name: "width") int? width,
      @JsonKey(name: "height") int? height,
      @JsonKey(name: "sizeInBytes") int? sizeInBytes});
}

/// @nodoc
class _$LargeCopyWithImpl<$Res, $Val extends Large>
    implements $LargeCopyWith<$Res> {
  _$LargeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Large
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ext = freezed,
    Object? url = freezed,
    Object? hash = freezed,
    Object? mime = freezed,
    Object? name = freezed,
    Object? path = freezed,
    Object? size = freezed,
    Object? width = freezed,
    Object? height = freezed,
    Object? sizeInBytes = freezed,
  }) {
    return _then(_value.copyWith(
      ext: freezed == ext
          ? _value.ext
          : ext // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      hash: freezed == hash
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String?,
      mime: freezed == mime
          ? _value.mime
          : mime // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      path: freezed == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as dynamic,
      size: freezed == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as double?,
      width: freezed == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int?,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int?,
      sizeInBytes: freezed == sizeInBytes
          ? _value.sizeInBytes
          : sizeInBytes // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LargeImplCopyWith<$Res> implements $LargeCopyWith<$Res> {
  factory _$$LargeImplCopyWith(
          _$LargeImpl value, $Res Function(_$LargeImpl) then) =
      __$$LargeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "ext") String? ext,
      @JsonKey(name: "url") String? url,
      @JsonKey(name: "hash") String? hash,
      @JsonKey(name: "mime") String? mime,
      @JsonKey(name: "name") String? name,
      @JsonKey(name: "path") dynamic path,
      @JsonKey(name: "size") double? size,
      @JsonKey(name: "width") int? width,
      @JsonKey(name: "height") int? height,
      @JsonKey(name: "sizeInBytes") int? sizeInBytes});
}

/// @nodoc
class __$$LargeImplCopyWithImpl<$Res>
    extends _$LargeCopyWithImpl<$Res, _$LargeImpl>
    implements _$$LargeImplCopyWith<$Res> {
  __$$LargeImplCopyWithImpl(
      _$LargeImpl _value, $Res Function(_$LargeImpl) _then)
      : super(_value, _then);

  /// Create a copy of Large
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ext = freezed,
    Object? url = freezed,
    Object? hash = freezed,
    Object? mime = freezed,
    Object? name = freezed,
    Object? path = freezed,
    Object? size = freezed,
    Object? width = freezed,
    Object? height = freezed,
    Object? sizeInBytes = freezed,
  }) {
    return _then(_$LargeImpl(
      ext: freezed == ext
          ? _value.ext
          : ext // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      hash: freezed == hash
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String?,
      mime: freezed == mime
          ? _value.mime
          : mime // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      path: freezed == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as dynamic,
      size: freezed == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as double?,
      width: freezed == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int?,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int?,
      sizeInBytes: freezed == sizeInBytes
          ? _value.sizeInBytes
          : sizeInBytes // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LargeImpl implements _Large {
  const _$LargeImpl(
      {@JsonKey(name: "ext") this.ext,
      @JsonKey(name: "url") this.url,
      @JsonKey(name: "hash") this.hash,
      @JsonKey(name: "mime") this.mime,
      @JsonKey(name: "name") this.name,
      @JsonKey(name: "path") this.path,
      @JsonKey(name: "size") this.size,
      @JsonKey(name: "width") this.width,
      @JsonKey(name: "height") this.height,
      @JsonKey(name: "sizeInBytes") this.sizeInBytes});

  factory _$LargeImpl.fromJson(Map<String, dynamic> json) =>
      _$$LargeImplFromJson(json);

  @override
  @JsonKey(name: "ext")
  final String? ext;
  @override
  @JsonKey(name: "url")
  final String? url;
  @override
  @JsonKey(name: "hash")
  final String? hash;
  @override
  @JsonKey(name: "mime")
  final String? mime;
  @override
  @JsonKey(name: "name")
  final String? name;
  @override
  @JsonKey(name: "path")
  final dynamic path;
  @override
  @JsonKey(name: "size")
  final double? size;
  @override
  @JsonKey(name: "width")
  final int? width;
  @override
  @JsonKey(name: "height")
  final int? height;
  @override
  @JsonKey(name: "sizeInBytes")
  final int? sizeInBytes;

  @override
  String toString() {
    return 'Large(ext: $ext, url: $url, hash: $hash, mime: $mime, name: $name, path: $path, size: $size, width: $width, height: $height, sizeInBytes: $sizeInBytes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LargeImpl &&
            (identical(other.ext, ext) || other.ext == ext) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.hash, hash) || other.hash == hash) &&
            (identical(other.mime, mime) || other.mime == mime) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other.path, path) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.width, width) || other.width == width) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.sizeInBytes, sizeInBytes) ||
                other.sizeInBytes == sizeInBytes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      ext,
      url,
      hash,
      mime,
      name,
      const DeepCollectionEquality().hash(path),
      size,
      width,
      height,
      sizeInBytes);

  /// Create a copy of Large
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LargeImplCopyWith<_$LargeImpl> get copyWith =>
      __$$LargeImplCopyWithImpl<_$LargeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LargeImplToJson(
      this,
    );
  }
}

abstract class _Large implements Large {
  const factory _Large(
      {@JsonKey(name: "ext") final String? ext,
      @JsonKey(name: "url") final String? url,
      @JsonKey(name: "hash") final String? hash,
      @JsonKey(name: "mime") final String? mime,
      @JsonKey(name: "name") final String? name,
      @JsonKey(name: "path") final dynamic path,
      @JsonKey(name: "size") final double? size,
      @JsonKey(name: "width") final int? width,
      @JsonKey(name: "height") final int? height,
      @JsonKey(name: "sizeInBytes") final int? sizeInBytes}) = _$LargeImpl;

  factory _Large.fromJson(Map<String, dynamic> json) = _$LargeImpl.fromJson;

  @override
  @JsonKey(name: "ext")
  String? get ext;
  @override
  @JsonKey(name: "url")
  String? get url;
  @override
  @JsonKey(name: "hash")
  String? get hash;
  @override
  @JsonKey(name: "mime")
  String? get mime;
  @override
  @JsonKey(name: "name")
  String? get name;
  @override
  @JsonKey(name: "path")
  dynamic get path;
  @override
  @JsonKey(name: "size")
  double? get size;
  @override
  @JsonKey(name: "width")
  int? get width;
  @override
  @JsonKey(name: "height")
  int? get height;
  @override
  @JsonKey(name: "sizeInBytes")
  int? get sizeInBytes;

  /// Create a copy of Large
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LargeImplCopyWith<_$LargeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Meta _$MetaFromJson(Map<String, dynamic> json) {
  return _Meta.fromJson(json);
}

/// @nodoc
mixin _$Meta {
  /// Serializes this Meta to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MetaCopyWith<$Res> {
  factory $MetaCopyWith(Meta value, $Res Function(Meta) then) =
      _$MetaCopyWithImpl<$Res, Meta>;
}

/// @nodoc
class _$MetaCopyWithImpl<$Res, $Val extends Meta>
    implements $MetaCopyWith<$Res> {
  _$MetaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Meta
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$MetaImplCopyWith<$Res> {
  factory _$$MetaImplCopyWith(
          _$MetaImpl value, $Res Function(_$MetaImpl) then) =
      __$$MetaImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MetaImplCopyWithImpl<$Res>
    extends _$MetaCopyWithImpl<$Res, _$MetaImpl>
    implements _$$MetaImplCopyWith<$Res> {
  __$$MetaImplCopyWithImpl(_$MetaImpl _value, $Res Function(_$MetaImpl) _then)
      : super(_value, _then);

  /// Create a copy of Meta
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$MetaImpl implements _Meta {
  const _$MetaImpl();

  factory _$MetaImpl.fromJson(Map<String, dynamic> json) =>
      _$$MetaImplFromJson(json);

  @override
  String toString() {
    return 'Meta()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$MetaImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  Map<String, dynamic> toJson() {
    return _$$MetaImplToJson(
      this,
    );
  }
}

abstract class _Meta implements Meta {
  const factory _Meta() = _$MetaImpl;

  factory _Meta.fromJson(Map<String, dynamic> json) = _$MetaImpl.fromJson;
}
