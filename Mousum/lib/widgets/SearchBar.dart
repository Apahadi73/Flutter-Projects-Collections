import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/weather.dart';

import 'package:Mousum/providers/WeatherData.dart';

class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  WeatherFactory wf;
  // retrieves input from textfield
  String _cityName = "";
  // form widget global key
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

//update user input and rebuilds the widget
  void _updateUserInput(String value) {
    _cityName = value;
  }

  // submits form data
  void _submitForm(BuildContext context, Function fetchWeather) {
    // fetch data is textfield is not empty
    if (_cityName.length != 0) {
      // fecthes weather and populates weather data
      fetchWeather(_cityName.trim());

      Scaffold.of(context).showSnackBar(SnackBar(
        backgroundColor: Color(0xff009688),
        content: Text('Fetching Weather Information'),
        duration: Duration(seconds: 1),
      ));
    } else {
      Scaffold.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.red,
        content: Text('Failed to fetch the weather information'),
        duration: Duration(seconds: 1),
      ));
    }

    //dismiss soft key if it is still focused
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    // pointer to the fetch weather method of the provider
    final fetchWeatherHandler = Provider.of<WeatherData>(context, listen: false).fetchWeather;

    return Form(
      key: _formKey,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            // platform aware textfield widget
            child: PlatformTextField(
              autofocus: false,
              onChanged: (value) {
                _updateUserInput(value);
              },
              onSubmitted: (_) => _submitForm(context, fetchWeatherHandler),
            ),
          ),
          InkWell(
            child: Container(
                margin: EdgeInsets.all(10),
                width: 35,
                height: 35,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Theme.of(context).accentColor),
                child: Icon(
                  Icons.search,
                  color: Colors.white,
                )),
            onTap: () {
              _submitForm(context, fetchWeatherHandler);
            },
          ),
        ],
      ),
    );
  }
}
