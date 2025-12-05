import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/weather_bloc/weather_bloc.dart';
import '../widgets/additionalInfoItems.dart';

class WeatherHomeScreen extends StatefulWidget {
  const WeatherHomeScreen({super.key});

  @override
  State<WeatherHomeScreen> createState() => _WeatherHomeScreenState();
}

class _WeatherHomeScreenState extends State<WeatherHomeScreen> {

  final TextEditingController cityNameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<WeatherBloc>().add(WeatherDataFetched("indore"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Weather App',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              // setState(() {
              //   weather = getCurrentWeather();
              // });
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 12),
        child: SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: TextField(
                      controller: cityNameController,
                      style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500),
                      decoration: InputDecoration(
                        hintText: "Enter you city...",
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 18, fontWeight: FontWeight.w500),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.purple, width: 1)
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Colors.pink, width: 3)
                        ),
                        contentPadding: EdgeInsets.all(8)
                      ),
                    )
                  ),
                  IconButton(
                    onPressed: (){
                      context.read<WeatherBloc>().add(WeatherDataFetched(cityNameController.text));
                    },
                    icon: Icon(Icons.grass_outlined)
                  )
                ],
              ),
              BlocBuilder<WeatherBloc, WeatherState>(
                builder: (context, state){
                  if(state is! WeatherSuccess){
                    return Center(child: CircularProgressIndicator(),);
                  }

                  final data = state.currentWeather;

                  final currentWeatherData = data;

                  final currentTemp = currentWeatherData.currentTemp;
                  final currentSky = currentWeatherData.currentSky;
                  final currentPressure = currentWeatherData.currentPressure;
                  final currentWindSpeed = currentWeatherData.currentWindSpeed;
                  final currentHumidity = currentWeatherData.currentHumidity;

                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // main card
                        SizedBox(
                          width: double.infinity,
                          child: Card(
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: BackdropFilter(
                                filter: ImageFilter.blur(
                                  sigmaX: 10,
                                  sigmaY: 10,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    children: [
                                      Text(
                                        '$currentTemp K',
                                        style: const TextStyle(
                                          fontSize: 32,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 16),
                                      Icon(
                                        currentSky == 'Clouds' || currentSky == 'Rain'
                                            ? Icons.cloud
                                            : Icons.sunny,
                                        size: 64,
                                      ),
                                      const SizedBox(height: 16),
                                      Text(
                                        currentSky,
                                        style: const TextStyle(
                                          fontSize: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'Hourly Forecast',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        // const SizedBox(height: 8),
                        // SizedBox(
                        //   height: 120,
                        //   child: ListView.builder(
                        //     itemCount: 5,
                        //     scrollDirection: Axis.horizontal,
                        //     itemBuilder: (context, index) {
                        //       final hourlyForecast = data['list'][index + 1];
                        //       final hourlySky =
                        //       data['list'][index + 1]['weather'][0]['main'];
                        //       final hourlyTemp =
                        //       hourlyForecast['main']['temp'].toString();
                        //       final time = DateTime.parse(hourlyForecast['dt_txt']);
                        //       return HourlyForecastItem(
                        //         time: DateFormat.j().format(time),
                        //         temperature: hourlyTemp,
                        //         icon: hourlySky == 'Clouds' || hourlySky == 'Rain'
                        //             ? Icons.cloud
                        //             : Icons.sunny,
                        //       );
                        //     },
                        //   ),
                        // ),

                        const SizedBox(height: 20),
                        const Text(
                          'Additional Information',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            AdditionalInfoItem(
                              icon: Icons.water_drop,
                              label: 'Humidity',
                              value: currentHumidity.toString(),
                            ),
                            AdditionalInfoItem(
                              icon: Icons.air,
                              label: 'Wind Speed',
                              value: currentWindSpeed.toString(),
                            ),
                            AdditionalInfoItem(
                              icon: Icons.beach_access,
                              label: 'Pressure',
                              value: currentPressure.toString(),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
