import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_app_test/domain/usecases/weather_factory.dart';
import 'package:web_app_test/presentation/weather/weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitialState());

  final WeatherFactory factory = WeatherFactory();

  void getWeather(String location) async {
    emit(WeatherLoadingState());
    try {
      var result = await factory.getWeather(location);
      emit(WeatherSuccessState(result));
    } catch (e) {
      emit(WeatherErrorState(e.toString()));
    }
  }
}
