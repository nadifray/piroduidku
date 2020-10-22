import 'package:flutter/material.dart';
import 'file:///D:/Programming/Android/piroduidku3/lib/Page/home_page.dart';

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