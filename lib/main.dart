import 'package:flutter/material.dart';
import 'package:login_tridimensional_animation/constants.dart';
import 'package:login_tridimensional_animation/pages_handler.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login Tridimensional Animation',
      theme: ThemeData(
        primaryColor: firstColor,
      ),
      home: PagesHandler(),
    );
  }
}
