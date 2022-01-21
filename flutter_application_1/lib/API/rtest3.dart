import 'package:flutter_application_1/API/rmodel/rmodeltest1.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';

class rtest3 extends StatefulWidget {
  @override
  _rtest3 createState() => _rtest3();
}

List<User> values = [];
List<bool> _isSelected = [];

var _futureBuilderFuture;
bool load = true;

class _rtest3 extends State<rtest3> {
  @override
  void initState() {
    _futureBuilderFuture = getData();
  }

  Future<List<User>> getData() async {
    String Url = "https://jsonplaceholder.typicode.com/users";
    var url = Uri.parse(Url);
    var response = await http.get(url);
    if (load) {
      for (Map i in jsonDecode(response.body)) {
        values.add(User.fromJson(i));
      }
    }
    load = false;

    for (int i = 0; i < values.length; i++) {
      _isSelected.add(false);
      _color.add(Colors.black54);
    }

    return values;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: rtest3(), //rtest4(),
    );
  }

  List<Color> _color = [];
  Color Selectedcolor = Colors.deepPurple.shade400;
  Color Unselectedcolor = Colors.black54;
  Widget rtest3() {
    return Scaffold(
      body: Center(
        child: FutureBuilder<List<User>>(
          future: _futureBuilderFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Text('loading...');
            }
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(top: 5, left: 10, right: 10),
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Selectedcolor,
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: CheckboxListTile(
                          activeColor: Colors.transparent,
                          checkColor: Selectedcolor,
                          title: Text(
                            snapshot.data![index].name,
                            style: TextStyle(color: _color[index]),
                          ),
                          value: _isSelected[index],
                          onChanged: (bool? value) {
                            setState(() {
                              _isSelected[index] = value!;
                              (_color[index] == Unselectedcolor)
                                  ? _color[index] = Selectedcolor
                                  : _color[index] = Unselectedcolor;
                            });
                          },
                          secondary: Icon(
                            Icons.hourglass_empty,
                            color: _color[index],
                          ),
                        ),
                      );
                    });
              }
            }

            return const Text('loading...');
          },
        ),
      ),
    );
  }

  Widget rtest4() {
    return Scaffold(
      body: Center(
        child: FutureBuilder<List<User>>(
          future: _futureBuilderFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Text('loading...');
            }
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return Dismissible(
                          key: Key(snapshot.data![index].name),
                          onDismissed: (direction) {
                            //項目移除後要做什麼事
                            setState(() {
                              //從data中移除項目
                              snapshot.data!.removeAt(index);
                            });
                          },
                          child: ListTile(
                            title: Text((index + 1).toString() +
                                "  " +
                                snapshot.data![index].name),
                          ));
                    });
              }
            }

            return const Text('loading...');
          },
        ),
      ),
    );
  }
}
