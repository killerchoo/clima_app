part of 'weather_bloc.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();
  @override
  List<Object> get props => [];
}

class WeatherBlocInitial extends WeatherState {}

class WeatherBlocLoading extends WeatherState {}

class WeatherBlocFaliar extends WeatherState {}

class WeatherBlocSucces extends WeatherState {
  final Weather weather;

  const WeatherBlocSucces(this.weather);
  @override
  List<Object> get props => [weather];
}
