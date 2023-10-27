part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();
  @override
  List<Object?> get props => [];
}

class fetchweather extends WeatherEvent {
  final Position position;
  fetchweather(this.position);
  @override
  List<Object?> get props => [position];
}
