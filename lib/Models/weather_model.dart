import 'package:flutter/material.dart';

class weatherModel {
  final DateTime date;
  final double minTemp;
  final double maxTemp;
  final double avgTemp;
  final String weatherStateName;
  final String cityName;

  weatherModel({
    required this.date,
    required this.minTemp,
    required this.maxTemp,
    required this.avgTemp,
    required this.weatherStateName,
    required this.cityName,
  });

  factory weatherModel.fromJson(jsonData) {
    Map<String, dynamic> jsonDataForecast =
        jsonData['forecast']['forecastday'][0]['day'];
    return weatherModel(
      date: DateTime.parse(jsonData['location']['localtime'].toString()),
      cityName: jsonData['location']['name'],
      minTemp: jsonDataForecast['mintemp_c'],
      maxTemp: jsonDataForecast['maxtemp_c'],
      avgTemp: jsonDataForecast['avgtemp_c'],
      weatherStateName: jsonDataForecast['condition']['text'],
    );
  }

  String getImageIcon({required String weatherStateName}) {
    if (weatherStateName == 'Sunny') {
      return 'assets/images/clear.png';
    } else if (weatherStateName == 'Patchy rain possible') {
      return 'assets/images/thunderstorm.png';
    } else if (weatherStateName == 'Heavy rain') {
      return 'assets/images/rainy.png';
    } else if (weatherStateName == 'Moderate rain') {
      return 'assets/images/cloudy.png';
    } else {
      return 'assets/images/clear.png';
    }
  }

  MaterialColor getColor() {
    if (weatherStateName == 'Sunny') {
      return Colors.orange;
    } else if (weatherStateName == 'Patchy rain possible') {
      return Colors.lightBlue;
    } else if (weatherStateName == 'Heavy rain') {
      return Colors.blueGrey;
    } else if (weatherStateName == 'Moderate rain') {
      return Colors.lightGreen;
    } else {
      return Colors.blue;
    }
  }
}
