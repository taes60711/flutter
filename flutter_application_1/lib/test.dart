import 'package:flutter/material.dart';
import 'package:flutter_application_1/test2.dart';

class test extends StatefulWidget {
  @override
  _test createState() => _test();
}

List<Color> _color = [
  Colors.deepPurple.shade50,
  Colors.deepPurple.shade50,
  Colors.deepPurple.shade50,
  Colors.deepPurple.shade50,
  Colors.deepPurple.shade50,
  Colors.deepPurple.shade50,
];

List<Color> _textcolor = [
  Colors.black87,
  Colors.black87,
  Colors.black87,
  Colors.black87,
  Colors.black87,
  Colors.black87,
];

List<String> Url = [
  "https://i.imgur.com/8fjoLgY.jpeg",
  "https://i.imgur.com/e8Ygcnf.jpeg",
  "https://i.imgur.com/bteelEE.jpeg",
  "https://i.imgur.com/pn7sSFN.jpeg",
];

List<String> Url_text = ["fish", "bread", "sakura", "dog"];
bool selected = true;

ScrollController mController = new ScrollController();

class _test extends State<test> {
  void initState() {
    super.initState();
    mController.addListener(() {
      setState(() {
        if (mController.offset <= 10) {
          selected = true;
        } else {
          selected = false;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.white,
        child: Stack(
          children: <Widget>[
            Container(
              alignment: Alignment.topCenter,
              child: Image.network(
                "https://i.imgur.com/2h0oFWe.jpeg",
                fit: BoxFit.fitWidth,
                width: double.infinity,
              ),
            ),
            Positioned(
              left: 15,
              top: 60,
              child: Container(
                child: IconButton(
                  icon: Icon(
                    Icons.menu,
                    color: Colors.white,
                    size: 30,
                  ),
                  onPressed: () {
                    print("Up");
                    Navigator.pop(context,
                        MaterialPageRoute(builder: (context) => test2()));
                  },
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              top: MediaQuery.of(context).size.height / 2.5,
              child: Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    controller: mController,
                    child: Padding(
                      padding: EdgeInsets.only(left: 25, top: 40, right: 25),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "TitleHeader",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 22,
                                  ),
                                ),
                              ),
                              Flexible(
                                fit: FlexFit.tight,
                                child: SizedBox(),
                              ),
                              Align(
                                alignment: Alignment.topRight,
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.picture_in_picture_alt_rounded,
                                      color: Colors.deepPurple.shade400,
                                      size: 28,
                                    ),
                                    Text(
                                      " " + _index.toString(),
                                      style: TextStyle(
                                          color: Colors.deepPurple.shade400,
                                          fontSize: 22,
                                          fontWeight: FontWeight.w900),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Container(
                                child: Icon(
                                  Icons.local_offer,
                                  size: 18,
                                  color: Colors.deepPurple.shade300,
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Title, Container",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: Colors.deepPurple.shade300),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Number",
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "內文內文內文內文內文內文內",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Colors.grey.shade500,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Row(
                              children: [
                                numbtn(1),
                                SizedBox(
                                  width: 12,
                                ),
                                numbtn(2),
                                SizedBox(
                                  width: 12,
                                ),
                                numbtn(3),
                                SizedBox(
                                  width: 12,
                                ),
                                numbtn(4),
                                SizedBox(
                                  width: 12,
                                ),
                                numbtn(5),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Description",
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "內文內文內文內文內文內文內文內文內文內文內文內文內文內文內文內文內文" +
                                  "內文內文內文內文內文內文內文內文內文內文內文內文內文內文內文",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Colors.grey.shade500,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "More",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 22,
                                  ),
                                ),
                              ),
                              Flexible(
                                fit: FlexFit.tight,
                                child: SizedBox(),
                              ),
                              Align(
                                alignment: Alignment.topRight,
                                child: Container(
                                  child: TextButton(
                                    onPressed: () {
                                      print("See all");
                                    },
                                    child: Text(
                                      "See all",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.deepPurple.shade400),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            height: 140,
                            width: double.infinity,
                            child: ListView.builder(
                              itemCount: 4,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  margin: EdgeInsets.only(right: 13),
                                  child: Column(
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: TextButton(
                                          onPressed: () {
                                            print(index);
                                          },
                                          child: Container(
                                            width: 80,
                                            height: 80,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20)),
                                              image: DecorationImage(
                                                image: NetworkImage(Url[index]),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                          child: Text(
                                            Url_text[index],
                                            style: TextStyle(
                                              color: Colors.grey.shade600,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            AnimatedPositioned(
              bottom: selected ? 0 : -55,
              left: 0,
              right: 0,
              duration: Duration(milliseconds: 100),
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
              ),
            ),
            AnimatedPositioned(
              bottom: selected ? 5 : -50,
              left: 10,
              duration: Duration(milliseconds: 100),
              child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.deepPurple.shade100,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.local_drink_sharp,
                      color: Colors.deepPurple.shade300,
                    ),
                    onPressed: () {
                      print("put");
                    },
                  )),
            ),
            AnimatedPositioned(
              left: 70,
              right: 10,
              bottom: selected ? 5 : -50,
              duration: Duration(milliseconds: 100),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.deepPurple.shade400,
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                child: FlatButton(
                  onPressed: () {
                    print("Book text Now");
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Book text now",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20, top: 4),
                        child: Row(
                          children: [
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Colors.grey.shade400,
                              size: 10,
                            ),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Colors.grey.shade300,
                              size: 14,
                            ),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Colors.white,
                              size: 16,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _index = "000";
  Widget numbtn(int index) {
    return Container(
      width: 45,
      height: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(13),
        ),
        color: _color[index],
      ),
      child: FlatButton(
        onPressed: () {
          setState(() {
            for (int i = 0; i < _color.length; i++) {
              if (i == index) {
                if (Colors.deepPurple.shade50 == _color[index]) {
                  _color[index] = Colors.black54;
                  _textcolor[index] = Colors.white;
                  _index = (index * 100).toString();
                } else {
                  _color[index] = Colors.deepPurple.shade50;
                  _textcolor[index] = Colors.black87;
                  _index = "000";
                }
              } else {
                _color[i] = Colors.deepPurple.shade50;
                _textcolor[i] = Colors.black87;
              }
            }
          });
        },
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: Text(
          index.toString(),
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: _textcolor[index],
          ),
        ),
      ),
    );
  }
}
