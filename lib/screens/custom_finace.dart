import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

import 'tradingview.dart';

class FinanceGoogle extends StatefulWidget {
  final String stockName;
  FinanceGoogle({this.stockName});
  @override
  _FinanceGoogleState createState() => _FinanceGoogleState();
}

class _FinanceGoogleState extends State<FinanceGoogle> {
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: "https://eswar.dev/Flutter_stock#" + widget.stockName,
      withJavascript: true,
      withZoom: true,
      appBar: AppBar(
        title: Text("${widget.stockName}"),
        backgroundColor: Colors.black,
        centerTitle: true,
        actions: [
          FloatingActionButton(
            heroTag: "btn1",
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) =>
                      WebPageView(stockName: widget.stockName),
                ),
              );
            },
            child: Icon(
              Icons.launch,
              color: Colors.black,
            ),
            backgroundColor: Colors.purple[200],
          ),
        ],
      ),
    );
  }
}
