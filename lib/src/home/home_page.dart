import 'package:flutter/material.dart';
import 'package:notification_listener/src/profile/profile_page.dart';
import 'package:notification_listener/src/utils/nav2.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
        ),
        onPressed: () {
          NavNavigator.push(context, page: ProfilePage());
        },
      ),
    );
  }
}
