import 'package:equatable/equatable.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();
}

class FethWeather extends WeatherEvent {
  final String city;

  const FethWeather({this.city}) : assert(city != null);

  @override
  List<Object> get props => [city];
}
