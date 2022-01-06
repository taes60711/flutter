import 'package:flutter_application_1/RestfulAPI/rmodel/rmodeltest1.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';

class rtest1 extends StatefulWidget {
  @override
  _rtest1 createState() => _rtest1();
}

List<User> values = [];

class _rtest1 extends State<rtest1> {
  @override
  void initState() {
    //getData();
  }

  int count = 0;
  Future<List<User>> getData() async {
    String Url = "https://jsonplaceholder.typicode.com/users";
    var url = Uri.parse(Url);
    var response = await http.get(url);

    if (count == 0) {
      for (Map i in jsonDecode(response.body)) {
        values.add(User.fromJson(i));
      }
      //values.add(userFromJson(response.body)[0]);
      //print(userFromJson(response.body)[0].address.city);
      //print(User.fromJson(jsonDecode(response.body)[0]).address.city);
      count = 1;
    }

    return values;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: rtest1(),
    );
  }

  Widget rtest1() {
    return Scaffold(
      body: Center(
        child: FutureBuilder<List<User>>(
          future: getData(),
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
