import 'package:web_app_test/data/models/geocoding_request.dart';
import 'package:web_app_test/data/models/geocoding_response.dart';
import 'package:web_app_test/data/network/service.dart';
import 'package:web_app_test/domain/models/geocoding_model.dart';

class GeocodingRepo {
  Service service;

  GeocodingRepo({required this.service});

  Future<GeocodingModel> getCoordinate(GeocodingRequest req) async {
    GeocodingResponse response = await service.getGeocoding(req);
    return GeocodingModel.fromResponse(response);
  }
}
