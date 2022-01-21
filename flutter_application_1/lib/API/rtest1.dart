import 'package:flutter_application_1/API/rmodel/rmodeltest1.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';

class rtest1 extends StatefulWidget {
  @override
  _rtest1 createState() => _rtest1();
}

List<User> values = [];
List<bool> _isSelected = [];

var _futureBuilderFuture;
bool load = true;

class _rtest1 extends State<rtest1> {
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

    return values;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: rtest4(),
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
