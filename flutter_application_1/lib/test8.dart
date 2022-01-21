import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class test8 extends StatefulWidget {
  @override
  _test8 createState() => _test8();
}

class _test8 extends State<test8> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(1080, 1920),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: () => HomePage(title: 'FlutterScreenUtil Demo'),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                // Using Extensions
                Container(
                  padding: EdgeInsets.all(20.w),
                  width: 0.5.sw,
                  height: 600.h,
                  color: Colors.red,
                  child: Text(
                    'My actual width: ${0.5.sw}dp \n\n'
                    'My actual height: ${600.h}dp \n\n'
                    '${15.sp}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 45.sp,
                    ),
                  ),
                ),
                // Without using Extensions
                Container(
                  padding: EdgeInsets.all(ScreenUtil().setWidth(10)),
                  width: ScreenUtil().setWidth(540),
                  height: ScreenUtil().setHeight(600),
                  color: Colors.blue,
                  child: Text(
                    'My design draft width: 180dp\n\n'
                    'My design draft height: 200dp',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: ScreenUtil().setSp(45),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
