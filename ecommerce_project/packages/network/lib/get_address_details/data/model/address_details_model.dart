import 'package:freezed_annotation/freezed_annotation.dart';

part 'address_details_model.freezed.dart';
part 'address_details_model.g.dart';


@freezed
class AddressDetailsModel with _$AddressDetailsModel {
  const factory AddressDetailsModel({
    List<GasDataModel>? gasdata,
    List<ElectricityDataModel>? eldata,
    String? strStatus,
    String? strMsg,
    String? err,
  }) = _AddressDetailsModel;

  factory AddressDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$AddressDetailsModelFromJson(json);
}

@freezed
class GasDataModel with _$GasDataModel {
  const factory GasDataModel({
    String? mprnAddress,
    String? mprn,
    String? mprnandaddress,
    String? postCodeMsg,
  }) = _GasDataModel;

  factory GasDataModel.fromJson(Map<String, dynamic> json) =>
      _$GasDataModelFromJson(json);
}

@freezed
class ElectricityDataModel with _$ElectricityDataModel {
  const factory ElectricityDataModel({
    String? mpanCore,
    String? postcodeMsg,
    String? mpanandAddres,
    String? fullAdderss,
  }) = _ElectricityDataModel;

  factory ElectricityDataModel.fromJson(Map<String, dynamic> json) =>
      _$ElectricityDataModelFromJson(json);
}
