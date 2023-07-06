import 'package:flutter/material.dart';
import 'package:weather_app/logic/geolocation.dart';
import 'package:weather_app/views/weatherBox.dart';

import '../logic/location_service.dart';
import 'searchWindow.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  String location = "";
  String timeNow = "";
  String conditions = "";
  double temperature = 0;
  String temperatureString = "";
  String timeString = "";
  String celsius = " °C";
  String iconURL = "";
  late bool stateValue;
  TextEditingController searchController = TextEditingController();
  bool showSearchBar = true;

  @override
  void initState() {
    super.initState();
    iconURL = "question";
    stateValue = true;
  }

  Future<void> _fetchWeatherData(String location) async {
    final weatherService = WeatherService();
    final weatherData = await weatherService.getWeatherDataSearch(location);

    setState(() {
      this.location = weatherData.cityName;
      timeNow = weatherData.dtUtcString;
      conditions = weatherData.condition;
      temperature = weatherData.temperature;
      temperatureString = temperature.toStringAsFixed(1) + celsius;
      iconURL = weatherData.iconUrl;
    });
  }

  Future<void> _fetchMyWeather() async {
    LocationService locationService = LocationService();
    Pair<double, double>? location = await locationService.getLocation();

    if (location != null) {
      double latitude = location.first;
      double longitude = location.second;

      final weatherService = WeatherService();
      final weatherData =
          await weatherService.getWeatherDataCurrent(latitude, longitude);

      setState(() {
        this.location = weatherData.cityName;
        timeNow = weatherData.dtUtcString;
        conditions = weatherData.condition;
        temperature = weatherData.temperature;
        temperatureString = temperature.toStringAsFixed(1) + celsius;
        iconURL = weatherData.iconUrl;
      });
    } else {}
  }

  void _openSearchWindow(BuildContext context) {
    openSearchWindow(context, searchController, _fetchWeatherData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.amberAccent,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              WeatherBox(
                location: location,
                date: timeNow,
                conditions: conditions,
                temp: temperatureString,
                icon: iconURL,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            backgroundColor: Colors.black,
            onPressed: () {
              _fetchMyWeather();
            },
            child: const Icon(
              Icons.my_location,
              color: Colors.amberAccent,
            ),
          ),
          const SizedBox(width: 16),
          FloatingActionButton(
            backgroundColor: Colors.black,
            onPressed: () {
              _openSearchWindow(context);
            },
            child: const Icon(
              Icons.search,
              color: Colors.amberAccent,
            ),
          ),
        ],
      ),
    );
  }
}
