import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:for_bloc/data/repsitory/weather_repository.dart';

import '../../model/weather_model.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {

  final WeatherRepository weatherRepository;
  final String cityName;
  WeatherBloc(this.weatherRepository, {required this.cityName}) : super(WeatherInitial()) {
    on<WeatherDataFetched>(_getCurrentWeather);
  }

  void _getCurrentWeather(WeatherEvent event, Emitter<WeatherState> state) async{

    try {
      emit(WeatherLoading());
      final weather = await weatherRepository.getCurrentWeather((event as WeatherDataFetched).cityName??"none");
      return emit(WeatherSuccess(currentWeather: weather));
    } on Exception catch (e) {
      return emit(WeatherFailure(e.toString()));
    }
  }
}
