import 'package:flutter_application_1/RestfulAPI/rmodel/rmodeltest1.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';

class rtest2 extends StatefulWidget {
  @override
  _rtest2 createState() => _rtest2();
}

List<User> values = [];
List<bool> _isSelected = [];

class _rtest2 extends State<rtest2> {
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

      for (int i = 0; i < values.length; i++) {
        _isSelected.add(false);
      }
      count = 1;
    }

    return values;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: rtest2(),
    );
  }

  Widget rtest2() {
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
                      return CheckboxListTile(
                        title: Text(snapshot.data![index].name),
                        value: _isSelected[index],
                        onChanged: (bool? value) {
                          setState(() {
                            _isSelected[index] = value!;
                          });
                        },
                        secondary: const Icon(Icons.hourglass_empty),
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
}
