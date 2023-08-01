// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UpdateStatus {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String currentVersion, String newVersion)
        required,
    required TResult Function(String currentVersion, String newVersion)
        optional,
    required TResult Function() upToDate,
    required TResult Function() unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String currentVersion, String newVersion)? required,
    TResult? Function(String currentVersion, String newVersion)? optional,
    TResult? Function()? upToDate,
    TResult? Function()? unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String currentVersion, String newVersion)? required,
    TResult Function(String currentVersion, String newVersion)? optional,
    TResult Function()? upToDate,
    TResult Function()? unknown,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UpdateRequired value) required,
    required TResult Function(UpdateOptional value) optional,
    required TResult Function(UpdateUpToDate value) upToDate,
    required TResult Function(UpdateUnknown value) unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UpdateRequired value)? required,
    TResult? Function(UpdateOptional value)? optional,
    TResult? Function(UpdateUpToDate value)? upToDate,
    TResult? Function(UpdateUnknown value)? unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UpdateRequired value)? required,
    TResult Function(UpdateOptional value)? optional,
    TResult Function(UpdateUpToDate value)? upToDate,
    TResult Function(UpdateUnknown value)? unknown,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateStatusCopyWith<$Res> {
  factory $UpdateStatusCopyWith(
          UpdateStatus value, $Res Function(UpdateStatus) then) =
      _$UpdateStatusCopyWithImpl<$Res, UpdateStatus>;
}

/// @nodoc
class _$UpdateStatusCopyWithImpl<$Res, $Val extends UpdateStatus>
    implements $UpdateStatusCopyWith<$Res> {
  _$UpdateStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$UpdateRequiredCopyWith<$Res> {
  factory _$$UpdateRequiredCopyWith(
          _$UpdateRequired value, $Res Function(_$UpdateRequired) then) =
      __$$UpdateRequiredCopyWithImpl<$Res>;
  @useResult
  $Res call({String currentVersion, String newVersion});
}

/// @nodoc
class __$$UpdateRequiredCopyWithImpl<$Res>
    extends _$UpdateStatusCopyWithImpl<$Res, _$UpdateRequired>
    implements _$$UpdateRequiredCopyWith<$Res> {
  __$$UpdateRequiredCopyWithImpl(
      _$UpdateRequired _value, $Res Function(_$UpdateRequired) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentVersion = null,
    Object? newVersion = null,
  }) {
    return _then(_$UpdateRequired(
      null == currentVersion
          ? _value.currentVersion
          : currentVersion // ignore: cast_nullable_to_non_nullable
              as String,
      null == newVersion
          ? _value.newVersion
          : newVersion // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UpdateRequired implements UpdateRequired {
  const _$UpdateRequired(this.currentVersion, this.newVersion);

  @override
  final String currentVersion;
  @override
  final String newVersion;

  @override
  String toString() {
    return 'UpdateStatus.required(currentVersion: $currentVersion, newVersion: $newVersion)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateRequired &&
            (identical(other.currentVersion, currentVersion) ||
                other.currentVersion == currentVersion) &&
            (identical(other.newVersion, newVersion) ||
                other.newVersion == newVersion));
  }

  @override
  int get hashCode => Object.hash(runtimeType, currentVersion, newVersion);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateRequiredCopyWith<_$UpdateRequired> get copyWith =>
      __$$UpdateRequiredCopyWithImpl<_$UpdateRequired>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String currentVersion, String newVersion)
        required,
    required TResult Function(String currentVersion, String newVersion)
        optional,
    required TResult Function() upToDate,
    required TResult Function() unknown,
  }) {
    return required(currentVersion, newVersion);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String currentVersion, String newVersion)? required,
    TResult? Function(String currentVersion, String newVersion)? optional,
    TResult? Function()? upToDate,
    TResult? Function()? unknown,
  }) {
    return required?.call(currentVersion, newVersion);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String currentVersion, String newVersion)? required,
    TResult Function(String currentVersion, String newVersion)? optional,
    TResult Function()? upToDate,
    TResult Function()? unknown,
    required TResult orElse(),
  }) {
    if (required != null) {
      return required(currentVersion, newVersion);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UpdateRequired value) required,
    required TResult Function(UpdateOptional value) optional,
    required TResult Function(UpdateUpToDate value) upToDate,
    required TResult Function(UpdateUnknown value) unknown,
  }) {
    return required(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UpdateRequired value)? required,
    TResult? Function(UpdateOptional value)? optional,
    TResult? Function(UpdateUpToDate value)? upToDate,
    TResult? Function(UpdateUnknown value)? unknown,
  }) {
    return required?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UpdateRequired value)? required,
    TResult Function(UpdateOptional value)? optional,
    TResult Function(UpdateUpToDate value)? upToDate,
    TResult Function(UpdateUnknown value)? unknown,
    required TResult orElse(),
  }) {
    if (required != null) {
      return required(this);
    }
    return orElse();
  }
}

abstract class UpdateRequired implements UpdateStatus {
  const factory UpdateRequired(
      final String currentVersion, final String newVersion) = _$UpdateRequired;

  String get currentVersion;
  String get newVersion;
  @JsonKey(ignore: true)
  _$$UpdateRequiredCopyWith<_$UpdateRequired> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateOptionalCopyWith<$Res> {
  factory _$$UpdateOptionalCopyWith(
          _$UpdateOptional value, $Res Function(_$UpdateOptional) then) =
      __$$UpdateOptionalCopyWithImpl<$Res>;
  @useResult
  $Res call({String currentVersion, String newVersion});
}

/// @nodoc
class __$$UpdateOptionalCopyWithImpl<$Res>
    extends _$UpdateStatusCopyWithImpl<$Res, _$UpdateOptional>
    implements _$$UpdateOptionalCopyWith<$Res> {
  __$$UpdateOptionalCopyWithImpl(
      _$UpdateOptional _value, $Res Function(_$UpdateOptional) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentVersion = null,
    Object? newVersion = null,
  }) {
    return _then(_$UpdateOptional(
      null == currentVersion
          ? _value.currentVersion
          : currentVersion // ignore: cast_nullable_to_non_nullable
              as String,
      null == newVersion
          ? _value.newVersion
          : newVersion // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UpdateOptional implements UpdateOptional {
  const _$UpdateOptional(this.currentVersion, this.newVersion);

  @override
  final String currentVersion;
  @override
  final String newVersion;

  @override
  String toString() {
    return 'UpdateStatus.optional(currentVersion: $currentVersion, newVersion: $newVersion)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateOptional &&
            (identical(other.currentVersion, currentVersion) ||
                other.currentVersion == currentVersion) &&
            (identical(other.newVersion, newVersion) ||
                other.newVersion == newVersion));
  }

  @override
  int get hashCode => Object.hash(runtimeType, currentVersion, newVersion);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateOptionalCopyWith<_$UpdateOptional> get copyWith =>
      __$$UpdateOptionalCopyWithImpl<_$UpdateOptional>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String currentVersion, String newVersion)
        required,
    required TResult Function(String currentVersion, String newVersion)
        optional,
    required TResult Function() upToDate,
    required TResult Function() unknown,
  }) {
    return optional(currentVersion, newVersion);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String currentVersion, String newVersion)? required,
    TResult? Function(String currentVersion, String newVersion)? optional,
    TResult? Function()? upToDate,
    TResult? Function()? unknown,
  }) {
    return optional?.call(currentVersion, newVersion);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String currentVersion, String newVersion)? required,
    TResult Function(String currentVersion, String newVersion)? optional,
    TResult Function()? upToDate,
    TResult Function()? unknown,
    required TResult orElse(),
  }) {
    if (optional != null) {
      return optional(currentVersion, newVersion);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UpdateRequired value) required,
    required TResult Function(UpdateOptional value) optional,
    required TResult Function(UpdateUpToDate value) upToDate,
    required TResult Function(UpdateUnknown value) unknown,
  }) {
    return optional(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UpdateRequired value)? required,
    TResult? Function(UpdateOptional value)? optional,
    TResult? Function(UpdateUpToDate value)? upToDate,
    TResult? Function(UpdateUnknown value)? unknown,
  }) {
    return optional?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UpdateRequired value)? required,
    TResult Function(UpdateOptional value)? optional,
    TResult Function(UpdateUpToDate value)? upToDate,
    TResult Function(UpdateUnknown value)? unknown,
    required TResult orElse(),
  }) {
    if (optional != null) {
      return optional(this);
    }
    return orElse();
  }
}

abstract class UpdateOptional implements UpdateStatus {
  const factory UpdateOptional(
      final String currentVersion, final String newVersion) = _$UpdateOptional;

  String get currentVersion;
  String get newVersion;
  @JsonKey(ignore: true)
  _$$UpdateOptionalCopyWith<_$UpdateOptional> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateUpToDateCopyWith<$Res> {
  factory _$$UpdateUpToDateCopyWith(
          _$UpdateUpToDate value, $Res Function(_$UpdateUpToDate) then) =
      __$$UpdateUpToDateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UpdateUpToDateCopyWithImpl<$Res>
    extends _$UpdateStatusCopyWithImpl<$Res, _$UpdateUpToDate>
    implements _$$UpdateUpToDateCopyWith<$Res> {
  __$$UpdateUpToDateCopyWithImpl(
      _$UpdateUpToDate _value, $Res Function(_$UpdateUpToDate) _then)
      : super(_value, _then);
}

/// @nodoc

class _$UpdateUpToDate implements UpdateUpToDate {
  const _$UpdateUpToDate();

  @override
  String toString() {
    return 'UpdateStatus.upToDate()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UpdateUpToDate);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String currentVersion, String newVersion)
        required,
    required TResult Function(String currentVersion, String newVersion)
        optional,
    required TResult Function() upToDate,
    required TResult Function() unknown,
  }) {
    return upToDate();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String currentVersion, String newVersion)? required,
    TResult? Function(String currentVersion, String newVersion)? optional,
    TResult? Function()? upToDate,
    TResult? Function()? unknown,
  }) {
    return upToDate?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String currentVersion, String newVersion)? required,
    TResult Function(String currentVersion, String newVersion)? optional,
    TResult Function()? upToDate,
    TResult Function()? unknown,
    required TResult orElse(),
  }) {
    if (upToDate != null) {
      return upToDate();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UpdateRequired value) required,
    required TResult Function(UpdateOptional value) optional,
    required TResult Function(UpdateUpToDate value) upToDate,
    required TResult Function(UpdateUnknown value) unknown,
  }) {
    return upToDate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UpdateRequired value)? required,
    TResult? Function(UpdateOptional value)? optional,
    TResult? Function(UpdateUpToDate value)? upToDate,
    TResult? Function(UpdateUnknown value)? unknown,
  }) {
    return upToDate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UpdateRequired value)? required,
    TResult Function(UpdateOptional value)? optional,
    TResult Function(UpdateUpToDate value)? upToDate,
    TResult Function(UpdateUnknown value)? unknown,
    required TResult orElse(),
  }) {
    if (upToDate != null) {
      return upToDate(this);
    }
    return orElse();
  }
}

abstract class UpdateUpToDate implements UpdateStatus {
  const factory UpdateUpToDate() = _$UpdateUpToDate;
}

/// @nodoc
abstract class _$$UpdateUnknownCopyWith<$Res> {
  factory _$$UpdateUnknownCopyWith(
          _$UpdateUnknown value, $Res Function(_$UpdateUnknown) then) =
      __$$UpdateUnknownCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UpdateUnknownCopyWithImpl<$Res>
    extends _$UpdateStatusCopyWithImpl<$Res, _$UpdateUnknown>
    implements _$$UpdateUnknownCopyWith<$Res> {
  __$$UpdateUnknownCopyWithImpl(
      _$UpdateUnknown _value, $Res Function(_$UpdateUnknown) _then)
      : super(_value, _then);
}

/// @nodoc

class _$UpdateUnknown implements UpdateUnknown {
  const _$UpdateUnknown();

  @override
  String toString() {
    return 'UpdateStatus.unknown()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UpdateUnknown);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String currentVersion, String newVersion)
        required,
    required TResult Function(String currentVersion, String newVersion)
        optional,
    required TResult Function() upToDate,
    required TResult Function() unknown,
  }) {
    return unknown();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String currentVersion, String newVersion)? required,
    TResult? Function(String currentVersion, String newVersion)? optional,
    TResult? Function()? upToDate,
    TResult? Function()? unknown,
  }) {
    return unknown?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String currentVersion, String newVersion)? required,
    TResult Function(String currentVersion, String newVersion)? optional,
    TResult Function()? upToDate,
    TResult Function()? unknown,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UpdateRequired value) required,
    required TResult Function(UpdateOptional value) optional,
    required TResult Function(UpdateUpToDate value) upToDate,
    required TResult Function(UpdateUnknown value) unknown,
  }) {
    return unknown(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UpdateRequired value)? required,
    TResult? Function(UpdateOptional value)? optional,
    TResult? Function(UpdateUpToDate value)? upToDate,
    TResult? Function(UpdateUnknown value)? unknown,
  }) {
    return unknown?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UpdateRequired value)? required,
    TResult Function(UpdateOptional value)? optional,
    TResult Function(UpdateUpToDate value)? upToDate,
    TResult Function(UpdateUnknown value)? unknown,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(this);
    }
    return orElse();
  }
}

abstract class UpdateUnknown implements UpdateStatus {
  const factory UpdateUnknown() = _$UpdateUnknown;
}
