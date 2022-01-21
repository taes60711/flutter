import 'dart:async';
import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';

class Loading extends StatefulWidget {
  @override
  _Loading createState() => _Loading();
}

class _Loading extends State<Loading> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation_rotation;
  late Animation<double> animation_radius_in;
  late Animation<double> animation_radius_out;

  double initialradius = 30;
  double radius = 0;

  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 5));

    animation_rotation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(
        parent: controller, curve: Interval(0, 1, curve: Curves.linear)));

    animation_radius_in = Tween<double>(
      begin: 1,
      end: 0,
    ).animate(CurvedAnimation(
        parent: controller, curve: Interval(0.75, 1, curve: Curves.elasticIn)));

    animation_radius_out = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(
        parent: controller,
        curve: Interval(0.0, 0.25, curve: Curves.elasticOut)));

    controller.addListener(() {
      setState(() {
        if (controller.value >= 0.75 && controller.value <= 1) {
          radius = animation_radius_in.value * initialradius;
        } else if (controller.value >= 0 && controller.value <= 0.25) {
          radius = animation_radius_out.value * initialradius;
        }
      });
    });
    controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Loading(),
    );
  }

  @override
  Widget Loading() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.red,
            ),
          ),
          SizedBox(height: 100),
          RotationTransition(
            turns: animation_rotation,
            child: Stack(
              children: <Widget>[
                Dot(
                  radius: initialradius,
                  color: Colors.black12,
                ),
                Transform.translate(
                  offset: Offset(radius * cos(pi / 4),
                      radius * sin(pi / 4) + initialradius / 2 - 3),
                  child: Dot(radius: 5, color: Colors.deepPurple.shade300),
                ),
                Transform.translate(
                  offset: Offset(radius * cos(2 * pi / 4),
                      radius * sin(2 * pi / 4) + initialradius / 2 - 3),
                  child: Dot(radius: 5, color: Colors.deepPurple.shade300),
                ),
                Transform.translate(
                  offset: Offset(radius * cos(3 * pi / 4),
                      radius * sin(3 * pi / 4) + initialradius / 2 - 3),
                  child: Dot(radius: 5, color: Colors.deepPurple.shade300),
                ),
                Transform.translate(
                  offset: Offset(radius * cos(4 * pi / 4),
                      radius * sin(4 * pi / 4) + initialradius / 2 - 3),
                  child: Dot(radius: 5, color: Colors.deepPurple.shade300),
                ),
                Transform.translate(
                  offset: Offset(radius * cos(5 * pi / 4),
                      radius * sin(5 * pi / 4) + initialradius / 2 - 3),
                  child: Dot(radius: 5, color: Colors.deepPurple.shade300),
                ),
                Transform.translate(
                  offset: Offset(radius * cos(6 * pi / 4),
                      radius * sin(6 * pi / 4) + initialradius / 2 - 3),
                  child: Dot(radius: 5, color: Colors.deepPurple.shade300),
                ),
                Transform.translate(
                  offset: Offset(radius * cos(7 * pi / 4),
                      radius * sin(7 * pi / 4) + initialradius / 2 - 3),
                  child: Dot(radius: 5, color: Colors.deepPurple.shade300),
                ),
                Transform.translate(
                  offset: Offset(radius * cos(8 * pi / 4),
                      radius * sin(8 * pi / 4) + initialradius / 2 - 3),
                  child: Dot(radius: 5, color: Colors.deepPurple.shade300),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Dot extends StatelessWidget {
  final double radius;
  final Color color;
  Dot({required this.radius, required this.color});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: this.radius,
        height: this.radius,
        decoration: BoxDecoration(color: this.color, shape: BoxShape.circle),
      ),
    );
  }
}
