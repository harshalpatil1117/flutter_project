class AddressDetailsResponse {
  final List<Gasdata>? gasdata;
  final List<Eldata>? eldata;
  final String? strStatus;
  final String? strMsg;
  final String? err;

  const AddressDetailsResponse({
    this.gasdata,
    this.eldata,
    this.strStatus,
    this.strMsg,
    this.err,
  });

  factory AddressDetailsResponse.fromJson(Map<String, dynamic> json) {
    List<Gasdata>? gasdataList;
    List<Eldata>? eldataList;

    if (json['Gasdata'] != null) {
      gasdataList = <Gasdata>[];
      json['Gasdata'].forEach((v) {
        gasdataList?.add(Gasdata.fromJson(v));
      });
    }

    if (json['Eldata'] != null) {
      eldataList = <Eldata>[];
      json['Eldata'].forEach((v) {
        eldataList?.add(Eldata.fromJson(v));
      });
    }

    return AddressDetailsResponse(
      gasdata: gasdataList,
      eldata: eldataList,
      strStatus: json['strStatus'],
      strMsg: json['strMsg'],
      err: json['err'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'strStatus': this.strStatus,
      'strMsg': this.strMsg,
      'err': this.err,
    };

    if (this.gasdata != null) {
      data['Gasdata'] = this.gasdata!.map((v) => v.toJson()).toList();
    }

    if (this.eldata != null) {
      data['Eldata'] = this.eldata!.map((v) => v.toJson()).toList();
    }

    return data;
  }
}

class Gasdata {
  final String? mprnAddress;
  final String? mprn;
  final String? mprnandaddress;
  final String? postCodeMsg;

  const Gasdata({
    this.mprnAddress,
    this.mprn,
    this.mprnandaddress,
    this.postCodeMsg,
  });

  factory Gasdata.fromJson(Map<String, dynamic> json) {
    return Gasdata(
      mprnAddress: json['MprnAddress'],
      mprn: json['Mprn'],
      mprnandaddress: json['Mprnandaddress'],
      postCodeMsg: json['Post_code_Msg'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'MprnAddress': this.mprnAddress,
      'Mprn': this.mprn,
      'Mprnandaddress': this.mprnandaddress,
      'Post_code_Msg': this.postCodeMsg,
    };
    return data;
  }
}

class Eldata {
  final String? mpanCore;
  final String? postcodeMsg;
  final String? mpanandAddres;
  final String? fullAdderss;

  const Eldata({
    this.mpanCore,
    this.postcodeMsg,
    this.mpanandAddres,
    this.fullAdderss,
  });

  factory Eldata.fromJson(Map<String, dynamic> json) {
    return Eldata(
      mpanCore: json['mpan_core'],
      postcodeMsg: json['Postcode_msg'],
      mpanandAddres: json['mpanandAddres'],
      fullAdderss: json['Full_Adderss'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'mpan_core': this.mpanCore,
      'Postcode_msg': this.postcodeMsg,
      'mpanandAddres': this.mpanandAddres,
      'Full_Adderss': this.fullAdderss,
    };
    return data;
  }
}
