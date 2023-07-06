import 'package:flutter/material.dart';

void openSearchWindow(BuildContext context,
    TextEditingController searchController, Function(String) fetchWeatherData) {
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
          style: const TextStyle(
            color: Colors.amberAccent,
          ),
          controller: searchController,
          decoration: const InputDecoration(
            helperStyle: TextStyle(
              color: Colors.amberAccent,
            ),
            hintText: "Enter a city",
            hintStyle: TextStyle(
              color: Colors.yellow,
              decorationColor: Colors.yellow,
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              String searchTerm = searchController.text;
              fetchWeatherData(searchTerm);
              searchController.clear();
              Navigator.pop(context);
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
