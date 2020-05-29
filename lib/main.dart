import 'dart:async';

import 'package:flutter/material.dart';
import 'screens/stock_list.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SplashScreen(),
  ));
}

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SplashScreenState();
  }
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    loadData();
  }

  Future<Timer> loadData() async {
    return new Timer(Duration(seconds: 2), onDoneLoading);
  }

  onDoneLoading() async {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => Watchlist()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(width: 7),
            Text(
              'Made With',
              style: TextStyle(
                  color: Color(0xffff0266),
                  fontSize: 20.0,
                  wordSpacing: 2.0,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(width: 7),
            Icon(Icons.favorite, color: Colors.white),
            SizedBox(width: 7),
            Text(
              'Flutter',
              style: TextStyle(
                  color: Color(0xffff0266),
                  fontSize: 20.0,
                  wordSpacing: 2.0,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}

class Watchlist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Watchlist",
      home: StockList(),
      debugShowCheckedModeBanner: false,
    );
  }
}
