import 'package:Mousum/providers/WeatherData.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "package:provider/provider.dart";

import "./screens/HomePage.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<WeatherData>(create: (_) => WeatherData()),
      ],
      child: MaterialApp(
        title: 'Weather App',
        theme: ThemeData(
          primaryColor: Color(0xff0288D1),
          primaryColorDark: Color(0xff03A9F4),
          primaryColorLight: Color(0xffB3E5FC),
          accentColor: Color(0XFF009688),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomePage(),
      ),
    );
  }
}
