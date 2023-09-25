import 'package:flutter/material.dart';
import 'package:weather/models/weather_model.dart';

class WeatherProvider extends ChangeNotifier {
  WeatherModel? _weatherData;
  String? cityName;
  set weatherData(WeatherModel? weatherData) {
    _weatherData = weatherData;
    notifyListeners();
  }

  WeatherModel? get weatherData {
    return _weatherData;
  }
}
