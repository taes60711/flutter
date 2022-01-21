import 'package:flutter/material.dart';

class test4 extends StatefulWidget {
  final String title = "";
  @override
  _test4 createState() => _test4();
}

List<tabbart> s = [];
List<String> move = ["incsn", "Hedt", "Spider Mdne"];

class tabbart {
  late String name;
  late Icon icon;
  tabbart({required this.name, required this.icon});
}

class _test4 extends State<test4> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: test4(),
    );
  }

  late TabController tabController;

  @override
  void initState() {
    tabController = new TabController(length: 3, vsync: this);
    super.initState();

    for (int i = 0; i < move.length; i++) {
      s.add(tabbart(name: move[i], icon: Icon(Icons.ac_unit_rounded)));
    }
  }

  Widget test4() {
    return Scaffold(
      appBar: AppBar(
        title: TabBar(
          tabs: s
              .map((s) => Tab(
                    text: s.name,
                    icon: s.icon,
                  ))
              .toList(),
          controller: tabController,
        ),
      ),
    );
  }
}
