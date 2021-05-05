import 'package:flutter/material.dart';

class device extends StatefulWidget {
  @override
  _deviceState createState() => _deviceState();
}

class _deviceState extends State<device> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.indigo,
          title: Image.asset(
            "images/titile.png",
            height: 150.0,
            width: 151.0,
          )),
      body: Container(
        child: Image.asset(
          "images/titile.png",
          height: 120,
        ),
        margin: EdgeInsets.all(20),
      ),
    );
  }
}
