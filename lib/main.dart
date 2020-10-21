import 'package:flutter/material.dart';
import 'package:piroduidku/HomeScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PiroDuidku',
      theme: ThemeData.light(),
      home: HomeScreen(),
    );
  }
}