import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Models/weather_model.dart';
import 'package:weather_app/pages/search_page.dart';
import 'package:weather_app/providers/weather_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

weatherModel? weathermodel;
  @override
  Widget build(BuildContext context) {
     weatherModel? weatherData = Provider.of<weatherProvider>(context).weatherData;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return SearchPage();
              }));
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body:weatherData != null ? Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
               weatherData.getColor()[600]!,
               weatherData.getColor()[500]!,
               weatherData.getColor()[300]!,
               weatherData.getColor()[200]!,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, 
          children: [
          Spacer(
            flex: 3,
          ),
          Text(
            '${weatherData.cityName}',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
            ),
          Text(
            'updated at: ${weatherData.date.hour}:${weatherData.date.minute}:${weatherData.date.second}',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(weatherData.getImageIcon(weatherStateName: weatherData.weatherStateName)),
              Text(
                '${weatherData.avgTemp.toInt()}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              Column(
                children: [
                  Text('Max Temp: ${weatherData.maxTemp.toInt()}'),
                  Text('Min Temp: ${weatherData.minTemp.toInt()}'),
                ],
              ),
            ],
          ),
          Spacer(),
          Text(
            '${weatherData.weatherStateName}',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
          Spacer(
            flex: 5,
          ),
          ],
        ),
      )
      :
      Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'there is no weather 😔 start',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            Text(
              'searching now 🔍',
              style: TextStyle(
                fontSize: 30,
              ),
            )
          ],
        ),
            ),
    
    );
  }
}
