import 'package:web_app_test/data/network/api.dart';

class BaseRequest {
  final String appId = Api.apiKey;

  const BaseRequest();

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['appId'] = this.appId;
    return data;
  }
}
