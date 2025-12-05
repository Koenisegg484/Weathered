import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:for_bloc/data/data_provider/weather_data_provider.dart';
import 'package:for_bloc/presentation/screens/WeatherHomeScreen.dart';

import 'bloc/weather_bloc/weather_bloc.dart';
import 'data/repsitory/weather_repository.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) =>
          WeatherRepository(weatherDataProvider: WeatherDataProvider()),
      child: BlocProvider(
        create: (context) => WeatherBloc(cityName: 'Indore', context.read<WeatherRepository>()),
        child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          ),
          home: WeatherHomeScreen(),
        ),
      ),
    );
  }
}