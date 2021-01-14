// import 'package:DolingerTestProject/widgets/FourElements.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:cached_network_image/cached_network_image.dart';
//Скрыть StatusBar
import 'package:flutter/services.dart';

class SecondRoute extends StatelessWidget {
  SecondRoute(this.startText, this.showPlaceholderCirc);
  final String startText;
  final bool showPlaceholderCirc;

  Widget build(BuildContext context) {
    print(startText);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(
          title: '', url: startText, showPlaceholderCirc: showPlaceholderCirc),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title, this.url, this.showPlaceholderCirc})
      : super(key: key);
  final String title;
  final String url;
  final bool showPlaceholderCirc;

  @override
  _MyHomePageState createState() =>
      _MyHomePageState(url: url, showPlaceholderCirc: showPlaceholderCirc);
}

class _MyHomePageState extends State<MyHomePage> {
  _MyHomePageState({this.url, this.showPlaceholderCirc});
  final String url;
  final bool showPlaceholderCirc;
  // int _counter = 0;

  // void _incrementCounter() {
  //   setState(() {
  //     // _counter++;
  //   });
  // }

  //Скрыть StatusBar
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // body: FirstWidgetFourElements(),
        );
  }
}
