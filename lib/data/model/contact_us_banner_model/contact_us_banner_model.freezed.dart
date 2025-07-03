// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contact_us_banner_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ContactUsBanner _$ContactUsBannerFromJson(Map<String, dynamic> json) {
  return _ContactUsBanner.fromJson(json);
}

/// @nodoc
mixin _$ContactUsBanner {
  @JsonKey(name: "data")
  Data get data => throw _privateConstructorUsedError;
  @JsonKey(name: "meta")
  Meta get meta => throw _privateConstructorUsedError;

  /// Serializes this ContactUsBanner to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ContactUsBanner
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ContactUsBannerCopyWith<ContactUsBanner> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContactUsBannerCopyWith<$Res> {
  factory $ContactUsBannerCopyWith(
          ContactUsBanner value, $Res Function(ContactUsBanner) then) =
      _$ContactUsBannerCopyWithImpl<$Res, ContactUsBanner>;
  @useResult
  $Res call(
      {@JsonKey(name: "data") Data data, @JsonKey(name: "meta") Meta meta});

  $DataCopyWith<$Res> get data;
  $MetaCopyWith<$Res> get meta;
}

/// @nodoc
class _$ContactUsBannerCopyWithImpl<$Res, $Val extends ContactUsBanner>
    implements $ContactUsBannerCopyWith<$Res> {
  _$ContactUsBannerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ContactUsBanner
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? meta = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Data,
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as Meta,
    ) as $Val);
  }

  /// Create a copy of ContactUsBanner
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DataCopyWith<$Res> get data {
    return $DataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }

  /// Create a copy of ContactUsBanner
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MetaCopyWith<$Res> get meta {
    return $MetaCopyWith<$Res>(_value.meta, (value) {
      return _then(_value.copyWith(meta: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ContactUsBannerImplCopyWith<$Res>
    implements $ContactUsBannerCopyWith<$Res> {
  factory _$$ContactUsBannerImplCopyWith(_$ContactUsBannerImpl value,
          $Res Function(_$ContactUsBannerImpl) then) =
      __$$ContactUsBannerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "data") Data data, @JsonKey(name: "meta") Meta meta});

  @override
  $DataCopyWith<$Res> get data;
  @override
  $MetaCopyWith<$Res> get meta;
}

/// @nodoc
class __$$ContactUsBannerImplCopyWithImpl<$Res>
    extends _$ContactUsBannerCopyWithImpl<$Res, _$ContactUsBannerImpl>
    implements _$$ContactUsBannerImplCopyWith<$Res> {
  __$$ContactUsBannerImplCopyWithImpl(
      _$ContactUsBannerImpl _value, $Res Function(_$ContactUsBannerImpl) _then)
      : super(_value, _then);

  /// Create a copy of ContactUsBanner
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? meta = null,
  }) {
    return _then(_$ContactUsBannerImpl(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Data,
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as Meta,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ContactUsBannerImpl implements _ContactUsBanner {
  const _$ContactUsBannerImpl(
      {@JsonKey(name: "data") required this.data,
      @JsonKey(name: "meta") required this.meta});

  factory _$ContactUsBannerImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContactUsBannerImplFromJson(json);

  @override
  @JsonKey(name: "data")
  final Data data;
  @override
  @JsonKey(name: "meta")
  final Meta meta;

  @override
  String toString() {
    return 'ContactUsBanner(data: $data, meta: $meta)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContactUsBannerImpl &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.meta, meta) || other.meta == meta));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, data, meta);

  /// Create a copy of ContactUsBanner
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ContactUsBannerImplCopyWith<_$ContactUsBannerImpl> get copyWith =>
      __$$ContactUsBannerImplCopyWithImpl<_$ContactUsBannerImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ContactUsBannerImplToJson(
      this,
    );
  }
}

abstract class _ContactUsBanner implements ContactUsBanner {
  const factory _ContactUsBanner(
      {@JsonKey(name: "data") required final Data data,
      @JsonKey(name: "meta") required final Meta meta}) = _$ContactUsBannerImpl;

  factory _ContactUsBanner.fromJson(Map<String, dynamic> json) =
      _$ContactUsBannerImpl.fromJson;

  @override
  @JsonKey(name: "data")
  Data get data;
  @override
  @JsonKey(name: "meta")
  Meta get meta;

  /// Create a copy of ContactUsBanner
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ContactUsBannerImplCopyWith<_$ContactUsBannerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Data _$DataFromJson(Map<String, dynamic> json) {
  return _Data.fromJson(json);
}

/// @nodoc
mixin _$Data {
  @JsonKey(name: "id")
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: "documentId")
  String get documentId => throw _privateConstructorUsedError;
  @JsonKey(name: "sec_header")
  String get secHeader => throw _privateConstructorUsedError;
  @JsonKey(name: "createdAt")
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "updatedAt")
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: "publishedAt")
  DateTime get publishedAt => throw _privateConstructorUsedError;
  @JsonKey(name: "sec_bg")
  SecBg get secBg => throw _privateConstructorUsedError;

  /// Serializes this Data to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Data
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DataCopyWith<Data> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataCopyWith<$Res> {
  factory $DataCopyWith(Data value, $Res Function(Data) then) =
      _$DataCopyWithImpl<$Res, Data>;
  @useResult
  $Res call(
      {@JsonKey(name: "id") int id,
      @JsonKey(name: "documentId") String documentId,
      @JsonKey(name: "sec_header") String secHeader,
      @JsonKey(name: "createdAt") DateTime createdAt,
      @JsonKey(name: "updatedAt") DateTime updatedAt,
      @JsonKey(name: "publishedAt") DateTime publishedAt,
      @JsonKey(name: "sec_bg") SecBg secBg});

  $SecBgCopyWith<$Res> get secBg;
}

/// @nodoc
class _$DataCopyWithImpl<$Res, $Val extends Data>
    implements $DataCopyWith<$Res> {
  _$DataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Data
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? documentId = null,
    Object? secHeader = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? publishedAt = null,
    Object? secBg = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      documentId: null == documentId
          ? _value.documentId
          : documentId // ignore: cast_nullable_to_non_nullable
              as String,
      secHeader: null == secHeader
          ? _value.secHeader
          : secHeader // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      publishedAt: null == publishedAt
          ? _value.publishedAt
          : publishedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      secBg: null == secBg
          ? _value.secBg
          : secBg // ignore: cast_nullable_to_non_nullable
              as SecBg,
    ) as $Val);
  }

  /// Create a copy of Data
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SecBgCopyWith<$Res> get secBg {
    return $SecBgCopyWith<$Res>(_value.secBg, (value) {
      return _then(_value.copyWith(secBg: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DataImplCopyWith<$Res> implements $DataCopyWith<$Res> {
  factory _$$DataImplCopyWith(
          _$DataImpl value, $Res Function(_$DataImpl) then) =
      __$$DataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "id") int id,
      @JsonKey(name: "documentId") String documentId,
      @JsonKey(name: "sec_header") String secHeader,
      @JsonKey(name: "createdAt") DateTime createdAt,
      @JsonKey(name: "updatedAt") DateTime updatedAt,
      @JsonKey(name: "publishedAt") DateTime publishedAt,
      @JsonKey(name: "sec_bg") SecBg secBg});

  @override
  $SecBgCopyWith<$Res> get secBg;
}

/// @nodoc
class __$$DataImplCopyWithImpl<$Res>
    extends _$DataCopyWithImpl<$Res, _$DataImpl>
    implements _$$DataImplCopyWith<$Res> {
  __$$DataImplCopyWithImpl(_$DataImpl _value, $Res Function(_$DataImpl) _then)
      : super(_value, _then);

  /// Create a copy of Data
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? documentId = null,
    Object? secHeader = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? publishedAt = null,
    Object? secBg = null,
  }) {
    return _then(_$DataImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      documentId: null == documentId
          ? _value.documentId
          : documentId // ignore: cast_nullable_to_non_nullable
              as String,
      secHeader: null == secHeader
          ? _value.secHeader
          : secHeader // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      publishedAt: null == publishedAt
          ? _value.publishedAt
          : publishedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      secBg: null == secBg
          ? _value.secBg
          : secBg // ignore: cast_nullable_to_non_nullable
              as SecBg,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DataImpl implements _Data {
  const _$DataImpl(
      {@JsonKey(name: "id") required this.id,
      @JsonKey(name: "documentId") required this.documentId,
      @JsonKey(name: "sec_header") required this.secHeader,
      @JsonKey(name: "createdAt") required this.createdAt,
      @JsonKey(name: "updatedAt") required this.updatedAt,
      @JsonKey(name: "publishedAt") required this.publishedAt,
      @JsonKey(name: "sec_bg") required this.secBg});

  factory _$DataImpl.fromJson(Map<String, dynamic> json) =>
      _$$DataImplFromJson(json);

  @override
  @JsonKey(name: "id")
  final int id;
  @override
  @JsonKey(name: "documentId")
  final String documentId;
  @override
  @JsonKey(name: "sec_header")
  final String secHeader;
  @override
  @JsonKey(name: "createdAt")
  final DateTime createdAt;
  @override
  @JsonKey(name: "updatedAt")
  final DateTime updatedAt;
  @override
  @JsonKey(name: "publishedAt")
  final DateTime publishedAt;
  @override
  @JsonKey(name: "sec_bg")
  final SecBg secBg;

  @override
  String toString() {
    return 'Data(id: $id, documentId: $documentId, secHeader: $secHeader, createdAt: $createdAt, updatedAt: $updatedAt, publishedAt: $publishedAt, secBg: $secBg)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.documentId, documentId) ||
                other.documentId == documentId) &&
            (identical(other.secHeader, secHeader) ||
                other.secHeader == secHeader) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.publishedAt, publishedAt) ||
                other.publishedAt == publishedAt) &&
            (identical(other.secBg, secBg) || other.secBg == secBg));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, documentId, secHeader,
      createdAt, updatedAt, publishedAt, secBg);

  /// Create a copy of Data
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DataImplCopyWith<_$DataImpl> get copyWith =>
      __$$DataImplCopyWithImpl<_$DataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DataImplToJson(
      this,
    );
  }
}

abstract class _Data implements Data {
  const factory _Data(
      {@JsonKey(name: "id") required final int id,
      @JsonKey(name: "documentId") required final String documentId,
      @JsonKey(name: "sec_header") required final String secHeader,
      @JsonKey(name: "createdAt") required final DateTime createdAt,
      @JsonKey(name: "updatedAt") required final DateTime updatedAt,
      @JsonKey(name: "publishedAt") required final DateTime publishedAt,
      @JsonKey(name: "sec_bg") required final SecBg secBg}) = _$DataImpl;

  factory _Data.fromJson(Map<String, dynamic> json) = _$DataImpl.fromJson;

  @override
  @JsonKey(name: "id")
  int get id;
  @override
  @JsonKey(name: "documentId")
  String get documentId;
  @override
  @JsonKey(name: "sec_header")
  String get secHeader;
  @override
  @JsonKey(name: "createdAt")
  DateTime get createdAt;
  @override
  @JsonKey(name: "updatedAt")
  DateTime get updatedAt;
  @override
  @JsonKey(name: "publishedAt")
  DateTime get publishedAt;
  @override
  @JsonKey(name: "sec_bg")
  SecBg get secBg;

  /// Create a copy of Data
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DataImplCopyWith<_$DataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SecBg _$SecBgFromJson(Map<String, dynamic> json) {
  return _SecBg.fromJson(json);
}

/// @nodoc
mixin _$SecBg {
  @JsonKey(name: "id")
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: "url")
  String get url => throw _privateConstructorUsedError;
  @JsonKey(name: "name")
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: "mime")
  String get mime => throw _privateConstructorUsedError;
  @JsonKey(name: "label")
  String get label => throw _privateConstructorUsedError;

  /// Serializes this SecBg to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SecBg
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SecBgCopyWith<SecBg> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SecBgCopyWith<$Res> {
  factory $SecBgCopyWith(SecBg value, $Res Function(SecBg) then) =
      _$SecBgCopyWithImpl<$Res, SecBg>;
  @useResult
  $Res call(
      {@JsonKey(name: "id") int id,
      @JsonKey(name: "url") String url,
      @JsonKey(name: "name") String name,
      @JsonKey(name: "mime") String mime,
      @JsonKey(name: "label") String label});
}

/// @nodoc
class _$SecBgCopyWithImpl<$Res, $Val extends SecBg>
    implements $SecBgCopyWith<$Res> {
  _$SecBgCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SecBg
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? url = null,
    Object? name = null,
    Object? mime = null,
    Object? label = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      mime: null == mime
          ? _value.mime
          : mime // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SecBgImplCopyWith<$Res> implements $SecBgCopyWith<$Res> {
  factory _$$SecBgImplCopyWith(
          _$SecBgImpl value, $Res Function(_$SecBgImpl) then) =
      __$$SecBgImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "id") int id,
      @JsonKey(name: "url") String url,
      @JsonKey(name: "name") String name,
      @JsonKey(name: "mime") String mime,
      @JsonKey(name: "label") String label});
}

/// @nodoc
class __$$SecBgImplCopyWithImpl<$Res>
    extends _$SecBgCopyWithImpl<$Res, _$SecBgImpl>
    implements _$$SecBgImplCopyWith<$Res> {
  __$$SecBgImplCopyWithImpl(
      _$SecBgImpl _value, $Res Function(_$SecBgImpl) _then)
      : super(_value, _then);

  /// Create a copy of SecBg
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? url = null,
    Object? name = null,
    Object? mime = null,
    Object? label = null,
  }) {
    return _then(_$SecBgImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      mime: null == mime
          ? _value.mime
          : mime // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SecBgImpl implements _SecBg {
  const _$SecBgImpl(
      {@JsonKey(name: "id") required this.id,
      @JsonKey(name: "url") required this.url,
      @JsonKey(name: "name") required this.name,
      @JsonKey(name: "mime") required this.mime,
      @JsonKey(name: "label") required this.label});

  factory _$SecBgImpl.fromJson(Map<String, dynamic> json) =>
      _$$SecBgImplFromJson(json);

  @override
  @JsonKey(name: "id")
  final int id;
  @override
  @JsonKey(name: "url")
  final String url;
  @override
  @JsonKey(name: "name")
  final String name;
  @override
  @JsonKey(name: "mime")
  final String mime;
  @override
  @JsonKey(name: "label")
  final String label;

  @override
  String toString() {
    return 'SecBg(id: $id, url: $url, name: $name, mime: $mime, label: $label)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SecBgImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.mime, mime) || other.mime == mime) &&
            (identical(other.label, label) || other.label == label));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, url, name, mime, label);

  /// Create a copy of SecBg
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SecBgImplCopyWith<_$SecBgImpl> get copyWith =>
      __$$SecBgImplCopyWithImpl<_$SecBgImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SecBgImplToJson(
      this,
    );
  }
}

abstract class _SecBg implements SecBg {
  const factory _SecBg(
      {@JsonKey(name: "id") required final int id,
      @JsonKey(name: "url") required final String url,
      @JsonKey(name: "name") required final String name,
      @JsonKey(name: "mime") required final String mime,
      @JsonKey(name: "label") required final String label}) = _$SecBgImpl;

  factory _SecBg.fromJson(Map<String, dynamic> json) = _$SecBgImpl.fromJson;

  @override
  @JsonKey(name: "id")
  int get id;
  @override
  @JsonKey(name: "url")
  String get url;
  @override
  @JsonKey(name: "name")
  String get name;
  @override
  @JsonKey(name: "mime")
  String get mime;
  @override
  @JsonKey(name: "label")
  String get label;

  /// Create a copy of SecBg
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SecBgImplCopyWith<_$SecBgImpl> get copyWith =>
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
