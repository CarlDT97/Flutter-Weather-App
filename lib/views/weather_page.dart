import 'package:flutter/material.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              color: Colors.amberAccent,
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _weatherBox("Göteborg", "idag", "moln", "23"),
            ],
          ),
        ),
      ),
    );
  }
}

const textStyle = TextStyle(
  color: Color.fromARGB(255, 250, 247, 247),
  fontSize: 17,
  fontWeight: FontWeight.w400,
);
Center _weatherBox(
    String location, String date, String conditions, String temp) {
  return Center(
    child: Container(
      width: 250,
      height: 350,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 5.0,
          style: BorderStyle.solid,
        ),
        borderRadius: BorderRadius.circular(20),
        color: Colors.black,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            Icons.sunny,
            size: 40,
            color: Colors.white,
          ),
          Text(
            location,
            textAlign: TextAlign.center,
            style: textStyle,
          ),
          Text(
            date,
            textAlign: TextAlign.center,
            style: textStyle,
          ),
          Text(
            conditions,
            textAlign: TextAlign.center,
            style: textStyle,
          ),
          Text(
            temp,
            textAlign: TextAlign.center,
            style: textStyle,
          ),
        ],
      ),
    ),
  );
}
