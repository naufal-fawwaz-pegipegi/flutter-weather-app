import 'package:web_app_test/data/network/service.dart';
import 'package:web_app_test/data/models/weather_request.dart';
import 'package:web_app_test/data/models/weather_response.dart';
import 'package:web_app_test/domain/models/weather_model.dart';

class WeatherRepo {
  Service service;

  WeatherRepo({required this.service});

  Future<WeatherModel> getWeather(WeatherRequest req) async {
    WeatherResponse res = await service.getWeather(req);
    return WeatherModel.fromResponse(res);
  }
}
