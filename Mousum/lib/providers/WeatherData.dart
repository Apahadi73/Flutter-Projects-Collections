import 'package:flutter/material.dart';
import 'package:weather/weather.dart';

import 'package:Mousum/ApiKeys.dart';

// our provider class where we handle our data and logic
class WeatherData with ChangeNotifier {
  // data fields
  Weather _weatherData;
  WeatherFactory wf;

//getter for the private weather Data
  Weather get weatherData {
    return _weatherData;
  }

  //fetches weather
  void fetchWeather(String cityName) async {
    wf = new WeatherFactory(ApiKeys.weatherApi);
    _weatherData = await wf.currentWeatherByCityName(cityName);
    notifyListeners(); //notify listners after updating the _weatherData
  }
}
