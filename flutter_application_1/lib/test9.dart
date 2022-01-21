import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class test9 extends StatefulWidget {
  @override
  _test9 createState() => _test9();
}

class _test9 extends State<test9> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 200,
        height: 140,
        child: AutoSizeText(
          'This string will be automatically resized to fit in two lines.',
          style: TextStyle(fontSize: 30),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
