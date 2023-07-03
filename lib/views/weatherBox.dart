import 'package:flutter/material.dart';

class WeatherBox extends StatelessWidget {
  final String location;
  final String date;
  final String conditions;
  final String temp;
  final String icon;

  const WeatherBox({
    required this.location,
    required this.date,
    required this.conditions,
    required this.temp,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      color: Color.fromARGB(255, 250, 247, 247),
      fontSize: 17,
      fontWeight: FontWeight.w400,
    );

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
            Image.network(
              icon,
              width: 120,
              height: 120,
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
}
