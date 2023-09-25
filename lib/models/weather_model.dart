import 'package:flutter/material.dart';

class WeatherModel {
  DateTime date;
  double temp;
  double maxTemp;
  double minTemp;
  String weatherStateName;
  String icon;

  WeatherModel(
      {required this.date,
      required this.temp,
      required this.maxTemp,
      required this.minTemp,
      required this.weatherStateName,
      required this.icon});
  //

  factory WeatherModel.fromJson(dynamic data) {
    var jsonData = data['forecast']['forecastday'][0]['day'];
    return WeatherModel(
        date: DateTime.parse(data['location']['localtime']),
        temp: jsonData['avgtemp_c'],
        maxTemp: jsonData['maxtemp_c'],
        minTemp: jsonData['mintemp_c'],
        weatherStateName: jsonData['condition']['text'],
        icon: jsonData['condition']['icon']);
    //
  }
  MaterialColor getThemeColor() {
    if (weatherStateName == 'Clear' ||
        weatherStateName == 'Light Cloudy' ||
        weatherStateName == 'Sunny') {
      return Colors.orange;
    } else if (weatherStateName == 'Sleet' ||
        weatherStateName == 'Snow' ||
        weatherStateName == 'Hail') {
      return Colors.cyan;
    } else if (weatherStateName == 'Heavy Cloudy' ||
        weatherStateName == 'Overcast' ||
        weatherStateName == 'Cloudy' ||
        weatherStateName == 'Partly cloudy') {
      return Colors.blueGrey;
    } else if (weatherStateName == 'Light Rain' ||
        weatherStateName == 'Heany Rain' ||
        weatherStateName == 'Showers' ||
        weatherStateName == 'Moderate rain' ||
        weatherStateName == 'Light rain shower') {
      return Colors.cyan;
    } else {
      return Colors.lightBlue;
    }
  }
}
