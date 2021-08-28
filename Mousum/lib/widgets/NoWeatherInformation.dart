import 'package:flutter/material.dart';

// Displays when the user first enters the app
class NoWeatherInformation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      color: Theme.of(context).accentColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: double.infinity,
          height: 400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(
                image: AssetImage("assets/images/sadFace.png"),
              ),
              Chip(
                elevation: 5,
                label: Text("Sorry! No Weather Information to Display"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
