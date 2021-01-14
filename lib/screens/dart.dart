// class SecondRoute extends StatelessWidget {
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       appBar: new AppBar(
//         title: new Text('Lists'),
//         backgroundColor: new Color(0xFF000000),
//       ),
//       body: DynamicChange(),
//     );
//   }
// }

// class DynamicChange extends StatefulWidget {
//   @override
//   StateDynamic createState() => StateDynamic();
// } // Class SecondRoute

// class StateDynamic extends State<DynamicChange> {
//   int number = 10;

//   Widget build(BuildContext context) {
//     return new Scaffold(
//       body: thisScreenNeeds(),
//     );
//   }

//   Widget thisScreenNeeds() {
//     return Container(
//         margin: EdgeInsets.only(top: 100, left: 50),
//         child: FlatButton(
//           child: Text(
//             number.toString(),
//             textAlign: TextAlign.center,
//             style: (TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 60,
//                 color: Colors.green)),
//           ),
//           onPressed: () {
//             setState(() {
//               number++;
//             });
//           },
//         ));
//   }
// }
