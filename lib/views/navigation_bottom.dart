import 'package:flutter/material.dart';
import 'package:weather_app/views/info_page.dart';
import 'package:weather_app/views/weather_page.dart';

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _currentIndex = 0;

  final List<Widget> views = [
    const WeatherPage(),
    const InfoPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: views[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.amberAccent,
        showSelectedLabels: true,
        unselectedLabelStyle: const TextStyle(
          color: Colors.amberAccent,
          fontWeight: FontWeight.bold,
          fontSize: 10,
        ),
        backgroundColor: Colors.black,
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.amberAccent,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
              color: Colors.amberAccent,
            ),
            label: 'Info',
          ),
        ],
      ),
    );
  }
}
