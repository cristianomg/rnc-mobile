import 'package:rnc_mobile/app/models/ocurrence_register.dart';

import '../repositories/ocurrence_register_repository.dart';

class OcurrenceListController {
  final OcurrenceRegisterRepository _ocurrenceRegisterRepository =
      OcurrenceRegisterRepository();

  Future<List<OcurrenceRegister>> getOcurrencesRegisters() async {
    return await _ocurrenceRegisterRepository.getAll();
  }

  Future deleteOcurrenceRegister(String id) async {
    await _ocurrenceRegisterRepository.delete(id);
  }

  Future<OcurrenceRegister> getById(String id) async {
    return await _ocurrenceRegisterRepository.getById(id);
  }
}
