import 'package:flutter/material.dart';

int a = 0;

class test2 extends StatefulWidget {
  @override
  ktest2 createState() => ktest2();
}

class ktest2 extends State<test2> {
  Widget build(BuildContext context) {
    return Scaffold(
      body: t(),
    );
  }
}

class t extends StatelessWidget {
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.45),
      child: Column(
        children: [
          Container(
            child: Text("局部刷新"),
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                    return ElevatedButton(
                      onPressed: () {
                        setState(() {
                          a++;
                        });
                      },
                      child: Text('在StatefulBuilder內 a = $a'),
                    );
                  },
                ),
              ),
              Expanded(
                child: Text('沒在StatefulBuilder內 a = $a'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
