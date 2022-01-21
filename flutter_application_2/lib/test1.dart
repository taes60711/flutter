import 'package:flutter/material.dart';
import 'package:flutter_application_2/test2.dart';

class test1 extends StatefulWidget {
  @override
  test1_1 createState() => test1_1();
}

double kDefaultPadding = 20.0;
Color kDeafultColor = Colors.green.shade200;
Color kTitleColor = Colors.black87;

class test1_1 extends State<test1> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: kDefaultPadding * 0.5),
            child: Container(
              height: size.height * 0.8,
              child: Row(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: kDefaultPadding * 3),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: IconButton(
                              padding:
                                  EdgeInsets.only(right: kDefaultPadding * 2.3),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => test2()));
                              },
                              icon: Icon(
                                Icons.arrow_back,
                                size: 25,
                                color: kTitleColor.withOpacity(0.5),
                              )),
                        ),
                        Spacer(),
                        IconCard(icon: icons(Icons.ac_unit)),
                        IconCard(icon: icons(Icons.add_circle_sharp)),
                        IconCard(icon: icons(Icons.cable_outlined)),
                        IconCard(icon: icons(Icons.safety_divider)),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      width: size.width * 0.8,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(52),
                            bottomLeft: Radius.circular(52),
                          ),
                          boxShadow: [kBoxDefaultShadow()]),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: Row(
              children: [
                RichText(
                  text: TextSpan(
                      text: "Title\n",
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                          color: kTitleColor, fontWeight: FontWeight.bold),
                      children: [
                        TextSpan(
                            text: "sdaon",
                            style: TextStyle(
                                color: kDeafultColor,
                                fontSize: 20,
                                fontWeight: FontWeight.w300))
                      ]),
                ),
                Spacer(),
                Text(
                  "\$400",
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                      color: kDeafultColor, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: kDefaultPadding * 0.7),
            child: Row(
              children: [
                Container(
                  width: size.width / 2,
                  height: 72,
                  decoration: BoxDecoration(
                      color: kDeafultColor,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                      )),
                  child: Align(
                    child: Text(
                      "Book Now",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(color: Colors.white),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class IconCard extends StatelessWidget {
  IconCard({
    required this.icon,
  });

  final IconTheme icon;

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: size.height * 0.01),
      padding: EdgeInsets.all(kDefaultPadding / 2),
      child: FlatButton(
        onPressed: () => print("ss"),
        child: Container(
          width: 62,
          height: 62,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(5),
              ),
              boxShadow: [kBoxDefaultShadow()]),
          child: icon,
        ),
      ),
    );
  }
}

IconTheme icons(IconData icon) {
  return IconTheme(
      data: IconThemeData(size: 40, color: kDeafultColor), child: Icon(icon));
}

BoxShadow kBoxDefaultShadow() {
  return BoxShadow(
      offset: Offset(0, 10),
      blurRadius: 22,
      color: kDeafultColor.withOpacity(0.29));
}
