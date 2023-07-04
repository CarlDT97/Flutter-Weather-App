import 'package:flutter/material.dart';

class WeatherBox extends StatelessWidget {
  final String location;
  final String date;
  final String conditions;
  final String temp;
  final String icon;
  final bool noQuary;

  const WeatherBox({
    required this.location,
    required this.date,
    required this.conditions,
    required this.temp,
    required this.icon,
    required this.noQuary,
  });

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      color: Colors.amberAccent,
      fontSize: 17,
      fontWeight: FontWeight.w400,
    );

    return Center(
      child: Container(
        width: 250,
        height: 350,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black12.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 3,
              offset: const Offset(0, 2), // changes position of shadow
            ),
          ],
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
            if (noQuary == false)
              Image.network(
                icon,
                width: 120,
                height: 120,
              ),
            if (noQuary == true)
              const Icon(
                Icons.search,
                size: 120,
                color: Colors.amberAccent,
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
