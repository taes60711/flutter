import 'package:flutter/material.dart';
import 'package:flutter_application_2/test1.dart';
import 'package:flutter_application_2/test2.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: test1(),
      ),
    );
  }
}
