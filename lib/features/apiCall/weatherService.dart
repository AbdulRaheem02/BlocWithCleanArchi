import 'dart:convert';

import 'package:http/http.dart' as https;

import 'model/weather_model.dart';

class WeatherService {
  final String apiUrl =
      'https://api.openweathermap.org/data/2.5/weather?lat=76.55&lon=78.55&appid=235bd750bd154ba27573931719364457';
  Future<WeatherModel> fetchWeather() async {
    final response = await https.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      return WeatherModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
