import 'dart:convert';

Stock stockFromJson(String str) => Stock.fromJson(json.decode(str));

String stockToJson(Stock data) => json.encode(data.toJson());

class Stock {
  String exchange;
  String symbol;
  String nameOfCompany;

  Stock({
    this.exchange,
    this.symbol,
    this.nameOfCompany,
  });
  factory Stock.fromJson(Map<String, dynamic> json) => Stock(
        exchange: json["exchange"].toString(),
        symbol: json["SYMBOL"].toString(),
        nameOfCompany: json["NAME OF COMPANY"].toString(),
      );
  Map<String, dynamic> toJson() => {
        "exchange": exchange,
        "SYMBOL": symbol,
        "NAME OF COMPANY": nameOfCompany,
      };
  Map<String, dynamic> toDb() {
    var map = Map<String, dynamic>();
    map["exchange"] = exchange;
    map["symbol"] = symbol;
    map["name"] = nameOfCompany;

    return map;
  }

  factory Stock.fromDb(Map<String, dynamic> map) => Stock(
        exchange: map["exchange"],
        symbol: map["symbol"],
        nameOfCompany: map["name"],
      );
}

class StockBundle {
  final List<Stock> stocks;
  StockBundle({this.stocks});

  factory StockBundle.fromJson(List<dynamic> parsedJson) {
    List<Stock> stocks = List<Stock>();

    stocks = parsedJson.map((i) => Stock.fromJson(i)).toList();

    return StockBundle(stocks: stocks);
  }
}
