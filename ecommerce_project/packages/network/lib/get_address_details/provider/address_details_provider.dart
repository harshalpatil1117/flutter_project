import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:network/core/shared_provider/shared_providers.dart';
import 'package:network/get_address_details/data/api/address_details_api.dart';
import 'package:network/get_address_details/data/model/address_details_state.dart';
import '../data/repository/address_details_repository.dart';
import 'address_details_state_provider.dart';

final addressDetailsApiProvider = Provider<AddressDetailsApi>(
  (ref) {
    return AddressDetailsApi(
      ref.read(dioClientProvider),
    );
  },
);

final addressDetailsRepositoryProvider = Provider<AddressDetailsRepository>(
  (ref) {
    return AddressDetailsRepository(
      ref.read(addressDetailsApiProvider),
    );
  },
);

final addressDetailsDataProvider =
    StateNotifierProvider<AddressDetailsDataNotifier, AddressDetailsState>(
  (ref) {
    return AddressDetailsDataNotifier(
      ref.read(addressDetailsRepositoryProvider),
    );
  },
);
