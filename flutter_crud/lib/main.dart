import 'package:flutter/material.dart';
import 'package:flutter_crud/common/color_widget.dart';
import 'package:flutter_crud/first_page/started_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Temperature Converter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Tcolor.secondaryColor1,
        fontFamily: 'Poppins'
      ),
      home:  TemperatureConverter(),
    );
  }
}

