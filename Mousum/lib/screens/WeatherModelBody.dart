import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'package:Mousum/providers/WeatherData.dart';

import '../widgets/NoWeatherInformation.dart';

//main weather information body of the app
//displays all the data obtained from the weather api
class WeatherModelBody extends StatefulWidget {
  @override
  _WeatherModelBodyState createState() => _WeatherModelBodyState();
}

class _WeatherModelBodyState extends State<WeatherModelBody> {
  Widget _buildWidget(String imageName, String information) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Image(
          image: AssetImage("assets/images/$imageName.png"),
        ),
        Text(information),
      ],
    );
  }

  Card _buildCard(BuildContext context, List<Widget> childrenWidgets) {
    return Card(
      color: Colors.blue[200],
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: childrenWidgets),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final weatherDataListner = Provider.of<WeatherData>(context);
    final weatherData = weatherDataListner.weatherData;

    if (weatherData != null) {
      return SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                _buildCard(
                  context,
                  <Widget>[
                    Text(
                      "${weatherData.temperature.fahrenheit.ceil().toString()}°",
                      style: TextStyle(
                        fontFamily: "OpenSans",
                        fontSize: 72,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "Feels like ${weatherData.tempFeelsLike.fahrenheit.ceil().toString()}°",
                      style: TextStyle(color: Color(0xff757575)),
                    ),
                    Text(
                      "${weatherData.areaName},${weatherData.country.toString()}",
                      style: TextStyle(color: Color(0xff757575)),
                    ),
                  ],
                ),
                _buildCard(
                  context,
                  <Widget>[
                    Image.network(
                      "http://openweathermap.org/img/wn/${weatherData.weatherIcon}@2x.png",
                      fit: BoxFit.cover,
                    ),
                    Container(
                      padding: EdgeInsets.all(8),
                      child: Text(
                        "${weatherData.weatherDescription}",
                        style: TextStyle(color: Color(0xff757575)),
                      ),
                    )
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            _buildCard(
              context,
              <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    _buildWidget("humidity", "${weatherData.humidity}%"),
                    _buildWidget("pressure", "${weatherData.pressure}hPa"),
                    _buildWidget("windSpeed", "${weatherData.windSpeed}m/s"),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    _buildWidget("sunrise", "${DateFormat.jm().format(weatherData.sunrise).toString()}° "),
                    _buildWidget("temperature", "max:${weatherData.tempMax.fahrenheit.ceil().toString()}° "),
                    _buildWidget("temperature", "min:${weatherData.tempMin.fahrenheit.ceil().toString()}° "),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    _buildWidget("sunset", "${DateFormat.jm().format(weatherData.sunset).toString()}° "),
                    _buildWidget("rain", "${weatherData.rainLast3Hours.toString()}mm"),
                    _buildWidget("snow", "${weatherData.snowLast3Hours.toString()}mm")
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
          ],
        ),
      );
    }
    return NoWeatherInformation();
  }
}
