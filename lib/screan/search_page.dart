import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/provider/WeatherProvider.dart';
import 'package:weather/service/weather_service.dart';

class SearchPage extends StatelessWidget {
  String? cityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search a City'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
            onChanged: (value) {
              cityName = value;
            },
            onSubmitted: (value) async {
              cityName = value;
              WeatherService service = WeatherService();
              WeatherModel? weatherModel =
                  await service.getWeather(cityName: cityName!);
              Provider.of<WeatherProvider>(context, listen: false).weatherData =
                  weatherModel;
              Provider.of<WeatherProvider>(context, listen: false).cityName =
                  cityName;
              Navigator.pop(context);
            },
            decoration: InputDecoration(
              labelText: 'Search',
              border: const OutlineInputBorder(),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
              suffixIcon: GestureDetector(
                  onTap: () async {
                    WeatherService service = WeatherService();
                    WeatherModel? weatherModel =
                        await service.getWeather(cityName: cityName!);
                    Provider.of<WeatherProvider>(context, listen: false)
                        .weatherData = weatherModel;
                    Provider.of<WeatherProvider>(context, listen: false)
                        .cityName = cityName;
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.search)),
            ),
          ),
        ),
      ),
    );
  }
}
