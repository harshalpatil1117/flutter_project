class Endpoints {
  // base url
  static const String baseUrl = "https://smartpayapi.pozitivehub.com/";

  // receiveTimeout
  static const int receiveTimeout = 60000;

  // connectTimeout
  static const int connectionTimeout = 30000;

  static const String getAddressDetails = '${baseUrl}Api/SmartPayAPI/GetAddressDetails';
}
