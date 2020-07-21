import 'dart:convert';

Stock stockFromJson(String str) => Stock.fromJson(json.decode(str));

String stockToJson(Stock data) => json.encode(data.toJson());

class Stock {
  String symbol;
  String nameOfCompany;

  Stock({
    this.symbol,
    this.nameOfCompany,
  });
  factory Stock.fromJson(Map<String, dynamic> json) => Stock(
        symbol: json["SYMBOL"].toString(),
        nameOfCompany: json["NAME OF COMPANY"].toString(),
      );
  Map<String, dynamic> toJson() => {
        "SYMBOL": symbol,
        "NAME OF COMPANY": nameOfCompany,
      };
  Map<String, dynamic> toDb() {
    var map = Map<String, dynamic>();

    map["symbol"] = symbol;
    map["name"] = nameOfCompany;

    return map;
  }

  factory Stock.fromDb(Map<String, dynamic> map) => Stock(
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
