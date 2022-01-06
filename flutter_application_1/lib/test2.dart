import 'dart:async';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter_application_1/test.dart';
import 'package:flutter_application_1/test3.dart';

List<String> Url = [
  "https://i.imgur.com/DTvu4mQ.jpeg",
  "https://i.imgur.com/e8Ygcnf.jpeg",
  "https://i.imgur.com/bteelEE.jpeg",
  "https://i.imgur.com/pn7sSFN.jpeg",
];

List<String> Url_text = ["cat", "bread", "sakura", "dog"];

var bottombartilte = ["home", "Message", "Search", "User"];
var bottombaricon = [
  Icons.home,
  Icons.chat,
  Icons.search,
  Icons.account_circle
];
List<bottombar> bottom = [];

class bottombar {
  late String name;
  late Icon icon;
  bottombar({required this.name, required this.icon});

  String getname() {
    name = this.name;
    return name;
  }
}

List<tab> tabname = [
  tab(name: "Places"),
  tab(name: "Insporation"),
  tab(name: "Titiles")
];

class tab {
  late String name;
  tab({required this.name});
}

class test2 extends StatefulWidget {
  @override
  _test2 createState() => _test2();
}

late TabController tabController;
int _currentIndex = 0;

class _test2 extends State<test2> with TickerProviderStateMixin {
  void initState() {
    super.initState();
    for (int i = 0; i < bottombartilte.length; i++) {
      bottom.add(
          bottombar(name: bottombartilte[i], icon: Icon(bottombaricon[i])));
    }

    print(bottom[0].getname());
  }

  @override
  Widget build(BuildContext context) {
    tabController = new TabController(length: 3, vsync: this);

    return Scaffold(
      body: test2(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: bottom
            .map((bottombar) => BottomNavigationBarItem(
                icon: bottombar.icon, title: Text(bottombar.name)))
            .toList(),
        /*[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('home')),
          BottomNavigationBarItem(
              icon: Icon(Icons.chat), title: Text('Message')),
          BottomNavigationBarItem(
              icon: Icon(Icons.search), title: Text('Search')),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), title: Text('User')),
        ],*/
        fixedColor: Colors.deepPurple.shade300,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedIconTheme: IconThemeData(size: 24),
        unselectedItemColor: Colors.grey,
        currentIndex: _currentIndex,
        onTap: _onItemClick,
      ),
    );
  }

  void _onItemClick(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  Widget test2() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        width: double.infinity,
        alignment: Alignment.topLeft,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(top: 60, left: 20, right: 20),
                child: Row(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                        icon: Icon(
                          Icons.menu,
                          color: Colors.black45,
                          size: 30,
                        ),
                        onPressed: () {
                          print("POP");

                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => test()));
                        },
                      ),
                    ),
                    Flexible(
                      fit: FlexFit.tight,
                      child: SizedBox(),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(left: 20, top: 20, bottom: 10),
              child: Text(
                "DiscoverTitle",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
              ),
            ),
            Container(
              child: Align(
                alignment: Alignment.centerLeft,
                child: TabBar(
                  labelPadding: EdgeInsets.only(left: 20, right: 20),
                  controller: tabController,
                  labelStyle: TextStyle(fontSize: 16),
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  isScrollable: true,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicator: CircleTabIndicator(
                      color: Colors.deepPurple.shade400, radius: 4),
                  tabs: tabname
                      .map((tabname) => Tab(text: tabname.name))
                      .toList(),
                  /*[
                    Tab(text: "Places"),
                    Tab(text: "Insporation"),
                    Tab(text: "Titiles"),
                  ],*/
                ),
              ),
            ),
            Container(
              height: 300,
              width: double.infinity,
              padding: EdgeInsets.only(top: 20, left: 20),
              child: TabBarView(
                controller: tabController,
                children: [
                  ListView.builder(
                    itemCount: 4,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        width: 190,
                        height: 200,
                        margin: EdgeInsets.only(right: 20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            image: DecorationImage(
                              image: NetworkImage(
                                  "https://i.imgur.com/8fjoLgY.jpeg"),
                              fit: BoxFit.cover,
                            )),
                      );
                    },
                  ),
                  Text("data"),
                  Text("Bye"),
                ],
              ),
            ),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 20, top: 40),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "DiscoTitle",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
                    ),
                  ),
                ),
                Flexible(
                  fit: FlexFit.tight,
                  child: SizedBox(),
                ),
                Container(
                  padding: EdgeInsets.only(right: 20, top: 40),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      child: TextButton(
                        onPressed: () {
                          print("See all");
                        },
                        child: Text(
                          "See all",
                          style: TextStyle(
                              fontSize: 14, color: Colors.grey.shade400),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Container(
              padding: EdgeInsets.only(left: 20),
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
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
    );
  }
}

class CircleTabIndicator extends Decoration {
  final Color color;
  double radius;
  CircleTabIndicator({required this.color, required this.radius});
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  double radius;

  _CirclePainter({required this.color, required this.radius});

  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;
    final Offset circleOffset = Offset(
        configuration.size!.width / 2 - radius / 2,
        configuration.size!.height - radius * 1.5);
    canvas.drawCircle(offset + circleOffset, radius, _paint);
  }
}
