import 'package:equatable/equatable.dart';
import 'package:web_app_test/domain/models/weather_model.dart';

abstract class WeatherState extends Equatable {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class WeatherInitialState extends WeatherState {}

class WeatherLoadingState extends WeatherState {}

class WeatherSuccessState extends WeatherState {
  final WeatherModel weather;
  WeatherSuccessState(this.weather);
  @override
  List<Object?> get props => [weather];
}

class WeatherErrorState extends WeatherState {
  final String message;
  WeatherErrorState(this.message);
  @override
  List<Object?> get props => [message];
}
