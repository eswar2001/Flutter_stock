// import 'package:flutter/material.dart';
// import 'custom_finace.dart';
// import 'tradingview.dart';

// class Selectpage extends StatefulWidget {
//   final symbol;
//   const Selectpage({Key key, this.symbol}) : super(key: key);
//   @override
//   _SelectpageState createState() => _SelectpageState();
// }

// class _SelectpageState extends State<Selectpage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.symbol),
//       ),
//       body: ListView(
//         children: [
//           SizedBox(
//             height: 100.0,
//           ),
//           Row(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               FloatingActionButton(
//                 heroTag: "btn1",
//                 onPressed: () {
//                   Navigator.of(context).push(
//                     MaterialPageRoute(
//                       builder: (BuildContext context) =>
//                           FinanceGoogle(stockName: widget.symbol),
//                     ),
//                   );
//                 },
//                 child: Icon(
//                   Icons.grain,
//                   color: Colors.black,
//                 ),
//                 backgroundColor: Colors.purple[200],
//               ),
              
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
