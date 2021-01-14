import 'package:flutter/material.dart';
import 'package:DolingerTestProject/screens/firstScreen.dart';

void main() => runApp(TestApp());

class TestApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Тестовое задание';
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: appTitle,
        theme: ThemeData(
          primaryColor: Colors.white,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: FirstPage());
  }
}
