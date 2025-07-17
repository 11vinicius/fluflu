import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:teste/shared/components/CustomToast.dart';
import 'package:teste/shared/layout/ColorsTheme.dart';

class BaseService extends GetConnect {
  BaseService() {
    httpClient.baseUrl = 'https://api.baserow.io/api/database/rows/table';

    httpClient.timeout = const Duration(seconds: 10);

    httpClient.addRequestModifier((Request<dynamic> request) {
      request.headers['Authorization'] =
          'Token COCtelo9PnU7ddjMQM6H3Id7SqtJOei7';
      return request;
    });

    Future<Response<dynamic>?> safeGet(String url) async {
      try {
        final response = await get(url);

        if (response.isOk && response.body != null) {
          return response;
        } else {
          CustomToast(
            title: 'Erro',
            message: 'Erro ao buscar dados.',
            bgColor: ColorsTheme.red,
          );
          return null;
        }
      } catch (e) {
        CustomToast(
          title: 'Erro de conexão',
          message: 'Falha ao conectar com o servidor.',
          bgColor: ColorsTheme.red,
        );
        return null;
      }
    }
  }
}
