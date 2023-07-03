import 'package:flutter/material.dart';
import 'package:weather_app/views/weatherBox.dart';
import '../view_models/app_view_model.dart';

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
  TextEditingController searchController = TextEditingController();
  bool showSearchBar = true;

  @override
  void initState() {
    super.initState();
    _fetchWeatherData("Lund"); // Fetch weather data for initial location
  }

  Future<void> _fetchWeatherData(String location) async {
    final weatherService = WeatherService();
    final weatherData = await weatherService.getWeatherData(location);
    setState(() {
      this.location = weatherData.cityName;
      timeNow = weatherData.dtUtcString;
      conditions = weatherData.condition;
      temperature = weatherData.temperature;
      temperatureString = temperature.toStringAsFixed(1) + celsius;
      iconURL = weatherData.iconUrl;
    });
  }

  void openSearchWindow(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.black,
          title: const Text(
            "Search for a city",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.amberAccent,
            ),
          ),
          content: TextField(
            controller: searchController,
            decoration: const InputDecoration(
              helperStyle: TextStyle(
                color: Colors.amberAccent,
              ),
              hintText: "Enter a city",
              hintStyle: TextStyle(
                color: Colors.yellow, // or Colors.amberAccent
                decorationColor: Colors.yellow, // or Colors.amberAccent
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                String searchTerm = searchController.text;
                _fetchWeatherData(searchTerm);
                Navigator.pop(context); // Close the dialog
              },
              child: const Text(
                "Search",
                style: TextStyle(color: Colors.amberAccent),
              ),
            ),
          ],
        );
      },
    );
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          openSearchWindow(context);
        },
        child: const Icon(
          Icons.search,
          color: Colors.amberAccent,
        ),
      ),
    );
  }
}
