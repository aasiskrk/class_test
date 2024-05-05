import 'dart:async';

import 'package:class_test/screens/splash_screen.dart';
import 'package:flutter/material.dart';

import '../screens/grid_view_screen.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => GridViewScreen(nameData: "Aashista")),
      );
    });
  }

  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
