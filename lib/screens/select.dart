import 'package:flutter/material.dart';
import 'custom_finace.dart';
import 'tradingview.dart';

class Selectpage extends StatefulWidget {
  final symbol;
  const Selectpage({Key key, this.symbol}) : super(key: key);
  @override
  _SelectpageState createState() => _SelectpageState();
}

class _SelectpageState extends State<Selectpage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          FloatingActionButton(
            heroTag: "btn1",
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => FinanceGoogle(),
                ),
              );
            },
            child: Icon(
              Icons.search,
              color: Colors.black,
            ),
            backgroundColor: Colors.purple[200],
          ),
          FloatingActionButton(
            heroTag: "btn1",
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) =>
                      WebPageView(stockName: widget.symbol),
                ),
              );
            },
            child: Icon(
              Icons.search,
              color: Colors.black,
            ),
            backgroundColor: Colors.purple[200],
          ),
        ],
      ),
    );
  }
}
