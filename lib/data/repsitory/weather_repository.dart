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
      // print(data["cod"]);
      // print(data);
      print(cityName);
      // if(data["cod"] != 200){
      //   throw Exception("An unexpected error occurred");
      // }
      WeatherModel.fromMap(data).toString();
      return WeatherModel.fromMap(data);
    } on Exception catch (e) {
      // TODO
      print(e.toString());
      throw Exception("An unexpected error occurred");
    }
  }
}