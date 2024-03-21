import 'dart:convert';

import 'package:network/core/network/constant/endpoints.dart';
import 'package:network/core/network/constant/http_options.dart';
import 'package:network/core/network/dio_client.dart';

class AddressDetailsApi {
  // dio instance
  final DioClient _dioClient;

  // injecting dio instance
  AddressDetailsApi(this._dioClient);

  Future<Map<String, dynamic>> addressDetailsCall(
    Map<String, dynamic> requestModel,
  ) async {
    try {
      final res = await _dioClient.post(
        Endpoints.getAddressDetails,
        data: requestModel,
        // options: HttpOptions.getOptions(
        //   HttpOptions.getHeader(accessToken),
        // ),
      );
      return res.data;
    } catch (e) {
      rethrow;
    }
  }
}
