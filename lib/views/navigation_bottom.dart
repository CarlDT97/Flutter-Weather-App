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
    return Center(
      child: Scaffold(
        backgroundColor: Colors.amberAccent,
        body: views[_currentIndex],
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            height: 80,
            width: 300,
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
              borderRadius: BorderRadius.circular(200),
              color: Colors.black,
            ),
            child: NavigationBar(
              backgroundColor: Colors.transparent,
              selectedIndex: _currentIndex,
              onDestinationSelected: (int index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              destinations: const [
                NavigationDestination(
                  icon: Icon(
                    Icons.home,
                    color: Colors.amberAccent,
                  ),
                  label: 'Home',
                ),
                NavigationDestination(
                  icon: Icon(
                    Icons.settings,
                    color: Colors.amberAccent,
                  ),
                  label: 'Info',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
