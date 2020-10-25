import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ngzk_weather/pages/weather/info_page.dart';
import 'package:ngzk_weather/routes/routes.gr.dart';

void main() {
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ngzk-weather',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: WeatherInfo(),
      debugShowCheckedModeBanner: false,
      builder: ExtendedNavigator.builder<AppRouter>(
        router: AppRouter(),
        initialRoute: '/',
      ),
    );
  }
}
