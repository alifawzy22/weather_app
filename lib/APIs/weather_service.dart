import 'dart:convert';

import 'package:http/http.dart' as http;

class weatherService {
  Future<Map<String, dynamic>> getWeather({required String cityName}) async {
    String baseURL = 'https://api.weatherapi.com/v1';
    String apiKey = 'ba055844d30e4d968a7165402232202';
    String url = '$baseURL/forecast.json?key=$apiKey&q=$cityName';

    http.Response response = await http.get(Uri.parse(url));

    return jsonDecode(response.body);
  }
}
