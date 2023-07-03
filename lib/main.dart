import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'view_models/app_view_model.dart';
import 'views/navigation_bottom.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => AppViewModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BottomNavigation(),
      debugShowCheckedModeBanner: false,
    );
  }
}
