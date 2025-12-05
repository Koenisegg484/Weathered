

class WeatherModel{
  final double currentTemp;
  final String currentSky;
  final int currentPressure;
  final double currentWindSpeed;
  final int currentHumidity;

  //<editor-fold desc="Data Methods">
  const WeatherModel({
    required this.currentTemp,
    required this.currentSky,
    required this.currentPressure,
    required this.currentWindSpeed,
    required this.currentHumidity,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WeatherModel &&
          runtimeType == other.runtimeType &&
          currentTemp == other.currentTemp &&
          currentSky == other.currentSky &&
          currentPressure == other.currentPressure &&
          currentWindSpeed == other.currentWindSpeed &&
          currentHumidity == other.currentHumidity);

  @override
  int get hashCode =>
      currentTemp.hashCode ^
      currentSky.hashCode ^
      currentPressure.hashCode ^
      currentWindSpeed.hashCode ^
      currentHumidity.hashCode;

  @override
  String toString() {
    return 'WeatherModel{' +
        ' currentTemp: $currentTemp,' +
        ' currentSky: $currentSky,' +
        ' currentPressure: $currentPressure,' +
        ' currentWindSpeed: $currentWindSpeed,' +
        ' currentHumidity: $currentHumidity,' +
        '}';
  }

  WeatherModel copyWith({
    double? currentTemp,
    String? currentSky,
    int? currentPressure,
    double? currentWindSpeed,
    int? currentHumidity,
  }) {
    return WeatherModel(
      currentTemp: currentTemp ?? this.currentTemp,
      currentSky: currentSky ?? this.currentSky,
      currentPressure: currentPressure ?? this.currentPressure,
      currentWindSpeed: currentWindSpeed ?? this.currentWindSpeed,
      currentHumidity: currentHumidity ?? this.currentHumidity,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'currentTemp': this.currentTemp,
      'currentSky': this.currentSky,
      'currentPressure': this.currentPressure,
      'currentWindSpeed': this.currentWindSpeed,
      'currentHumidity': this.currentHumidity,
    };
  }

  factory WeatherModel.fromMap(Map<String, dynamic> map) {
    final currentWeatherData = map['list'][0];

    return WeatherModel(
      currentTemp: currentWeatherData['main']['temp'],
      currentSky: currentWeatherData['weather'][0]['main'],
      currentPressure: currentWeatherData['main']['pressure'],
      currentWindSpeed: currentWeatherData['wind']['speed'],
      currentHumidity: currentWeatherData['main']['humidity'],
    );
  }

  //</editor-fold>
}