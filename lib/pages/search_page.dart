import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/APIs/weather_service.dart';
import 'package:weather_app/Models/weather_model.dart';
import 'package:weather_app/providers/weather_provider.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search a City'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: TextField(
            onSubmitted: (cityName) async {
              weatherModel? weathermodel;
              Provider.of<weatherProvider>(context,listen: false).weatherData =weathermodel;
              try {
                weatherService service = weatherService();
                Map<String, dynamic> jsonData =
                    await service.getWeather(cityName: cityName);
                print('aaaaaaaaaaaaaaaaaaaaa $jsonData');
                weatherModel weatherData = weatherModel.fromJson(jsonData);
                Provider.of<weatherProvider>(context, listen: false)
                    .weatherData = weatherData;
              } catch (e) {
                print(e);
              }
              Navigator.pop(context);
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              hintText: 'Enter City Name',
              label: const Text('Search'),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 24,
                horizontal: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
