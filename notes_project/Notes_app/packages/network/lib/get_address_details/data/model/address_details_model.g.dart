// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AddressDetailsModel _$$_AddressDetailsModelFromJson(
        Map<String, dynamic> json) =>
    _$_AddressDetailsModel(
      gasdata: (json['gasdata'] as List<dynamic>?)
          ?.map((e) => GasDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      eldata: (json['eldata'] as List<dynamic>?)
          ?.map((e) => ElectricityDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      strStatus: json['strStatus'] as String?,
      strMsg: json['strMsg'] as String?,
      err: json['err'] as String?,
    );

Map<String, dynamic> _$$_AddressDetailsModelToJson(
        _$_AddressDetailsModel instance) =>
    <String, dynamic>{
      'gasdata': instance.gasdata,
      'eldata': instance.eldata,
      'strStatus': instance.strStatus,
      'strMsg': instance.strMsg,
      'err': instance.err,
    };

_$_GasDataModel _$$_GasDataModelFromJson(Map<String, dynamic> json) =>
    _$_GasDataModel(
      mprnAddress: json['mprnAddress'] as String?,
      mprn: json['mprn'] as String?,
      mprnandaddress: json['mprnandaddress'] as String?,
      postCodeMsg: json['postCodeMsg'] as String?,
    );

Map<String, dynamic> _$$_GasDataModelToJson(_$_GasDataModel instance) =>
    <String, dynamic>{
      'mprnAddress': instance.mprnAddress,
      'mprn': instance.mprn,
      'mprnandaddress': instance.mprnandaddress,
      'postCodeMsg': instance.postCodeMsg,
    };

_$_ElectricityDataModel _$$_ElectricityDataModelFromJson(
        Map<String, dynamic> json) =>
    _$_ElectricityDataModel(
      mpanCore: json['mpanCore'] as String?,
      postcodeMsg: json['postcodeMsg'] as String?,
      mpanandAddres: json['mpanandAddres'] as String?,
      fullAdderss: json['fullAdderss'] as String?,
    );

Map<String, dynamic> _$$_ElectricityDataModelToJson(
        _$_ElectricityDataModel instance) =>
    <String, dynamic>{
      'mpanCore': instance.mpanCore,
      'postcodeMsg': instance.postcodeMsg,
      'mpanandAddres': instance.mpanandAddres,
      'fullAdderss': instance.fullAdderss,
    };
