import 'package:flutter/material.dart';
import 'package:flutter_stock/classes/stock.dart';
import 'package:flutter_stock/models/db_helper.dart';
import 'package:flutter_stock/screens/select.dart';
import 'package:flutter_stock/screens/tradingview.dart';
import 'dart:convert';
import 'dart:async';
import 'package:flutter/services.dart' show rootBundle;
import 'package:lottie/lottie.dart';

import '../main.dart';
import 'custom_finace.dart';

List<Stock> favs = [];
final db = StockDataBase();

void addStockToDb(Stock stock) async {
  await db.addStock(stock);
}

Future<String> loadStockAsset() async {
  return await rootBundle.loadString('assets/stocks.json');
}

Future<List<Stock>> loadStocks() async {
  String jsonString = await loadStockAsset();
  final jsonResponse = json.decode(jsonString);
  StockBundle s = StockBundle.fromJson(jsonResponse);
  return s.stocks;
}

class StockList extends StatefulWidget {
  @override
  _StockListState createState() => _StockListState();
}

class _StockListState extends State<StockList> {
  void setupList() async {
    var stocks = await db.fetchAll();
    setState(() {
      favs = stocks;
    });
  }

  @override
  void initState() {
    super.initState();
    setupList();
  }

  List<Widget> StackElements(BuildContext context) {
    return <Widget>[
      AppBar(
        backgroundColor: Colors.black,
      ),
      SizedBox(
        height: 30.0,
      ),
      Padding(
        padding: const EdgeInsets.only(top: 15.0, bottom: 20.0),
        child: Center(
          child: Container(
            child: Text(
              "Stocks",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 40),
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 50.0, bottom: 50.0),
        child: SizedBox(
          height: 200.0,
          child: Center(
            child: Lottie.network(
              'https://assets3.lottiefiles.com/packages/lf20_CFAjrg.json',
              width: 200,
              height: 200,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(
            top: 250, left: 20.0, right: 20.0, bottom: 5.0),
        child: Container(
          // margin: EdgeInsets.only(
          //     top: 170, left: MediaQuery.of(context).size.width * 0.5 - 30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FloatingActionButton(
                heroTag: "btn2",
                tooltip: 'To add wish list',
                child: Icon(
                  Icons.add,
                  color: Colors.black,
                ),
                onPressed: () {
                  showSearch(
                    context: context,
                    delegate: DataSearch(),
                  );
                },
                backgroundColor: Colors.purple[200],
              ),
            ],
          ),
        ),
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: <Widget>[
          Stack(
            children: StackElements(context),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: favs.length,
              itemBuilder: (context, index) {
                return FlatButton(
                  child: ListTile(
                    focusColor: Colors.purple[200],
                    title: Center(
                      child: Text(
                        favs[index].nameOfCompany.length > 30
                            ? favs[index].symbol
                            : favs[index].nameOfCompany,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) =>
                            FinanceGoogle(stockName: favs[index].symbol),
                      ),
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class DataSearch extends SearchDelegate<String> {
  Future<List<Stock>> items = loadStocks();

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      color: Colors.purple[200],
      icon: AnimatedIcon(
        color: Colors.black,
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      color: Colors.black,
      child: LinearProgressIndicator(
        backgroundColor: Colors.black,
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder<List<Stock>>(
      future: loadStocks(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              if (query.length > 3 &&
                  snapshot.data[index].nameOfCompany.toLowerCase().startsWith(
                        query.toLowerCase(),
                      )) {
                return FlatButton(
                  color: Colors.purple[200],
                  child: ListTile(
                    title: Text(
                      snapshot.data[index].nameOfCompany,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    leading: Icon(
                      Icons.location_city,
                      color: Colors.black,
                    ),
                  ),
                  onPressed: () {
                    favs.add(snapshot.data[index]);
                    addStockToDb(snapshot.data[index]);
                    Navigator.pop(context);
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) => Watchlist(),
                      ),
                    );
                    // close(context, null);
                  },
                );
              } else {
                return Column();
              }
            },
          );
        } else {
          return Container(
            color: Colors.black,
            child: LinearProgressIndicator(
              backgroundColor: Colors.black,
            ),
          );
        }
      },
    );
  }
}
