import 'package:get/get_connect/http/src/response/response.dart';
import 'package:teste/models/TransfereciaModel.dart';
import 'package:teste/shared/baseService.dart';

class TransferenciaService {
  final baseService = BaseService();

  Future<Response> getTransferencias() {
    return baseService.get('/?user_field_names=true');
  }

  Future<Response> createTransferencias(TransfereciaModel transferencias) {
    return baseService.post('/?user_field_names=true', {
      "valor": transferencias.valor,
      "Number": transferencias.numeroConta,
    });
  }
}
