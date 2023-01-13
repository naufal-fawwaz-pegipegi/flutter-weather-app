import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:web_app_test/weather/domain/weather_factory.dart';
import 'package:web_app_test/weather/domain/weather_model.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitial());

  final WeatherFactory factory = WeatherFactory();

  Future<void> getWeather(String location) async {
    emit(WeatherLoading());
    try {
      var weather = await factory.getWeather(location);
      emit(WeatherSuccess(weather));
    } catch (e) {
      emit(WeatherError(e.toString()));
    }
  }
}
