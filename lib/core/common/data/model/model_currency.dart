

class Model_Currency {
  String? currency;
  String? currencyCode;

  Model_Currency({this.currency, this.currencyCode});

  Model_Currency.fromJson(Map<String, dynamic> json) {
    currency = json['currency'];
    currencyCode = json['currencyCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['currency'] = this.currency;
    data['currencyCode'] = this.currencyCode;
    return data;
  }
}