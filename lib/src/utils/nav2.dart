import 'package:flutter/material.dart';

class Nav2Notification extends Notification {
  Nav2Notification();
}

class Nav2NotificationPush extends Nav2Notification {
  final Widget page;
  Nav2NotificationPush({
    this.page,
  });
}

class Nav2NotificationPop extends Nav2Notification {
  Nav2NotificationPop();
}

class NavNavigator {
  static void push(BuildContext context, {@required Widget page}) {
    Nav2NotificationPush(page: page).dispatch(context);
  }

  static void pop(BuildContext context) {
    Nav2NotificationPop().dispatch(context);
  }
}

class Nav2Widget extends StatefulWidget {
  final Widget home;
  Nav2Widget({
    Key key,
    @required this.home,
  }) : super(key: key);

  @override
  _Nav2State createState() => _Nav2State();
}

class _Nav2State extends State<Nav2Widget> {
  List<Widget> pages;

  @override
  void initState() {
    pages = [widget.home];
    super.initState();
  }

  void add(Widget page) {
    pages.add(page);
    setState(() {});
  }

  void remove([Widget page]) {
    if (page != null) {
      pages.remove(page);
    } else {
      pages.removeLast();
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (pages.length > 0) {
          remove();
          return false;
        } else {
          return true;
        }
      },
      child: NotificationListener<Nav2Notification>(
        onNotification: (notification) {
          switch (notification.runtimeType) {
            case Nav2NotificationPush:
              {
                final page = (notification as Nav2NotificationPush).page;
                add(page);
                return true;
              }

            case Nav2NotificationPop:
              {
                remove();
                return true;
              }

              break;
            default:
              throw "INVALID OPERATION";
          }
        },
        child: Navigator(
          onPopPage: (route, result) {
            if (!route.didPop(result)) {
              return false;
            } else {
              remove();
              return true;
            }
          },
          pages: pages.map((e) => MaterialPage(child: e)).toList(),
        ),
      ),
    );
  }
}
