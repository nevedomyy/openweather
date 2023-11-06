// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forecast_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ForecastItem _$ForecastItemFromJson(Map<String, dynamic> json) {
  return _ForecastItem.fromJson(json);
}

/// @nodoc
mixin _$ForecastItem {
  int? get dt => throw _privateConstructorUsedError;
  Main? get main => throw _privateConstructorUsedError;
  List<Weather> get weather => throw _privateConstructorUsedError;
  Clouds? get clouds => throw _privateConstructorUsedError;
  Wind? get wind => throw _privateConstructorUsedError;
  int? get visibility => throw _privateConstructorUsedError;
  double? get pop => throw _privateConstructorUsedError;
  Sys? get sys => throw _privateConstructorUsedError;
  @JsonKey(name: 'dt_txt')
  String get dtTxt => throw _privateConstructorUsedError;
  Rain? get rain => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ForecastItemCopyWith<ForecastItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForecastItemCopyWith<$Res> {
  factory $ForecastItemCopyWith(
          ForecastItem value, $Res Function(ForecastItem) then) =
      _$ForecastItemCopyWithImpl<$Res, ForecastItem>;
  @useResult
  $Res call(
      {int? dt,
      Main? main,
      List<Weather> weather,
      Clouds? clouds,
      Wind? wind,
      int? visibility,
      double? pop,
      Sys? sys,
      @JsonKey(name: 'dt_txt') String dtTxt,
      Rain? rain});

  $MainCopyWith<$Res>? get main;
  $CloudsCopyWith<$Res>? get clouds;
  $WindCopyWith<$Res>? get wind;
  $SysCopyWith<$Res>? get sys;
  $RainCopyWith<$Res>? get rain;
}

/// @nodoc
class _$ForecastItemCopyWithImpl<$Res, $Val extends ForecastItem>
    implements $ForecastItemCopyWith<$Res> {
  _$ForecastItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dt = freezed,
    Object? main = freezed,
    Object? weather = null,
    Object? clouds = freezed,
    Object? wind = freezed,
    Object? visibility = freezed,
    Object? pop = freezed,
    Object? sys = freezed,
    Object? dtTxt = null,
    Object? rain = freezed,
  }) {
    return _then(_value.copyWith(
      dt: freezed == dt
          ? _value.dt
          : dt // ignore: cast_nullable_to_non_nullable
              as int?,
      main: freezed == main
          ? _value.main
          : main // ignore: cast_nullable_to_non_nullable
              as Main?,
      weather: null == weather
          ? _value.weather
          : weather // ignore: cast_nullable_to_non_nullable
              as List<Weather>,
      clouds: freezed == clouds
          ? _value.clouds
          : clouds // ignore: cast_nullable_to_non_nullable
              as Clouds?,
      wind: freezed == wind
          ? _value.wind
          : wind // ignore: cast_nullable_to_non_nullable
              as Wind?,
      visibility: freezed == visibility
          ? _value.visibility
          : visibility // ignore: cast_nullable_to_non_nullable
              as int?,
      pop: freezed == pop
          ? _value.pop
          : pop // ignore: cast_nullable_to_non_nullable
              as double?,
      sys: freezed == sys
          ? _value.sys
          : sys // ignore: cast_nullable_to_non_nullable
              as Sys?,
      dtTxt: null == dtTxt
          ? _value.dtTxt
          : dtTxt // ignore: cast_nullable_to_non_nullable
              as String,
      rain: freezed == rain
          ? _value.rain
          : rain // ignore: cast_nullable_to_non_nullable
              as Rain?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MainCopyWith<$Res>? get main {
    if (_value.main == null) {
      return null;
    }

    return $MainCopyWith<$Res>(_value.main!, (value) {
      return _then(_value.copyWith(main: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CloudsCopyWith<$Res>? get clouds {
    if (_value.clouds == null) {
      return null;
    }

    return $CloudsCopyWith<$Res>(_value.clouds!, (value) {
      return _then(_value.copyWith(clouds: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $WindCopyWith<$Res>? get wind {
    if (_value.wind == null) {
      return null;
    }

    return $WindCopyWith<$Res>(_value.wind!, (value) {
      return _then(_value.copyWith(wind: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SysCopyWith<$Res>? get sys {
    if (_value.sys == null) {
      return null;
    }

    return $SysCopyWith<$Res>(_value.sys!, (value) {
      return _then(_value.copyWith(sys: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $RainCopyWith<$Res>? get rain {
    if (_value.rain == null) {
      return null;
    }

    return $RainCopyWith<$Res>(_value.rain!, (value) {
      return _then(_value.copyWith(rain: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ForecastItemImplCopyWith<$Res>
    implements $ForecastItemCopyWith<$Res> {
  factory _$$ForecastItemImplCopyWith(
          _$ForecastItemImpl value, $Res Function(_$ForecastItemImpl) then) =
      __$$ForecastItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? dt,
      Main? main,
      List<Weather> weather,
      Clouds? clouds,
      Wind? wind,
      int? visibility,
      double? pop,
      Sys? sys,
      @JsonKey(name: 'dt_txt') String dtTxt,
      Rain? rain});

  @override
  $MainCopyWith<$Res>? get main;
  @override
  $CloudsCopyWith<$Res>? get clouds;
  @override
  $WindCopyWith<$Res>? get wind;
  @override
  $SysCopyWith<$Res>? get sys;
  @override
  $RainCopyWith<$Res>? get rain;
}

/// @nodoc
class __$$ForecastItemImplCopyWithImpl<$Res>
    extends _$ForecastItemCopyWithImpl<$Res, _$ForecastItemImpl>
    implements _$$ForecastItemImplCopyWith<$Res> {
  __$$ForecastItemImplCopyWithImpl(
      _$ForecastItemImpl _value, $Res Function(_$ForecastItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dt = freezed,
    Object? main = freezed,
    Object? weather = null,
    Object? clouds = freezed,
    Object? wind = freezed,
    Object? visibility = freezed,
    Object? pop = freezed,
    Object? sys = freezed,
    Object? dtTxt = null,
    Object? rain = freezed,
  }) {
    return _then(_$ForecastItemImpl(
      dt: freezed == dt
          ? _value.dt
          : dt // ignore: cast_nullable_to_non_nullable
              as int?,
      main: freezed == main
          ? _value.main
          : main // ignore: cast_nullable_to_non_nullable
              as Main?,
      weather: null == weather
          ? _value._weather
          : weather // ignore: cast_nullable_to_non_nullable
              as List<Weather>,
      clouds: freezed == clouds
          ? _value.clouds
          : clouds // ignore: cast_nullable_to_non_nullable
              as Clouds?,
      wind: freezed == wind
          ? _value.wind
          : wind // ignore: cast_nullable_to_non_nullable
              as Wind?,
      visibility: freezed == visibility
          ? _value.visibility
          : visibility // ignore: cast_nullable_to_non_nullable
              as int?,
      pop: freezed == pop
          ? _value.pop
          : pop // ignore: cast_nullable_to_non_nullable
              as double?,
      sys: freezed == sys
          ? _value.sys
          : sys // ignore: cast_nullable_to_non_nullable
              as Sys?,
      dtTxt: null == dtTxt
          ? _value.dtTxt
          : dtTxt // ignore: cast_nullable_to_non_nullable
              as String,
      rain: freezed == rain
          ? _value.rain
          : rain // ignore: cast_nullable_to_non_nullable
              as Rain?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ForecastItemImpl implements _ForecastItem {
  _$ForecastItemImpl(
      {this.dt,
      this.main,
      final List<Weather> weather = const [],
      this.clouds,
      this.wind,
      this.visibility,
      this.pop,
      this.sys,
      @JsonKey(name: 'dt_txt') this.dtTxt = '',
      this.rain})
      : _weather = weather;

  factory _$ForecastItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$ForecastItemImplFromJson(json);

  @override
  final int? dt;
  @override
  final Main? main;
  final List<Weather> _weather;
  @override
  @JsonKey()
  List<Weather> get weather {
    if (_weather is EqualUnmodifiableListView) return _weather;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_weather);
  }

  @override
  final Clouds? clouds;
  @override
  final Wind? wind;
  @override
  final int? visibility;
  @override
  final double? pop;
  @override
  final Sys? sys;
  @override
  @JsonKey(name: 'dt_txt')
  final String dtTxt;
  @override
  final Rain? rain;

  @override
  String toString() {
    return 'ForecastItem(dt: $dt, main: $main, weather: $weather, clouds: $clouds, wind: $wind, visibility: $visibility, pop: $pop, sys: $sys, dtTxt: $dtTxt, rain: $rain)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForecastItemImpl &&
            (identical(other.dt, dt) || other.dt == dt) &&
            (identical(other.main, main) || other.main == main) &&
            const DeepCollectionEquality().equals(other._weather, _weather) &&
            (identical(other.clouds, clouds) || other.clouds == clouds) &&
            (identical(other.wind, wind) || other.wind == wind) &&
            (identical(other.visibility, visibility) ||
                other.visibility == visibility) &&
            (identical(other.pop, pop) || other.pop == pop) &&
            (identical(other.sys, sys) || other.sys == sys) &&
            (identical(other.dtTxt, dtTxt) || other.dtTxt == dtTxt) &&
            (identical(other.rain, rain) || other.rain == rain));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      dt,
      main,
      const DeepCollectionEquality().hash(_weather),
      clouds,
      wind,
      visibility,
      pop,
      sys,
      dtTxt,
      rain);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ForecastItemImplCopyWith<_$ForecastItemImpl> get copyWith =>
      __$$ForecastItemImplCopyWithImpl<_$ForecastItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ForecastItemImplToJson(
      this,
    );
  }
}

abstract class _ForecastItem implements ForecastItem {
  factory _ForecastItem(
      {final int? dt,
      final Main? main,
      final List<Weather> weather,
      final Clouds? clouds,
      final Wind? wind,
      final int? visibility,
      final double? pop,
      final Sys? sys,
      @JsonKey(name: 'dt_txt') final String dtTxt,
      final Rain? rain}) = _$ForecastItemImpl;

  factory _ForecastItem.fromJson(Map<String, dynamic> json) =
      _$ForecastItemImpl.fromJson;

  @override
  int? get dt;
  @override
  Main? get main;
  @override
  List<Weather> get weather;
  @override
  Clouds? get clouds;
  @override
  Wind? get wind;
  @override
  int? get visibility;
  @override
  double? get pop;
  @override
  Sys? get sys;
  @override
  @JsonKey(name: 'dt_txt')
  String get dtTxt;
  @override
  Rain? get rain;
  @override
  @JsonKey(ignore: true)
  _$$ForecastItemImplCopyWith<_$ForecastItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
