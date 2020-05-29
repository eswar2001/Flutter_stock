import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class FinanceGoogle extends StatefulWidget {
  @override
  _FinanceGoogleState createState() => _FinanceGoogleState();
}

class _FinanceGoogleState extends State<FinanceGoogle> {
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: "https://www.google.com/finance",
      withJavascript: true,
      withZoom: true,
      appBar: AppBar(
        title: Text("finance (Google)"),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
    );
  }
}
