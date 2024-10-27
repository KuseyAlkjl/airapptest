

class LegsModel {
  int? legId;
  String? flightNo;
  String? airlineCode;
  String? airline;
  String? depTime;
  String? arrTime;
  String? flightId;
  String? depPort;
  String? arrPort;
  String? flightDate;
  String? via;
  PriceDetail? priceDetail;
  List<PassengerPrices>? passengerPrices;

  LegsModel(
      {this.legId,
        this.flightNo,
        this.airlineCode,
        this.airline,
        this.depTime,
        this.arrTime,
        this.flightId,
        this.depPort,
        this.arrPort,
        this.flightDate,
        this.via,
        this.priceDetail,
        this.passengerPrices});

  LegsModel.fromJson(Map<String, dynamic> json) {
    legId = json['legId'];
    flightNo = json['flightNo'];
    airlineCode = json['airlineCode'];
    airline = json['airline'];
    depTime = json['depTime'];
    arrTime = json['arrTime'];
    flightId = json['flightId'];
    depPort = json['depPort'];
    arrPort = json['arrPort'];
    flightDate = json['flightDate'];
    via = json['via'];
    priceDetail = json['priceDetail'] != null
        ? new PriceDetail.fromJson(json['priceDetail'])
        : null;
    if (json['passengerPrices'] != null) {
      passengerPrices = <PassengerPrices>[];
      json['passengerPrices'].forEach((v) {
        passengerPrices!.add(new PassengerPrices.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['legId'] = this.legId;
    data['flightNo'] = this.flightNo;
    data['airlineCode'] = this.airlineCode;
    data['airline'] = this.airline;
    data['depTime'] = this.depTime;
    data['arrTime'] = this.arrTime;
    data['flightId'] = this.flightId;
    data['depPort'] = this.depPort;
    data['arrPort'] = this.arrPort;
    data['flightDate'] = this.flightDate;
    data['via'] = this.via;
    if (this.priceDetail != null) {
      data['priceDetail'] = this.priceDetail!.toJson();
    }
    if (this.passengerPrices != null) {
      data['passengerPrices'] =
          this.passengerPrices!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PriceDetail {
  TotalTax? basePrice;
  TotalTax? totalTax;
  TotalTax? surcharge;
  TotalTax? salesPrice;

  PriceDetail({this.basePrice, this.totalTax, this.surcharge, this.salesPrice});

  PriceDetail.fromJson(Map<String, dynamic> json) {
    basePrice = json['basePrice'] != null
        ? new TotalTax.fromJson(json['basePrice'])
        : null;
    totalTax = json['totalTax'] != null
        ? new TotalTax.fromJson(json['totalTax'])
        : null;
    surcharge = json['surcharge'] != null
        ? new TotalTax.fromJson(json['surcharge'])
        : null;
    salesPrice = json['salesPrice'] != null
        ? new TotalTax.fromJson(json['salesPrice'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.basePrice != null) {
      data['basePrice'] = this.basePrice!.toJson();
    }
    if (this.totalTax != null) {
      data['totalTax'] = this.totalTax!.toJson();
    }
    if (this.surcharge != null) {
      data['surcharge'] = this.surcharge!.toJson();
    }
    if (this.salesPrice != null) {
      data['salesPrice'] = this.salesPrice!.toJson();
    }
    return data;
  }
}

class BasePrice {
  double? amount;
  String? currency;

  BasePrice({this.amount, this.currency});

  BasePrice.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    currency = json['currency'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amount'] = this.amount;
    data['currency'] = this.currency;
    return data;
  }
}

class TotalTax {
  var amount;
  String? currency;

  TotalTax({this.amount, this.currency});

  TotalTax.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    currency = json['currency'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amount'] = this.amount;
    data['currency'] = this.currency;
    return data;
  }
}

class PassengerPrices {
  String? type;
  PriceDetail? priceDetail;
  PriceDetail? totalPriceDetail;

  PassengerPrices({this.type, this.priceDetail, this.totalPriceDetail});

  PassengerPrices.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    priceDetail = json['priceDetail'] != null
        ? new PriceDetail.fromJson(json['priceDetail'])
        : null;
    totalPriceDetail = json['totalPriceDetail'] != null
        ? new PriceDetail.fromJson(json['totalPriceDetail'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    if (this.priceDetail != null) {
      data['priceDetail'] = this.priceDetail!.toJson();
    }
    if (this.totalPriceDetail != null) {
      data['totalPriceDetail'] = this.totalPriceDetail!.toJson();
    }
    return data;
  }
}