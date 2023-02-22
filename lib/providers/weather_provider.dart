

import 'package:flutter/material.dart';
import 'package:weather_app/Models/weather_model.dart';

class weatherProvider extends ChangeNotifier{
  weatherModel? _weatherData;
 

 set weatherData(weatherModel? weatherData){
  _weatherData = weatherData;
  notifyListeners();
 }

 weatherModel? get weatherData{
  return _weatherData;
 }

}