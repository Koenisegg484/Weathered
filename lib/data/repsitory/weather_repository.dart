import 'dart:convert';

import 'package:for_bloc/data/data_provider/weather_data_provider.dart';
import 'package:for_bloc/model/weather_model.dart';

class WeatherRepository{
  final WeatherDataProvider weatherDataProvider;

  WeatherRepository({required this.weatherDataProvider});

  Future<WeatherModel> getCurrentWeather(String cityName) async{

    try {
      final String weatherData = await weatherDataProvider.getCurrentWeather(cityName);
      final data = jsonDecode(weatherData);
      return WeatherModel.fromMap(data);
    } on Exception catch (e) {
      // TODO
      throw Exception("An unexpected error occurred");
    }
  }
}