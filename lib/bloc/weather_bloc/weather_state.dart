part of 'weather_bloc.dart';

@immutable
sealed class WeatherState {}

final class WeatherInitial extends WeatherState {}

final class WeatherSuccess extends WeatherState{
  final WeatherModel currentWeather;

  WeatherSuccess({required this.currentWeather});
}

final class WeatherFailure extends WeatherState{
  final String errMessage;

  WeatherFailure(this.errMessage);
}

final class WeatherLoading extends WeatherState{}
