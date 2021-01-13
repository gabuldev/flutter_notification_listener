import 'package:flutter/material.dart';
import 'package:notification_listener/src/home/home_page.dart';
import 'package:notification_listener/src/utils/nav2.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Navigator 2.0',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Nav2Widget(home: HomePage()),
    );
  }
}
