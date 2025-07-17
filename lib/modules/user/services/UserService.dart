import 'package:get/get_connect/http/src/response/response.dart';
import 'package:teste/modules/transferencia/models/TransfereciaModel.dart';
import 'package:teste/shared/baseService.dart';

class UserService {
  final baseService = BaseService();

  Future<Response> getUser() {
    return baseService.get('/611479/?user_field_names=true');
  }

  Future<Response> createTransferencias(TransfereciaModel transferencias) {
    return baseService.post('/611479/?user_field_names=true', {
      "valor": transferencias.valor,
      "Number": transferencias.numeroConta,
    });
  }
}
