import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/provider/WeatherProvider.dart';
import 'package:weather/screan/search_page.dart';

class HomePage extends StatelessWidget {
  WeatherModel? weatherData;

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    weatherData =
        Provider.of<WeatherProvider>(context, listen: true).weatherData;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SearchPage()));
              },
              icon: const Icon(Icons.search)),
        ],
      ),
      body: weatherData == null
          ? const Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'there is no weather 😔 start',
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                  Text(
                    'searching now 🔍',
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  )
                ],
              ),
            )
          : Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  weatherData!.getThemeColor(),
                  weatherData!.getThemeColor()[300]!,
                  weatherData!.getThemeColor()[100]!,
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(
                    flex: 2,
                  ),
                  Text(
                    Provider.of<WeatherProvider>(context, listen: true)
                        .cityName
                        .toString(),
                    style: const TextStyle(
                        fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'updated at: ${weatherData!.date.hour.toString()}:${weatherData!.date.minute.toString()}',
                    style: const TextStyle(fontSize: 22),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      //Image.asset('assets/images/snow.png'),
                      // استخدام NetworkImage لتحميل وعرض صورة من عنوان URL
                      Image(
                        image: NetworkImage(
                          'http:${weatherData!.icon}',
                        ),
                        width: 120,
                        height: 120,
                        fit: BoxFit.contain,
                      ),
                      Text(
                        weatherData!.temp.toInt().toString(),
                        style: const TextStyle(
                            fontSize: 32, fontWeight: FontWeight.bold),
                      ),
                      Column(
                        children: [
                          Text('maxTemp: ${weatherData!.maxTemp.toInt()}'),
                          Text('minTemp: ${weatherData!.minTemp.toInt()}')
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    weatherData!.weatherStateName,
                    style: const TextStyle(
                        fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(
                    flex: 5,
                  ),
                ],
              ),
            ),
    );
  }
}
