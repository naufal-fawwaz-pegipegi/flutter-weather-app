import 'package:web_app_test/data/models/geocoding_request.dart';
import 'package:web_app_test/data/network/service.dart';
import 'package:web_app_test/data/models/weather_request.dart';
import 'package:web_app_test/domain/models/geocoding_model.dart';
import 'package:web_app_test/domain/repository/geocoding_repo.dart';
import 'package:web_app_test/domain/models/weather_model.dart';
import 'package:web_app_test/domain/repository/weather_repo.dart';

class WeatherFactory {
  Future<WeatherModel> getWeather(String location) async {
    Service service = Service();
    GeocodingRepo geoRepo = GeocodingRepo(service: service);
    GeocodingRequest geoReq = GeocodingRequest(cityName: location);
    GeocodingModel geoModel = await geoRepo.getCoordinate(geoReq);

    WeatherRepo weatherRepo = WeatherRepo(service: service);
    WeatherRequest weatherReq = WeatherRequest(
        lat: geoModel.lat.toString(), lon: geoModel.lon.toString());
    WeatherModel weatherModel = await weatherRepo.getWeather(weatherReq);
    return weatherModel;
  }
}
