import 'package:flutter/material.dart';

class test7 extends StatefulWidget {
  @override
  _test7 createState() => _test7();
}

class _test7 extends State<test7> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: HomePage(
      child: Padding(
        padding: EdgeInsets.only(top: 200),
        child: Column(
          children: [
            WidgetA(),
            WidgetB(),
            WidgetC(),
          ],
        ),
      ),
    ));
  }
}

class _MyInheritedWidget extends InheritedWidget {
  _MyInheritedWidget({
    Key? key,
    required Widget child,
    required this.data,
  }) : super(key: key, child: child);

  final HomePageState data;

  @override
  bool updateShouldNotify(_MyInheritedWidget oldWidget) {
    return true;
  }
}

class HomePage extends StatefulWidget {
  HomePage({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  HomePageState createState() => HomePageState();

  static HomePageState of(BuildContext context, {bool rebuild = true}) {
    if (rebuild) {
      return (context.dependOnInheritedWidgetOfExactType<_MyInheritedWidget>()
              as _MyInheritedWidget)
          .data;
    }
    return (context.findAncestorWidgetOfExactType<_MyInheritedWidget>()
            as _MyInheritedWidget)
        .data;
  }
}

class HomePageState extends State<HomePage> {
  int counter = 0;

  void _incrementCounter() {
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _MyInheritedWidget(
      data: this,
      child: widget.child,
    );
  }
}

class WidgetA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final HomePageState state = HomePage.of(context);

    return Center(
      child: Text(
        '${state.counter}',
      ),
    );
  }
}

class WidgetB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('I am a widget that will not be rebuilt.');
  }
}

class WidgetC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final HomePageState state = HomePage.of(context, rebuild: false);
    return RaisedButton(
      onPressed: () {
        state._incrementCounter();
      },
      child: Icon(Icons.add),
    );
  }
}
