import 'package:flutter/material.dart';
import 'package:DolingerTestProject/screens/firstScreen.dart';

void main() => runApp(TestApp());

class TestApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Тестовое задание';
    return MaterialApp(
        title: appTitle,
        theme: ThemeData(
          // accentColor: Colors.black87,
          primaryColor: Colors.white,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          // accentColor: Colors.white,
          // textTheme: TextTheme(bodyText2: TextStyle(color: Colors.black54)),
          //ignore: deprecated_member_use
        ),
        home: FirstPage());
    // home: AutorizationPage
  }
}
