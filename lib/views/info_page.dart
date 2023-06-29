import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({Key? key}) : super(key: key);

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
              _textBox("Weather Project", 40, 2),
              _textBox(
                "This is an app developed for the course 1DV535 at Linneus University using Flutter and the OpenWeatherMap API. Developed by Carl Dahlqvist Thuresson",
                12,
                8,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Row _textBox(String label, double size, int flexInt) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Expanded(
        flex: flexInt,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Center(
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: const Color.fromARGB(255, 0, 0, 0),
                fontSize: size,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ),
    ],
  );
}
