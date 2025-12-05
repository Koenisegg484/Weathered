part of 'weather_bloc.dart';

@immutable
sealed class WeatherEvent {}

final class WeatherDataFetched extends WeatherEvent{

  final String cityName;

  WeatherDataFetched(this.cityName);

}
