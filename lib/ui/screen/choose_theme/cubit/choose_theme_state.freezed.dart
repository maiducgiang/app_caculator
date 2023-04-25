// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'choose_theme_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ChooseThemeState {
  bool? get isLoading => throw _privateConstructorUsedError;
  Map<String, ThemeData> get listTheme => throw _privateConstructorUsedError;
  String get currentTheme => throw _privateConstructorUsedError;
  String get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChooseThemeStateCopyWith<ChooseThemeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChooseThemeStateCopyWith<$Res> {
  factory $ChooseThemeStateCopyWith(
          ChooseThemeState value, $Res Function(ChooseThemeState) then) =
      _$ChooseThemeStateCopyWithImpl<$Res, ChooseThemeState>;
  @useResult
  $Res call(
      {bool? isLoading,
      Map<String, ThemeData> listTheme,
      String currentTheme,
      String error});
}

/// @nodoc
class _$ChooseThemeStateCopyWithImpl<$Res, $Val extends ChooseThemeState>
    implements $ChooseThemeStateCopyWith<$Res> {
  _$ChooseThemeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = freezed,
    Object? listTheme = null,
    Object? currentTheme = null,
    Object? error = null,
  }) {
    return _then(_value.copyWith(
      isLoading: freezed == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool?,
      listTheme: null == listTheme
          ? _value.listTheme
          : listTheme // ignore: cast_nullable_to_non_nullable
              as Map<String, ThemeData>,
      currentTheme: null == currentTheme
          ? _value.currentTheme
          : currentTheme // ignore: cast_nullable_to_non_nullable
              as String,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ChooseThemeStateCopyWith<$Res>
    implements $ChooseThemeStateCopyWith<$Res> {
  factory _$$_ChooseThemeStateCopyWith(
          _$_ChooseThemeState value, $Res Function(_$_ChooseThemeState) then) =
      __$$_ChooseThemeStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool? isLoading,
      Map<String, ThemeData> listTheme,
      String currentTheme,
      String error});
}

/// @nodoc
class __$$_ChooseThemeStateCopyWithImpl<$Res>
    extends _$ChooseThemeStateCopyWithImpl<$Res, _$_ChooseThemeState>
    implements _$$_ChooseThemeStateCopyWith<$Res> {
  __$$_ChooseThemeStateCopyWithImpl(
      _$_ChooseThemeState _value, $Res Function(_$_ChooseThemeState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = freezed,
    Object? listTheme = null,
    Object? currentTheme = null,
    Object? error = null,
  }) {
    return _then(_$_ChooseThemeState(
      isLoading: freezed == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool?,
      listTheme: null == listTheme
          ? _value._listTheme
          : listTheme // ignore: cast_nullable_to_non_nullable
              as Map<String, ThemeData>,
      currentTheme: null == currentTheme
          ? _value.currentTheme
          : currentTheme // ignore: cast_nullable_to_non_nullable
              as String,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ChooseThemeState implements _ChooseThemeState {
  const _$_ChooseThemeState(
      {this.isLoading,
      required final Map<String, ThemeData> listTheme,
      required this.currentTheme,
      required this.error})
      : _listTheme = listTheme;

  @override
  final bool? isLoading;
  final Map<String, ThemeData> _listTheme;
  @override
  Map<String, ThemeData> get listTheme {
    if (_listTheme is EqualUnmodifiableMapView) return _listTheme;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_listTheme);
  }

  @override
  final String currentTheme;
  @override
  final String error;

  @override
  String toString() {
    return 'ChooseThemeState(isLoading: $isLoading, listTheme: $listTheme, currentTheme: $currentTheme, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChooseThemeState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality()
                .equals(other._listTheme, _listTheme) &&
            (identical(other.currentTheme, currentTheme) ||
                other.currentTheme == currentTheme) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading,
      const DeepCollectionEquality().hash(_listTheme), currentTheme, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChooseThemeStateCopyWith<_$_ChooseThemeState> get copyWith =>
      __$$_ChooseThemeStateCopyWithImpl<_$_ChooseThemeState>(this, _$identity);
}

abstract class _ChooseThemeState implements ChooseThemeState {
  const factory _ChooseThemeState(
      {final bool? isLoading,
      required final Map<String, ThemeData> listTheme,
      required final String currentTheme,
      required final String error}) = _$_ChooseThemeState;

  @override
  bool? get isLoading;
  @override
  Map<String, ThemeData> get listTheme;
  @override
  String get currentTheme;
  @override
  String get error;
  @override
  @JsonKey(ignore: true)
  _$$_ChooseThemeStateCopyWith<_$_ChooseThemeState> get copyWith =>
      throw _privateConstructorUsedError;
}
