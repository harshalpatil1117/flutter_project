import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:network/get_address_details/data/model/address_details_state.dart';
import '../data/repository/address_details_repository.dart';

class AddressDetailsDataNotifier extends StateNotifier<AddressDetailsState> {
  AddressDetailsDataNotifier(this.addressDetailsRepository)
      : super(AddressDetailsState());

  AddressDetailsRepository addressDetailsRepository;

  Future<void> addressDetails(
    Map<String, dynamic> requestModel,
  ) async {
    state = state.copyWith(isLoading: true);
    await addressDetailsRepository
        .addressDetailsRepo(
      requestModel,
    )
        .then((data) {
      state = state.copyWith(
        addressDetailsResponse: data,
        isLoading: false,
      );
    });
  }
}
