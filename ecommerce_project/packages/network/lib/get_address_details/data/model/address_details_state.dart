import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:network/get_address_details/data/model/address_details_response.dart';
import 'address_details_model.dart';

part 'address_details_state.freezed.dart';

@freezed
class AddressDetailsState with _$AddressDetailsState {
  factory AddressDetailsState({
    @Default(AddressDetailsResponse()) AddressDetailsResponse addressDetailsResponse,
    @Default(true) bool isLoading,
  }) = _AddressDetailsState;
}
