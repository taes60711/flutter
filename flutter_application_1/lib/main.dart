import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Loading/animationed.dart';
import 'package:flutter_application_1/RestfulAPI/rtest1.dart';
import 'package:flutter_application_1/RestfulAPI/rtest2.dart';
import 'package:flutter_application_1/RestfulAPI/rtest3.dart';
import 'package:flutter_application_1/animation.dart';
import 'package:flutter_application_1/Loading/loading.dart';
import 'package:flutter_application_1/test.dart';
import 'package:flutter_application_1/test2.dart';
import 'package:flutter_application_1/test3.dart';
import 'package:flutter_application_1/test4.dart';
import 'package:flutter_application_1/test5.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_application_1/test6.dart';
import 'package:flutter_application_1/test7.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: rtest3(), //rtest3(), //test3(),
      ),
    );
  }
}

/*
import 'package:flutter/material.dart';

void main() {
  runApp(new TileApp());
}

class TileApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Center(
            child: Text('ExpansionTile App'),
          ),
        ),
        body: new ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return new StuffInTiles(listOfTiles[index]);
          },
          itemCount: listOfTiles.length,
        ),
      ),
    );
  }
}

class StuffInTiles extends StatelessWidget {
  final MyTile myTile;
  StuffInTiles(this.myTile);

  @override
  Widget build(BuildContext context) {
    return _buildTiles(myTile);
  }

  Widget _buildTiles(MyTile t) {
    if (t.children.isEmpty)
      return new ListTile(onTap: () => print("tap"), title: new Text(t.title));

    return new ExpansionTile(
      title: new Text(t.title),
      children: t.children.map(_buildTiles).toList(),
    );
  }
}

class MyTile {
  String title;
  List<MyTile> children;
  MyTile(this.title, [this.children = const <MyTile>[]]);
}

List<MyTile> listOfTiles = <MyTile>[
  new MyTile(
    'Animals',
    <MyTile>[
      new MyTile(
        'Dogs',
        <MyTile>[
          new MyTile('Coton de Tulear'),
          new MyTile('German Shepherd'),
          new MyTile('Poodle'),
        ],
      ),
      new MyTile('Cats'),
      new MyTile('Birds'),
    ],
  ),
  new MyTile(
    'Cars',
    <MyTile>[
      new MyTile('Tesla'),
      new MyTile('Toyota'),
    ],
  ),
  new MyTile(
    'Phones',
    <MyTile>[
      new MyTile('Google'),
      new MyTile('Samsung'),
      new MyTile(
        'OnePlus',
        <MyTile>[
          new MyTile('1'),
          new MyTile('2'),
          new MyTile('3'),
          new MyTile('4'),
          new MyTile('5'),
          new MyTile('6'),
          new MyTile('7'),
          new MyTile('8'),
          new MyTile('9'),
          new MyTile('10'),
          new MyTile('11'),
          new MyTile('12'),
        ],
      ),
    ],
  ),
];*/
