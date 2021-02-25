import 'package:flutter/material.dart';

class NoticationCount extends Notification {
  NoticationCount();
}

class NotificationListenerWidget extends StatefulWidget {
  NotificationListenerWidget({Key key}) : super(key: key);

  @override
  _NotificationListenerWidgetState createState() =>
      _NotificationListenerWidgetState();
}

class _NotificationListenerWidgetState
    extends State<NotificationListenerWidget> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return NotificationListener<NoticationCount>(
      onNotification: (notification) {
        count++;
        setState(() {});
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Notification Listener"),
        ),
        body: CountWidget(count: count),
        floatingActionButton: FabButton(),
      ),
    );
  }
}

class FabButton extends StatelessWidget {
  const FabButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () {
        NoticationCount().dispatch(context);
      },
    );
  }
}

class CountWidget extends StatelessWidget {
  final int count;
  const CountWidget({
    Key key,
    this.count,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Contador: $count"));
  }
}
