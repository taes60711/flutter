import 'package:flutter/material.dart';

int count = 0;

class test6 extends StatefulWidget {
  @override
  _test6 createState() => _test6();
}

class _test6 extends State<test6> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("A didChangeDependencies");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 200),
            child: A(
              child: Column(
                children: [
                  B(),
                  RaisedButton(onPressed: () {
                    count++;
                    setState(() {});
                  })
                ],
              ),
              data: count,
            ),
          ),
        ],
      ),
    );
  }
}

class A extends InheritedWidget {
  A({
    Key? key,
    required Widget child,
    required this.data,
  }) : super(key: key, child: child);

  final int data;

  static A? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<A>();
    //return context.getElementForInheritedWidgetOfExactType<A>()!.widget as A;
  }

  bool updateShouldNotify(A old) {
    return old.data != data;
  }
}

class B extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => BState();
}

class BState extends State<B> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        A.of(context)!.data.toString(),
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("B didChangeDependencies");
  }
}
