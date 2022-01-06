import 'package:flutter/material.dart';

//stateful vs stateless
class FulBackPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FulBackPage();
  }
}

class _FulBackPage extends State<FulBackPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Column(
      children: <Widget>[
        Full(name: "A"),
        Full(name: "B"),
        Full(name: "C"),
        Full(name: "D"),
        Less(name: "E"),
        GestureDetector(
          onTap: () {
            setState(() {});
          },
          child: Text("點選"),
        )
      ],
    );
  }
}

class Full extends StatefulWidget {
  final String name;

  Full({Key? key, required this.name}) : super(key: key) {
    print("有狀態元件$name:建立了");
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Full();
  }
}

class _Full extends State<Full> {
  @override
  Widget build(BuildContext context) {
    print("有狀態元件${widget.name}:build了");
    return new GestureDetector(
      onTap: () {
        setState(() {});
      },
      child: new Text(widget.name),
    );
  }
}

class Less extends StatelessWidget {
  final String name;

  Less({Key? key, required this.name}) : super(key: key) {
    print("無狀態元件$name:建立了");
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    print("無狀態元件$name:build了");
    return new Text(name);
  }
}
