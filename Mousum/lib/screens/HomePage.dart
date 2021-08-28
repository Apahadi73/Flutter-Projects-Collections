import 'package:Mousum/widgets/SearchBar.dart';
import 'package:Mousum/screens/WeatherModelBody.dart';
import 'package:flutter/material.dart';
import "package:flutter/cupertino.dart";
import 'dart:io';

//home page of our application
class HomePage extends StatelessWidget {
  // appbar
  final appBar = Text(
    "Mousum",
    style: TextStyle(fontSize: 32, color: Colors.white),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // change appbar appearance based on os platform
      appBar: Platform.isIOS
          ? CupertinoNavigationBar(
              middle: appBar,
              backgroundColor: Theme.of(context).primaryColorDark,
            )
          : AppBar(
              title: appBar,
            ),

      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.blue[100],
            Colors.blue[300],
          ]),
        ),
        width: double.infinity,
        height: double.infinity,
        child: Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(8),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SearchBar(),
                Divider(
                  color: Color(0xffBDBDBD),
                ),
                Center(child: WeatherModelBody()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
