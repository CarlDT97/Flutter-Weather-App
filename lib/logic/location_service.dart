import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import '../constants/weather_model.dart';

class WeatherService {
  final String apiKey = "0b8dbd436679a72cb6755ab7d8c21f5e";

  Future<WeatherData> getWeatherData(String city) async {
    final url =
        'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final weatherData = json.decode(response.body);

        final cityName = weatherData['name'];
        final temperature = weatherData['main']['temp'];
        final condition = weatherData['weather'][0]['description'];
        final icon = weatherData['weather'][0]['icon'];

        final dt = weatherData['dt'];
        DateTime currentTime = DateTime.fromMillisecondsSinceEpoch(dt * 1000);
        String formattedTime = DateFormat.Hm().format(currentTime);

        final iconUrl = "${"https://openweathermap.org/img/wn/" + icon}@2x.png";
        return WeatherData(
            cityName, temperature, condition, formattedTime, iconUrl);
      } else {
        print('Failed to fetch weather data: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }

    return WeatherData('', 0.0, '', '', '');
  }
}
