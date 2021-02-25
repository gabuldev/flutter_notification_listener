import 'dart:math';

import 'package:flutter/material.dart';

class NavigatorExample extends StatefulWidget {
  NavigatorExample({Key key}) : super(key: key);

  @override
  _NavigatorExampleState createState() => _NavigatorExampleState();
}

class _NavigatorExampleState extends State<NavigatorExample> {
  final _randColors = [
    Colors.red,
    Colors.black,
    Colors.green,
    Colors.yellow,
    Colors.blue
  ];

  final _pages = <Widget>[
    Container(
      color: Colors.green,
      child: Center(
        child: Text(
          "HOME PAGE",
          style: TextStyle(color: Colors.white),
        ),
      ),
    )
  ];

  Color get randColors => _randColors[Random().nextInt(4)];

  void addRandomPage() {
    _pages.add(Container(
      color: randColors,
      child: Center(
        child: Text(
          "${_pages.length + 1}",
          style: TextStyle(color: Colors.white),
        ),
      ),
    ));
    setState(() {});
  }

  bool onPopPage(result, pop) {
    if (!result.didPop(pop)) {
      _pages.removeLast();
      setState(() {});
      return false;
    } else {
      return true;
    }
  }

  Future<bool> onWillPop() async {
    if (_pages.length > 1) {
      _pages.removeLast();
      setState(() {});
      return false;
    } else {
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            addRandomPage();
          },
        ),
        body: Navigator(
          onPopPage: onPopPage,
          pages: _pages.map((e) => MaterialPage(child: e)).toList(),
        ),
      ),
    );
  }
}
