import 'package:flutter/material.dart';

class ScrollWidget extends StatefulWidget {
  ScrollWidget({Key key}) : super(key: key);

  @override
  _ScrollWidgetState createState() => _ScrollWidgetState();
}

class _ScrollWidgetState extends State<ScrollWidget> {
  final keyList = GlobalKey();
  final keyText = GlobalKey();
  final keyButton = GlobalKey();
  final keyAppBar = GlobalKey();
  var height = 0.0;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      RenderBox renderList = keyList.currentContext.findRenderObject();
      RenderBox renderText = keyText.currentContext.findRenderObject();
      RenderBox renderButton = keyButton.currentContext.findRenderObject();
      RenderBox renderAppBar = keyAppBar.currentContext.findRenderObject();
      final hs = MediaQuery.of(context).size.height;
      final ha = renderAppBar.size.height;
      final ht = renderText.size.height;
      final hc = renderList.size.height;
      final hbt = renderButton.size.height;

      height = hs - (ha + ht + hc + hbt);
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          key: keyAppBar,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(
                key: keyText,
                child: Text("\n"),
              ),
              Column(children: [
                Container(key: keyList, color: Colors.red, height: 450),
                if (height > 0)
                  Container(
                    height: height,
                  ),
                Container(key: keyButton, color: Colors.blue, height: 100),
              ])
            ],
          ),
        ));
  }
}
