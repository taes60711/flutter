import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class utest1 extends StatefulWidget {
  @override
  _utest1 createState() => _utest1();
}

class _utest1 extends State<utest1> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(1080, 1920),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: () {
          return Column(
            children: [
              Row(
                children: [
                  Expanded(child: Column()),
                ],
              ),
            ],
          );
        });
  }
}
