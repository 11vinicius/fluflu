import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';

class BaseService extends GetConnect {
  BaseService() {
    httpClient.baseUrl =
        'https://api.baserow.io/api/database/rows/table/604606';

    httpClient.timeout = const Duration(seconds: 10);

    httpClient.addRequestModifier((Request<dynamic> request) {
      request.headers['Authorization'] =
          'Token COCtelo9PnU7ddjMQM6H3Id7SqtJOei7';
      return request;
    });
  }
}
