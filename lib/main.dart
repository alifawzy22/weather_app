import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Models/weather_model.dart';
import 'package:weather_app/pages/home_page.dart';
import 'package:weather_app/providers/weather_provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) {
       return weatherProvider(); 
    },
    child: WeatherApp()));
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    weatherModel? weatherData = Provider.of<weatherProvider>(context).weatherData;
    return MaterialApp(
        theme: ThemeData(
        primarySwatch: weatherData == null
            ? Colors.blue
            : weatherData.getColor(),
        ),
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      
    );
  }
}
