import 'package:bloc/bloc.dart';
import 'package:clima/data/my_weather_data.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/weather.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherBlocInitial()) {
    on<fetchweather>((event, emit) async {
      emit(WeatherBlocLoading());
      try {
        WeatherFactory wf = WeatherFactory(API_KEY, language: Language.ENGLISH);

        Weather weather = await wf.currentWeatherByLocation(
            event.position.altitude, event.position.longitude);
        print(weather);

        emit(WeatherBlocSucces(weather));
      } catch (e) {
        emit(WeatherBlocFaliar());
      }
    });
  }
}
