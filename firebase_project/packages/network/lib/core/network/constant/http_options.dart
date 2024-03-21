import 'package:dio/dio.dart';

class HttpOptions {
  static Map<String, dynamic> getHeader(String authToken) {
    return {
      'Authorization':  authToken,
      'Accept': 'application/json',
    };
  }

  static Options getOptions(Map<String, dynamic>? header) {
    return Options(
      headers: header ?? {},
      contentType: "application/json",
    );
  }

  static Options getMultipartOptions(
      Map<String, dynamic>? header, var formData) {
    return Options(
      headers: header ?? {},
      contentType: 'multipart/form-data; boundary=${formData.boundary}',
    );
  }
}
