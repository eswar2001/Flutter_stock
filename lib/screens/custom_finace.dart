import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

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
      url: "https://eswar.dev/Flutter_stock#" +
          widget.stockName +
          "?apiKey=GTVXYTXB1HWRRJD8",
      withJavascript: true,
      withZoom: true,
      appBar: AppBar(
        title: Text("${widget.stockName}"),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
    );
  }
}
