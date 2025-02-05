// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chinsuko_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ChinsukoState _$ChinsukoStateFromJson(Map<String, dynamic> json) {
  return _ChinsukoState.fromJson(json);
}

/// @nodoc
mixin _$ChinsukoState {
  int get count => throw _privateConstructorUsedError;

  /// Serializes this ChinsukoState to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChinsukoState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChinsukoStateCopyWith<ChinsukoState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChinsukoStateCopyWith<$Res> {
  factory $ChinsukoStateCopyWith(
          ChinsukoState value, $Res Function(ChinsukoState) then) =
      _$ChinsukoStateCopyWithImpl<$Res, ChinsukoState>;
  @useResult
  $Res call({int count});
}

/// @nodoc
class _$ChinsukoStateCopyWithImpl<$Res, $Val extends ChinsukoState>
    implements $ChinsukoStateCopyWith<$Res> {
  _$ChinsukoStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChinsukoState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
  }) {
    return _then(_value.copyWith(
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChinsukoStateImplCopyWith<$Res>
    implements $ChinsukoStateCopyWith<$Res> {
  factory _$$ChinsukoStateImplCopyWith(
          _$ChinsukoStateImpl value, $Res Function(_$ChinsukoStateImpl) then) =
      __$$ChinsukoStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int count});
}

/// @nodoc
class __$$ChinsukoStateImplCopyWithImpl<$Res>
    extends _$ChinsukoStateCopyWithImpl<$Res, _$ChinsukoStateImpl>
    implements _$$ChinsukoStateImplCopyWith<$Res> {
  __$$ChinsukoStateImplCopyWithImpl(
      _$ChinsukoStateImpl _value, $Res Function(_$ChinsukoStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChinsukoState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
  }) {
    return _then(_$ChinsukoStateImpl(
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChinsukoStateImpl implements _ChinsukoState {
  const _$ChinsukoStateImpl({this.count = 0});

  factory _$ChinsukoStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChinsukoStateImplFromJson(json);

  @override
  @JsonKey()
  final int count;

  @override
  String toString() {
    return 'ChinsukoState(count: $count)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChinsukoStateImpl &&
            (identical(other.count, count) || other.count == count));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, count);

  /// Create a copy of ChinsukoState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChinsukoStateImplCopyWith<_$ChinsukoStateImpl> get copyWith =>
      __$$ChinsukoStateImplCopyWithImpl<_$ChinsukoStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChinsukoStateImplToJson(
      this,
    );
  }
}

abstract class _ChinsukoState implements ChinsukoState {
  const factory _ChinsukoState({final int count}) = _$ChinsukoStateImpl;

  factory _ChinsukoState.fromJson(Map<String, dynamic> json) =
      _$ChinsukoStateImpl.fromJson;

  @override
  int get count;

  /// Create a copy of ChinsukoState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChinsukoStateImplCopyWith<_$ChinsukoStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
