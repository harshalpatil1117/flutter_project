class AddressDetailsRequest {
  int? intFuelType;
  String? strPostCode;
  String? housenumber;

  AddressDetailsRequest({this.intFuelType, this.strPostCode, this.housenumber});

  AddressDetailsRequest.fromJson(Map<String, dynamic> json) {
    intFuelType = json['intFuelType'];
    strPostCode = json['strPostCode'];
    housenumber = json['Housenumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['intFuelType'] = this.intFuelType;
    data['strPostCode'] = this.strPostCode;
    data['Housenumber'] = this.housenumber;
    return data;
  }
}