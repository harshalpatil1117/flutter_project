// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'address_details_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AddressDetailsModel _$AddressDetailsModelFromJson(Map<String, dynamic> json) {
  return _AddressDetailsModel.fromJson(json);
}

/// @nodoc
mixin _$AddressDetailsModel {
  List<GasDataModel>? get gasdata => throw _privateConstructorUsedError;
  List<ElectricityDataModel>? get eldata => throw _privateConstructorUsedError;
  String? get strStatus => throw _privateConstructorUsedError;
  String? get strMsg => throw _privateConstructorUsedError;
  String? get err => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddressDetailsModelCopyWith<AddressDetailsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddressDetailsModelCopyWith<$Res> {
  factory $AddressDetailsModelCopyWith(
          AddressDetailsModel value, $Res Function(AddressDetailsModel) then) =
      _$AddressDetailsModelCopyWithImpl<$Res, AddressDetailsModel>;
  @useResult
  $Res call(
      {List<GasDataModel>? gasdata,
      List<ElectricityDataModel>? eldata,
      String? strStatus,
      String? strMsg,
      String? err});
}

/// @nodoc
class _$AddressDetailsModelCopyWithImpl<$Res, $Val extends AddressDetailsModel>
    implements $AddressDetailsModelCopyWith<$Res> {
  _$AddressDetailsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gasdata = freezed,
    Object? eldata = freezed,
    Object? strStatus = freezed,
    Object? strMsg = freezed,
    Object? err = freezed,
  }) {
    return _then(_value.copyWith(
      gasdata: freezed == gasdata
          ? _value.gasdata
          : gasdata // ignore: cast_nullable_to_non_nullable
              as List<GasDataModel>?,
      eldata: freezed == eldata
          ? _value.eldata
          : eldata // ignore: cast_nullable_to_non_nullable
              as List<ElectricityDataModel>?,
      strStatus: freezed == strStatus
          ? _value.strStatus
          : strStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      strMsg: freezed == strMsg
          ? _value.strMsg
          : strMsg // ignore: cast_nullable_to_non_nullable
              as String?,
      err: freezed == err
          ? _value.err
          : err // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AddressDetailsModelCopyWith<$Res>
    implements $AddressDetailsModelCopyWith<$Res> {
  factory _$$_AddressDetailsModelCopyWith(_$_AddressDetailsModel value,
          $Res Function(_$_AddressDetailsModel) then) =
      __$$_AddressDetailsModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<GasDataModel>? gasdata,
      List<ElectricityDataModel>? eldata,
      String? strStatus,
      String? strMsg,
      String? err});
}

/// @nodoc
class __$$_AddressDetailsModelCopyWithImpl<$Res>
    extends _$AddressDetailsModelCopyWithImpl<$Res, _$_AddressDetailsModel>
    implements _$$_AddressDetailsModelCopyWith<$Res> {
  __$$_AddressDetailsModelCopyWithImpl(_$_AddressDetailsModel _value,
      $Res Function(_$_AddressDetailsModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gasdata = freezed,
    Object? eldata = freezed,
    Object? strStatus = freezed,
    Object? strMsg = freezed,
    Object? err = freezed,
  }) {
    return _then(_$_AddressDetailsModel(
      gasdata: freezed == gasdata
          ? _value._gasdata
          : gasdata // ignore: cast_nullable_to_non_nullable
              as List<GasDataModel>?,
      eldata: freezed == eldata
          ? _value._eldata
          : eldata // ignore: cast_nullable_to_non_nullable
              as List<ElectricityDataModel>?,
      strStatus: freezed == strStatus
          ? _value.strStatus
          : strStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      strMsg: freezed == strMsg
          ? _value.strMsg
          : strMsg // ignore: cast_nullable_to_non_nullable
              as String?,
      err: freezed == err
          ? _value.err
          : err // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AddressDetailsModel implements _AddressDetailsModel {
  const _$_AddressDetailsModel(
      {final List<GasDataModel>? gasdata,
      final List<ElectricityDataModel>? eldata,
      this.strStatus,
      this.strMsg,
      this.err})
      : _gasdata = gasdata,
        _eldata = eldata;

  factory _$_AddressDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$$_AddressDetailsModelFromJson(json);

  final List<GasDataModel>? _gasdata;
  @override
  List<GasDataModel>? get gasdata {
    final value = _gasdata;
    if (value == null) return null;
    if (_gasdata is EqualUnmodifiableListView) return _gasdata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<ElectricityDataModel>? _eldata;
  @override
  List<ElectricityDataModel>? get eldata {
    final value = _eldata;
    if (value == null) return null;
    if (_eldata is EqualUnmodifiableListView) return _eldata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? strStatus;
  @override
  final String? strMsg;
  @override
  final String? err;

  @override
  String toString() {
    return 'AddressDetailsModel(gasdata: $gasdata, eldata: $eldata, strStatus: $strStatus, strMsg: $strMsg, err: $err)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddressDetailsModel &&
            const DeepCollectionEquality().equals(other._gasdata, _gasdata) &&
            const DeepCollectionEquality().equals(other._eldata, _eldata) &&
            (identical(other.strStatus, strStatus) ||
                other.strStatus == strStatus) &&
            (identical(other.strMsg, strMsg) || other.strMsg == strMsg) &&
            (identical(other.err, err) || other.err == err));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_gasdata),
      const DeepCollectionEquality().hash(_eldata),
      strStatus,
      strMsg,
      err);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddressDetailsModelCopyWith<_$_AddressDetailsModel> get copyWith =>
      __$$_AddressDetailsModelCopyWithImpl<_$_AddressDetailsModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AddressDetailsModelToJson(
      this,
    );
  }
}

abstract class _AddressDetailsModel implements AddressDetailsModel {
  const factory _AddressDetailsModel(
      {final List<GasDataModel>? gasdata,
      final List<ElectricityDataModel>? eldata,
      final String? strStatus,
      final String? strMsg,
      final String? err}) = _$_AddressDetailsModel;

  factory _AddressDetailsModel.fromJson(Map<String, dynamic> json) =
      _$_AddressDetailsModel.fromJson;

  @override
  List<GasDataModel>? get gasdata;
  @override
  List<ElectricityDataModel>? get eldata;
  @override
  String? get strStatus;
  @override
  String? get strMsg;
  @override
  String? get err;
  @override
  @JsonKey(ignore: true)
  _$$_AddressDetailsModelCopyWith<_$_AddressDetailsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

GasDataModel _$GasDataModelFromJson(Map<String, dynamic> json) {
  return _GasDataModel.fromJson(json);
}

/// @nodoc
mixin _$GasDataModel {
  String? get mprnAddress => throw _privateConstructorUsedError;
  String? get mprn => throw _privateConstructorUsedError;
  String? get mprnandaddress => throw _privateConstructorUsedError;
  String? get postCodeMsg => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GasDataModelCopyWith<GasDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GasDataModelCopyWith<$Res> {
  factory $GasDataModelCopyWith(
          GasDataModel value, $Res Function(GasDataModel) then) =
      _$GasDataModelCopyWithImpl<$Res, GasDataModel>;
  @useResult
  $Res call(
      {String? mprnAddress,
      String? mprn,
      String? mprnandaddress,
      String? postCodeMsg});
}

/// @nodoc
class _$GasDataModelCopyWithImpl<$Res, $Val extends GasDataModel>
    implements $GasDataModelCopyWith<$Res> {
  _$GasDataModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mprnAddress = freezed,
    Object? mprn = freezed,
    Object? mprnandaddress = freezed,
    Object? postCodeMsg = freezed,
  }) {
    return _then(_value.copyWith(
      mprnAddress: freezed == mprnAddress
          ? _value.mprnAddress
          : mprnAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      mprn: freezed == mprn
          ? _value.mprn
          : mprn // ignore: cast_nullable_to_non_nullable
              as String?,
      mprnandaddress: freezed == mprnandaddress
          ? _value.mprnandaddress
          : mprnandaddress // ignore: cast_nullable_to_non_nullable
              as String?,
      postCodeMsg: freezed == postCodeMsg
          ? _value.postCodeMsg
          : postCodeMsg // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GasDataModelCopyWith<$Res>
    implements $GasDataModelCopyWith<$Res> {
  factory _$$_GasDataModelCopyWith(
          _$_GasDataModel value, $Res Function(_$_GasDataModel) then) =
      __$$_GasDataModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? mprnAddress,
      String? mprn,
      String? mprnandaddress,
      String? postCodeMsg});
}

/// @nodoc
class __$$_GasDataModelCopyWithImpl<$Res>
    extends _$GasDataModelCopyWithImpl<$Res, _$_GasDataModel>
    implements _$$_GasDataModelCopyWith<$Res> {
  __$$_GasDataModelCopyWithImpl(
      _$_GasDataModel _value, $Res Function(_$_GasDataModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mprnAddress = freezed,
    Object? mprn = freezed,
    Object? mprnandaddress = freezed,
    Object? postCodeMsg = freezed,
  }) {
    return _then(_$_GasDataModel(
      mprnAddress: freezed == mprnAddress
          ? _value.mprnAddress
          : mprnAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      mprn: freezed == mprn
          ? _value.mprn
          : mprn // ignore: cast_nullable_to_non_nullable
              as String?,
      mprnandaddress: freezed == mprnandaddress
          ? _value.mprnandaddress
          : mprnandaddress // ignore: cast_nullable_to_non_nullable
              as String?,
      postCodeMsg: freezed == postCodeMsg
          ? _value.postCodeMsg
          : postCodeMsg // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GasDataModel implements _GasDataModel {
  const _$_GasDataModel(
      {this.mprnAddress, this.mprn, this.mprnandaddress, this.postCodeMsg});

  factory _$_GasDataModel.fromJson(Map<String, dynamic> json) =>
      _$$_GasDataModelFromJson(json);

  @override
  final String? mprnAddress;
  @override
  final String? mprn;
  @override
  final String? mprnandaddress;
  @override
  final String? postCodeMsg;

  @override
  String toString() {
    return 'GasDataModel(mprnAddress: $mprnAddress, mprn: $mprn, mprnandaddress: $mprnandaddress, postCodeMsg: $postCodeMsg)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GasDataModel &&
            (identical(other.mprnAddress, mprnAddress) ||
                other.mprnAddress == mprnAddress) &&
            (identical(other.mprn, mprn) || other.mprn == mprn) &&
            (identical(other.mprnandaddress, mprnandaddress) ||
                other.mprnandaddress == mprnandaddress) &&
            (identical(other.postCodeMsg, postCodeMsg) ||
                other.postCodeMsg == postCodeMsg));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, mprnAddress, mprn, mprnandaddress, postCodeMsg);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GasDataModelCopyWith<_$_GasDataModel> get copyWith =>
      __$$_GasDataModelCopyWithImpl<_$_GasDataModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GasDataModelToJson(
      this,
    );
  }
}

abstract class _GasDataModel implements GasDataModel {
  const factory _GasDataModel(
      {final String? mprnAddress,
      final String? mprn,
      final String? mprnandaddress,
      final String? postCodeMsg}) = _$_GasDataModel;

  factory _GasDataModel.fromJson(Map<String, dynamic> json) =
      _$_GasDataModel.fromJson;

  @override
  String? get mprnAddress;
  @override
  String? get mprn;
  @override
  String? get mprnandaddress;
  @override
  String? get postCodeMsg;
  @override
  @JsonKey(ignore: true)
  _$$_GasDataModelCopyWith<_$_GasDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

ElectricityDataModel _$ElectricityDataModelFromJson(Map<String, dynamic> json) {
  return _ElectricityDataModel.fromJson(json);
}

/// @nodoc
mixin _$ElectricityDataModel {
  String? get mpanCore => throw _privateConstructorUsedError;
  String? get postcodeMsg => throw _privateConstructorUsedError;
  String? get mpanandAddres => throw _privateConstructorUsedError;
  String? get fullAdderss => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ElectricityDataModelCopyWith<ElectricityDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ElectricityDataModelCopyWith<$Res> {
  factory $ElectricityDataModelCopyWith(ElectricityDataModel value,
          $Res Function(ElectricityDataModel) then) =
      _$ElectricityDataModelCopyWithImpl<$Res, ElectricityDataModel>;
  @useResult
  $Res call(
      {String? mpanCore,
      String? postcodeMsg,
      String? mpanandAddres,
      String? fullAdderss});
}

/// @nodoc
class _$ElectricityDataModelCopyWithImpl<$Res,
        $Val extends ElectricityDataModel>
    implements $ElectricityDataModelCopyWith<$Res> {
  _$ElectricityDataModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mpanCore = freezed,
    Object? postcodeMsg = freezed,
    Object? mpanandAddres = freezed,
    Object? fullAdderss = freezed,
  }) {
    return _then(_value.copyWith(
      mpanCore: freezed == mpanCore
          ? _value.mpanCore
          : mpanCore // ignore: cast_nullable_to_non_nullable
              as String?,
      postcodeMsg: freezed == postcodeMsg
          ? _value.postcodeMsg
          : postcodeMsg // ignore: cast_nullable_to_non_nullable
              as String?,
      mpanandAddres: freezed == mpanandAddres
          ? _value.mpanandAddres
          : mpanandAddres // ignore: cast_nullable_to_non_nullable
              as String?,
      fullAdderss: freezed == fullAdderss
          ? _value.fullAdderss
          : fullAdderss // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ElectricityDataModelCopyWith<$Res>
    implements $ElectricityDataModelCopyWith<$Res> {
  factory _$$_ElectricityDataModelCopyWith(_$_ElectricityDataModel value,
          $Res Function(_$_ElectricityDataModel) then) =
      __$$_ElectricityDataModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? mpanCore,
      String? postcodeMsg,
      String? mpanandAddres,
      String? fullAdderss});
}

/// @nodoc
class __$$_ElectricityDataModelCopyWithImpl<$Res>
    extends _$ElectricityDataModelCopyWithImpl<$Res, _$_ElectricityDataModel>
    implements _$$_ElectricityDataModelCopyWith<$Res> {
  __$$_ElectricityDataModelCopyWithImpl(_$_ElectricityDataModel _value,
      $Res Function(_$_ElectricityDataModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mpanCore = freezed,
    Object? postcodeMsg = freezed,
    Object? mpanandAddres = freezed,
    Object? fullAdderss = freezed,
  }) {
    return _then(_$_ElectricityDataModel(
      mpanCore: freezed == mpanCore
          ? _value.mpanCore
          : mpanCore // ignore: cast_nullable_to_non_nullable
              as String?,
      postcodeMsg: freezed == postcodeMsg
          ? _value.postcodeMsg
          : postcodeMsg // ignore: cast_nullable_to_non_nullable
              as String?,
      mpanandAddres: freezed == mpanandAddres
          ? _value.mpanandAddres
          : mpanandAddres // ignore: cast_nullable_to_non_nullable
              as String?,
      fullAdderss: freezed == fullAdderss
          ? _value.fullAdderss
          : fullAdderss // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ElectricityDataModel implements _ElectricityDataModel {
  const _$_ElectricityDataModel(
      {this.mpanCore, this.postcodeMsg, this.mpanandAddres, this.fullAdderss});

  factory _$_ElectricityDataModel.fromJson(Map<String, dynamic> json) =>
      _$$_ElectricityDataModelFromJson(json);

  @override
  final String? mpanCore;
  @override
  final String? postcodeMsg;
  @override
  final String? mpanandAddres;
  @override
  final String? fullAdderss;

  @override
  String toString() {
    return 'ElectricityDataModel(mpanCore: $mpanCore, postcodeMsg: $postcodeMsg, mpanandAddres: $mpanandAddres, fullAdderss: $fullAdderss)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ElectricityDataModel &&
            (identical(other.mpanCore, mpanCore) ||
                other.mpanCore == mpanCore) &&
            (identical(other.postcodeMsg, postcodeMsg) ||
                other.postcodeMsg == postcodeMsg) &&
            (identical(other.mpanandAddres, mpanandAddres) ||
                other.mpanandAddres == mpanandAddres) &&
            (identical(other.fullAdderss, fullAdderss) ||
                other.fullAdderss == fullAdderss));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, mpanCore, postcodeMsg, mpanandAddres, fullAdderss);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ElectricityDataModelCopyWith<_$_ElectricityDataModel> get copyWith =>
      __$$_ElectricityDataModelCopyWithImpl<_$_ElectricityDataModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ElectricityDataModelToJson(
      this,
    );
  }
}

abstract class _ElectricityDataModel implements ElectricityDataModel {
  const factory _ElectricityDataModel(
      {final String? mpanCore,
      final String? postcodeMsg,
      final String? mpanandAddres,
      final String? fullAdderss}) = _$_ElectricityDataModel;

  factory _ElectricityDataModel.fromJson(Map<String, dynamic> json) =
      _$_ElectricityDataModel.fromJson;

  @override
  String? get mpanCore;
  @override
  String? get postcodeMsg;
  @override
  String? get mpanandAddres;
  @override
  String? get fullAdderss;
  @override
  @JsonKey(ignore: true)
  _$$_ElectricityDataModelCopyWith<_$_ElectricityDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}
