import 'dart:convert';

import 'package:for_bloc/secrets.dart';
import 'package:http/http.dart' as http;

class WeatherDataProvider{

  Future<String> getCurrentWeather(String cityName) async{
    try{
      final result = await http.get(
        Uri.parse("https://api.openweathermap.org/data/2.5/forecast?q=$cityName&APPID=$openWeatherMapApiKey")
      );
      final data = jsonDecode(result.body);

      return result.body;
    }catch(e){
      throw e.toString();
    }
  }

}


// 77c01b530aed207dda4c8e59c8c446b9