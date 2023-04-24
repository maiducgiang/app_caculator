// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'change_money_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ChangeMoneyState {
  bool? get isLoading => throw _privateConstructorUsedError;
  String get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChangeMoneyStateCopyWith<ChangeMoneyState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChangeMoneyStateCopyWith<$Res> {
  factory $ChangeMoneyStateCopyWith(
          ChangeMoneyState value, $Res Function(ChangeMoneyState) then) =
      _$ChangeMoneyStateCopyWithImpl<$Res, ChangeMoneyState>;
  @useResult
  $Res call({bool? isLoading, String error});
}

/// @nodoc
class _$ChangeMoneyStateCopyWithImpl<$Res, $Val extends ChangeMoneyState>
    implements $ChangeMoneyStateCopyWith<$Res> {
  _$ChangeMoneyStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = freezed,
    Object? error = null,
  }) {
    return _then(_value.copyWith(
      isLoading: freezed == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool?,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ChangeMoneyStateCopyWith<$Res>
    implements $ChangeMoneyStateCopyWith<$Res> {
  factory _$$_ChangeMoneyStateCopyWith(
          _$_ChangeMoneyState value, $Res Function(_$_ChangeMoneyState) then) =
      __$$_ChangeMoneyStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? isLoading, String error});
}

/// @nodoc
class __$$_ChangeMoneyStateCopyWithImpl<$Res>
    extends _$ChangeMoneyStateCopyWithImpl<$Res, _$_ChangeMoneyState>
    implements _$$_ChangeMoneyStateCopyWith<$Res> {
  __$$_ChangeMoneyStateCopyWithImpl(
      _$_ChangeMoneyState _value, $Res Function(_$_ChangeMoneyState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = freezed,
    Object? error = null,
  }) {
    return _then(_$_ChangeMoneyState(
      isLoading: freezed == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool?,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ChangeMoneyState implements _ChangeMoneyState {
  const _$_ChangeMoneyState({this.isLoading, required this.error});

  @override
  final bool? isLoading;
  @override
  final String error;

  @override
  String toString() {
    return 'ChangeMoneyState(isLoading: $isLoading, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChangeMoneyState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChangeMoneyStateCopyWith<_$_ChangeMoneyState> get copyWith =>
      __$$_ChangeMoneyStateCopyWithImpl<_$_ChangeMoneyState>(this, _$identity);
}

abstract class _ChangeMoneyState implements ChangeMoneyState {
  const factory _ChangeMoneyState(
      {final bool? isLoading,
      required final String error}) = _$_ChangeMoneyState;

  @override
  bool? get isLoading;
  @override
  String get error;
  @override
  @JsonKey(ignore: true)
  _$$_ChangeMoneyStateCopyWith<_$_ChangeMoneyState> get copyWith =>
      throw _privateConstructorUsedError;
}
