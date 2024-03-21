// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'address_details_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AddressDetailsState {
  AddressDetailsResponse get addressDetailsResponse =>
      throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddressDetailsStateCopyWith<AddressDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddressDetailsStateCopyWith<$Res> {
  factory $AddressDetailsStateCopyWith(
          AddressDetailsState value, $Res Function(AddressDetailsState) then) =
      _$AddressDetailsStateCopyWithImpl<$Res, AddressDetailsState>;
  @useResult
  $Res call({AddressDetailsResponse addressDetailsResponse, bool isLoading});
}

/// @nodoc
class _$AddressDetailsStateCopyWithImpl<$Res, $Val extends AddressDetailsState>
    implements $AddressDetailsStateCopyWith<$Res> {
  _$AddressDetailsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? addressDetailsResponse = null,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      addressDetailsResponse: null == addressDetailsResponse
          ? _value.addressDetailsResponse
          : addressDetailsResponse // ignore: cast_nullable_to_non_nullable
              as AddressDetailsResponse,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AddressDetailsStateCopyWith<$Res>
    implements $AddressDetailsStateCopyWith<$Res> {
  factory _$$_AddressDetailsStateCopyWith(_$_AddressDetailsState value,
          $Res Function(_$_AddressDetailsState) then) =
      __$$_AddressDetailsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AddressDetailsResponse addressDetailsResponse, bool isLoading});
}

/// @nodoc
class __$$_AddressDetailsStateCopyWithImpl<$Res>
    extends _$AddressDetailsStateCopyWithImpl<$Res, _$_AddressDetailsState>
    implements _$$_AddressDetailsStateCopyWith<$Res> {
  __$$_AddressDetailsStateCopyWithImpl(_$_AddressDetailsState _value,
      $Res Function(_$_AddressDetailsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? addressDetailsResponse = null,
    Object? isLoading = null,
  }) {
    return _then(_$_AddressDetailsState(
      addressDetailsResponse: null == addressDetailsResponse
          ? _value.addressDetailsResponse
          : addressDetailsResponse // ignore: cast_nullable_to_non_nullable
              as AddressDetailsResponse,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_AddressDetailsState implements _AddressDetailsState {
  _$_AddressDetailsState(
      {this.addressDetailsResponse = const AddressDetailsResponse(),
      this.isLoading = true});

  @override
  @JsonKey()
  final AddressDetailsResponse addressDetailsResponse;
  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString() {
    return 'AddressDetailsState(addressDetailsResponse: $addressDetailsResponse, isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddressDetailsState &&
            (identical(other.addressDetailsResponse, addressDetailsResponse) ||
                other.addressDetailsResponse == addressDetailsResponse) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, addressDetailsResponse, isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddressDetailsStateCopyWith<_$_AddressDetailsState> get copyWith =>
      __$$_AddressDetailsStateCopyWithImpl<_$_AddressDetailsState>(
          this, _$identity);
}

abstract class _AddressDetailsState implements AddressDetailsState {
  factory _AddressDetailsState(
      {final AddressDetailsResponse addressDetailsResponse,
      final bool isLoading}) = _$_AddressDetailsState;

  @override
  AddressDetailsResponse get addressDetailsResponse;
  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$_AddressDetailsStateCopyWith<_$_AddressDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}
