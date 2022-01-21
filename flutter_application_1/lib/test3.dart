import 'dart:async';
import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/test.dart';
import 'package:flutter_application_1/test2.dart';

List Url = [
  "1.png",
  "2.png",
  "3.png",
];

List<String> _Url = [
  "https://i.imgur.com/DTvu4mQ.jpeg",
  "https://i.imgur.com/e8Ygcnf.jpeg",
  "https://i.imgur.com/bteelEE.jpeg",
  "https://i.imgur.com/pn7sSFN.jpeg",
  "https://i.imgur.com/8fjoLgY.jpeg",
];

class test3 extends StatefulWidget {
  @override
  _test3 createState() => _test3();
}

PageController _controller = new PageController();

class _test3 extends State<test3>
    with TickerProviderStateMixin, SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation_rotation;
  late Animation<double> animation_radius_in;
  late Animation<double> animation_radius_out;

  double initialradius = 30;
  double radius = 0;
  int widgetindex = 0;

  @override
  Widget build(BuildContext context) {
    var WidgetPage = [Loading(), test3()];
    return Scaffold(
      body: WidgetPage[widgetindex],
    );
  }

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);

//預先載入NetImage
    int count = 0;
    for (int i = 0; i < _Url.length; i++) {
      getImage(i).image.resolve(new ImageConfiguration()).addListener(
              ImageStreamListener((ImageInfo info, bool sycncCall) {},
                  onChunk: (event) {
            int currentLength = event.cumulativeBytesLoaded;
            int? totalLength = event.expectedTotalBytes;
            //print("$currentLength/$totalLength from network");

            if (currentLength >= totalLength!) {
              count++;
              print("image file $count");
            }
            if (count >= _Url.length) {
              widgetindex = 1;

              print("Loading Successful");
            }
          }, onError: (e, trace) {
            print(e.toString());
          }));
    }
    /////////////////////////////////////////////
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

  Image getImage(int index) {
    Image img = Image.network(_Url[index]);
    return img;
  }
//

  Widget test3() {
    return PageView.builder(
      controller: _controller,
      scrollDirection: Axis.vertical,
      itemCount: Url.length,
      itemBuilder: (_, index) {
        return Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("img/" + Url[index]),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            margin: EdgeInsets.only(top: 150, left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        "Title",
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.w800),
                      ),
                    ),
                    SizedBox(height: 15),
                    Container(
                      child: Text(
                        "內文內文內文內文內文內文內文內文內文\n" +
                            "內文內文內文內文內文內文內文內文內文\n" +
                            "內文內文內文內文內文",
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    SizedBox(height: 25),
                    Container(
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(
                          color: Colors.deepPurple.shade400,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: FlatButton(
                        onPressed: () {
                          setState(() {
                            if (index == 0) {
                              _controller.jumpToPage(1);
                            } else if (index == 1) {
                              _controller.jumpToPage(2);
                            }
                          });
                          if (index == 2) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => test2()));
                          }
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  color: Colors.grey.shade400,
                                  size: 6,
                                ),
                                Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  color: Colors.grey.shade300,
                                  size: 8,
                                ),
                                Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  color: Colors.white,
                                  size: 10,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: List.generate(3, (indexDots) {
                    return Container(
                      margin: EdgeInsets.only(bottom: 8),
                      width: 8,
                      height: index == indexDots ? 25 : 8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: index == indexDots
                            ? Colors.deepPurple.shade400
                            : Colors.deepPurple.shade100,
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget Loading() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Center(
        child: RotationTransition(
          turns: animation_rotation,
          child: Stack(
            children: <Widget>[
              Dot(
                radius: 30,
                color: Colors.black12,
              ),
              Transform.translate(
                offset: Offset(radius * cos(pi / 4), radius * sin(pi / 4)),
                child: Dot(radius: 5, color: Colors.deepPurple.shade300),
              ),
              Transform.translate(
                offset:
                    Offset(radius * cos(2 * pi / 4), radius * sin(2 * pi / 4)),
                child: Dot(radius: 5, color: Colors.deepPurple.shade300),
              ),
              Transform.translate(
                offset:
                    Offset(radius * cos(3 * pi / 4), radius * sin(3 * pi / 4)),
                child: Dot(radius: 5, color: Colors.deepPurple.shade300),
              ),
              Transform.translate(
                offset:
                    Offset(radius * cos(4 * pi / 4), radius * sin(4 * pi / 4)),
                child: Dot(radius: 5, color: Colors.deepPurple.shade300),
              ),
              Transform.translate(
                offset:
                    Offset(radius * cos(5 * pi / 4), radius * sin(5 * pi / 4)),
                child: Dot(radius: 5, color: Colors.deepPurple.shade300),
              ),
              Transform.translate(
                offset:
                    Offset(radius * cos(6 * pi / 4), radius * sin(6 * pi / 4)),
                child: Dot(radius: 5, color: Colors.deepPurple.shade300),
              ),
              Transform.translate(
                offset:
                    Offset(radius * cos(7 * pi / 4), radius * sin(7 * pi / 4)),
                child: Dot(radius: 5, color: Colors.deepPurple.shade300),
              ),
              Transform.translate(
                offset:
                    Offset(radius * cos(8 * pi / 4), radius * sin(8 * pi / 4)),
                child: Dot(radius: 5, color: Colors.deepPurple.shade300),
              ),
            ],
          ),
        ),
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
