import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class FinanceGoogle extends StatefulWidget {
  final String stockName;
  FinanceGoogle({this.stockName});
  @override
  _FinanceGoogleState createState() => _FinanceGoogleState();
}

class _FinanceGoogleState extends State<FinanceGoogle> {
  get stockName => null;

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: "https://eswar.dev/Flutter_stock/",
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
