import 'package:web_app_test/data/network/api.dart';
import 'package:web_app_test/data/network/service.dart';

class BaseRequest {
  final String appId = Api.apiKey;

  const BaseRequest();

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['appId'] = this.appId;
    return data;
  }
}
