import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedContainerPage extends StatefulWidget {
  @override
  _AnimatedContainerPage createState() => _AnimatedContainerPage();
}

class _AnimatedContainerPage extends State<AnimatedContainerPage> {
  Color _color = Colors.red;
  double _width = 200;
  double _height = 100;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(0);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.access_time_filled),
        title: Text("AnimatedContainer test"),
      ),

      body: Center(
        child: AnimatedContainer(
          width: _width,
          height: _height,
          decoration: BoxDecoration(
            color: _color,
            borderRadius: _borderRadius,
          ),
          duration: Duration(milliseconds: 500),
        ),
      ),

      // Button
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.replay_circle_filled),
        backgroundColor: _color,
        onPressed: () {
          setState(() {
            if (_borderRadius == BorderRadius.circular(0)) {
              _width = 100;
              _borderRadius = BorderRadius.circular(50);
            } else {
              _width = 200;
              _borderRadius = BorderRadius.circular(0);
            }
          });
        },
      ),
    ));
  }
}
