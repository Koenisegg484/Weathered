import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'APIkey.dart';
import 'city_search_bar.dart';
import 'conditions_card.dart';
import 'hourly_weather_card.dart';

class WeatherDashboard extends StatefulWidget {
  const WeatherDashboard({super.key});

  @override
  State<StatefulWidget> createState() => _WeatherDashboard();
}

class _WeatherDashboard extends State<WeatherDashboard> {

  Future<Map<String, dynamic>> getCurrentWeather(String cityname) async {
    try {
      final res = await http.get(Uri.parse(
          'https://api.openweathermap.org/data/2.5/forecast?q=$cityname&APPID=$OpenWeatherApiKey'
      ));
      final data = jsonDecode(res.body);
      if(data['cod'] == "400"){
        throw "The location is not valid.";
      }else if(data['cod'] != "200"){
        throw "Unexpected Error";
      }
      return data;

    }catch(e){
      throw(e.toString());
    }
  }

  String _cityname = '';

  void _updateCityName(String city){
    setState(() {
      _cityname = city;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weathered",style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.refresh)),
        ],
      ),
      body: Column(
        children: [
          CitySearch(onCitySubmitted: _updateCityName),
          FutureBuilder(
            future: getCurrentWeather(_cityname),
            builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator());
          }
          if(snapshot.hasError){
            return Center(
              child: Container(
                padding: const EdgeInsets.fromLTRB(40, 20, 40, 20),
                child: Text(snapshot.error.toString(), style: const TextStyle(
                  fontSize: 24,
                  color: Colors.red,
                  fontWeight: FontWeight.w500
                ),),
              ),
            );
          }
          // Initialising variables
          final data = snapshot.data!;
          final currentTemp = data['list'][0]['main']['temp'];
          final currentWeather = data['list'][0]['weather'][0]['main'];
          final humidity = data['list'][0]['main']['humidity'];
          final windSpeed = data['list'][0]['wind']['speed'];
          final pressuteATM = data['list'][0]['main']['pressure'];


          return Padding(
              padding:  const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              // Child 1
              SizedBox(
                width: double.infinity,
                child: Card(
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                  surfaceTintColor: Colors.indigo,
                  elevation: 10,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  child : ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
                      child : Column(
                        children: [
                          const SizedBox(height: 20,),
                          Text(
                            "$currentTemp K",
                            style: const TextStyle(
                                fontSize: 50,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          const Icon(Icons.wb_cloudy_sharp, size: 150,),
                          Text(
                            "$currentWeather",
                            style: const TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w400
                            ),
                          ),
                          const SizedBox(height: 20,),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            // Child 2
            const Padding(
              padding: EdgeInsets.fromLTRB(0,5,20,10),
              child: Row(
                children: [
                  Text(
                    "Weather Forecast",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold
                    ),
                  )
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  WeatherCard(icon: Icons.sunny, temperature: "300", time: data['list'][1]['dt'] , weather: data['list'][1]['weather'][0]['main']),
                  WeatherCard(icon: Icons.sunny, temperature: "300", time: data['list'][2]['dt'], weather: data['list'][2]['weather'][0]['main']),
                  WeatherCard(icon: Icons.sunny, temperature: "300", time: data['list'][3]['dt'], weather: data['list'][3]['weather'][0]['main']),
                  WeatherCard(icon: Icons.railway_alert, temperature: "300", time: data['list'][4]['dt'], weather: data['list'][4]['weather'][0]['main']),
                  WeatherCard(icon: Icons.sunny, temperature: "300", time: data['list'][5]['dt'], weather: data['list'][5]['weather'][0]['main']),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(20,5,20,5),
              child: Row(
                children: [
                  Text(
                    "Current Conditions",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ConditionsCard(icon: Icons.water_drop, heading: "Humidity", value: "$humidity"),
                ConditionsCard(icon: Icons.air, heading: "Wind Speed", value: "$windSpeed"),
                ConditionsCard(icon: Icons.compress, heading: "Pressure", value: "$pressuteATM"),
              ],
            )

          ],
        )
          );
        })
        ],
      ));
  }
}
