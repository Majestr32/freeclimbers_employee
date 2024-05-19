// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_documents.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AppDocuments _$AppDocumentsFromJson(Map<String, dynamic> json) {
  return _AppDocuments.fromJson(json);
}

/// @nodoc
mixin _$AppDocuments {
  String get privacy => throw _privateConstructorUsedError;
  @JsonKey(name: 'branch_privacy')
  String? get branchPrivacy => throw _privateConstructorUsedError;
  String get imprint => throw _privateConstructorUsedError;
  String get terms => throw _privateConstructorUsedError;
  @JsonKey(name: 'branch_terms')
  String? get branchTerms => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppDocumentsCopyWith<AppDocuments> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppDocumentsCopyWith<$Res> {
  factory $AppDocumentsCopyWith(
          AppDocuments value, $Res Function(AppDocuments) then) =
      _$AppDocumentsCopyWithImpl<$Res, AppDocuments>;
  @useResult
  $Res call(
      {String privacy,
      @JsonKey(name: 'branch_privacy') String? branchPrivacy,
      String imprint,
      String terms,
      @JsonKey(name: 'branch_terms') String? branchTerms});
}

/// @nodoc
class _$AppDocumentsCopyWithImpl<$Res, $Val extends AppDocuments>
    implements $AppDocumentsCopyWith<$Res> {
  _$AppDocumentsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? privacy = null,
    Object? branchPrivacy = freezed,
    Object? imprint = null,
    Object? terms = null,
    Object? branchTerms = freezed,
  }) {
    return _then(_value.copyWith(
      privacy: null == privacy
          ? _value.privacy
          : privacy // ignore: cast_nullable_to_non_nullable
              as String,
      branchPrivacy: freezed == branchPrivacy
          ? _value.branchPrivacy
          : branchPrivacy // ignore: cast_nullable_to_non_nullable
              as String?,
      imprint: null == imprint
          ? _value.imprint
          : imprint // ignore: cast_nullable_to_non_nullable
              as String,
      terms: null == terms
          ? _value.terms
          : terms // ignore: cast_nullable_to_non_nullable
              as String,
      branchTerms: freezed == branchTerms
          ? _value.branchTerms
          : branchTerms // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AppDocumentsCopyWith<$Res>
    implements $AppDocumentsCopyWith<$Res> {
  factory _$$_AppDocumentsCopyWith(
          _$_AppDocuments value, $Res Function(_$_AppDocuments) then) =
      __$$_AppDocumentsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String privacy,
      @JsonKey(name: 'branch_privacy') String? branchPrivacy,
      String imprint,
      String terms,
      @JsonKey(name: 'branch_terms') String? branchTerms});
}

/// @nodoc
class __$$_AppDocumentsCopyWithImpl<$Res>
    extends _$AppDocumentsCopyWithImpl<$Res, _$_AppDocuments>
    implements _$$_AppDocumentsCopyWith<$Res> {
  __$$_AppDocumentsCopyWithImpl(
      _$_AppDocuments _value, $Res Function(_$_AppDocuments) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? privacy = null,
    Object? branchPrivacy = freezed,
    Object? imprint = null,
    Object? terms = null,
    Object? branchTerms = freezed,
  }) {
    return _then(_$_AppDocuments(
      privacy: null == privacy
          ? _value.privacy
          : privacy // ignore: cast_nullable_to_non_nullable
              as String,
      branchPrivacy: freezed == branchPrivacy
          ? _value.branchPrivacy
          : branchPrivacy // ignore: cast_nullable_to_non_nullable
              as String?,
      imprint: null == imprint
          ? _value.imprint
          : imprint // ignore: cast_nullable_to_non_nullable
              as String,
      terms: null == terms
          ? _value.terms
          : terms // ignore: cast_nullable_to_non_nullable
              as String,
      branchTerms: freezed == branchTerms
          ? _value.branchTerms
          : branchTerms // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AppDocuments with DiagnosticableTreeMixin implements _AppDocuments {
  const _$_AppDocuments(
      {required this.privacy,
      @JsonKey(name: 'branch_privacy') this.branchPrivacy,
      required this.imprint,
      required this.terms,
      @JsonKey(name: 'branch_terms') this.branchTerms});

  factory _$_AppDocuments.fromJson(Map<String, dynamic> json) =>
      _$$_AppDocumentsFromJson(json);

  @override
  final String privacy;
  @override
  @JsonKey(name: 'branch_privacy')
  final String? branchPrivacy;
  @override
  final String imprint;
  @override
  final String terms;
  @override
  @JsonKey(name: 'branch_terms')
  final String? branchTerms;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AppDocuments(privacy: $privacy, branchPrivacy: $branchPrivacy, imprint: $imprint, terms: $terms, branchTerms: $branchTerms)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AppDocuments'))
      ..add(DiagnosticsProperty('privacy', privacy))
      ..add(DiagnosticsProperty('branchPrivacy', branchPrivacy))
      ..add(DiagnosticsProperty('imprint', imprint))
      ..add(DiagnosticsProperty('terms', terms))
      ..add(DiagnosticsProperty('branchTerms', branchTerms));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AppDocuments &&
            (identical(other.privacy, privacy) || other.privacy == privacy) &&
            (identical(other.branchPrivacy, branchPrivacy) ||
                other.branchPrivacy == branchPrivacy) &&
            (identical(other.imprint, imprint) || other.imprint == imprint) &&
            (identical(other.terms, terms) || other.terms == terms) &&
            (identical(other.branchTerms, branchTerms) ||
                other.branchTerms == branchTerms));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, privacy, branchPrivacy, imprint, terms, branchTerms);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AppDocumentsCopyWith<_$_AppDocuments> get copyWith =>
      __$$_AppDocumentsCopyWithImpl<_$_AppDocuments>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AppDocumentsToJson(
      this,
    );
  }
}

abstract class _AppDocuments implements AppDocuments {
  const factory _AppDocuments(
          {required final String privacy,
          @JsonKey(name: 'branch_privacy') final String? branchPrivacy,
          required final String imprint,
          required final String terms,
          @JsonKey(name: 'branch_terms') final String? branchTerms}) =
      _$_AppDocuments;

  factory _AppDocuments.fromJson(Map<String, dynamic> json) =
      _$_AppDocuments.fromJson;

  @override
  String get privacy;
  @override
  @JsonKey(name: 'branch_privacy')
  String? get branchPrivacy;
  @override
  String get imprint;
  @override
  String get terms;
  @override
  @JsonKey(name: 'branch_terms')
  String? get branchTerms;
  @override
  @JsonKey(ignore: true)
  _$$_AppDocumentsCopyWith<_$_AppDocuments> get copyWith =>
      throw _privateConstructorUsedError;
}
