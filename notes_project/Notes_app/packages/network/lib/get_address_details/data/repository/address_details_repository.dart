import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:network/core/network/dio_exceptions.dart';
import 'package:network/get_address_details/data/api/address_details_api.dart';
import 'package:network/get_address_details/data/model/address_details_model.dart';
import 'package:network/get_address_details/data/model/address_details_response.dart';

class AddressDetailsRepository {
  final AddressDetailsApi _addressDetailsApi;

  AddressDetailsRepository(this._addressDetailsApi);

  Future<AddressDetailsResponse> addressDetailsRepo(
    Map<String, dynamic> requestModel,
  ) async {
    try {
      final res = await _addressDetailsApi.addressDetailsCall(
        requestModel,
      );
      final responseModel = AddressDetailsResponse.fromJson(
        res,
      );
      return responseModel;
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e);
      log(
        errorMessage.toString(),
      );
      Fluttertoast.showToast(
        msg: errorMessage.toString(),
        backgroundColor: Colors.red[50],
        gravity: ToastGravity.TOP,
        textColor: Colors.red,
      );
      rethrow;
    }
  }
}
