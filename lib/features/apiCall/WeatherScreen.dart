import 'package:blocwithcleanarchitecture/features/apiCall/model/weather_model.dart';
import 'package:blocwithcleanarchitecture/features/apiCall/weatherService.dart';
import 'package:flutter/material.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final WeatherService _weatherService = WeatherService();
  WeatherModel? _weather;
  bool _isLoading = false;
  String _error = '';
  Future<void> fetchWeather() async {
    setState(() {
      _isLoading = true;
      _error = '';
    });

    try {
      _weather = await _weatherService.fetchWeather();
    } catch (e) {
      setState(() {
        _isLoading = false;
        _error = e.toString();
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    fetchWeather();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
              child: _isLoading
                  ? CircularProgressIndicator()
                  : _error.isNotEmpty
                      ? Text(_error.toString())
                      : _weather != null
                          ? Padding(
                              padding: const EdgeInsets.all(50.0),
                              child: Text(_weather!.visibility.toString()),
                            )
                          : Container(
                              child: Text("DATA NOT FOUND"),
                            ))),
    );
  }
}
