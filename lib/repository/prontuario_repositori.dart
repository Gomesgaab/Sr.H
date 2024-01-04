import 'package:app_srh/model/prontuariomodel.dart';

class ProntuarioRepositori {
  final List<ProntuarioModel> _prontuari = [];
  //adicionando prontuario
  Future<void> adicionarP(ProntuarioModel prontuario) async {
    await Future.delayed(const Duration(seconds: 2));
    _prontuari.add(prontuario);
  }

  void atualiarProntuario(String id, bool salvar) async {
    await Future.delayed(const Duration(seconds: 2));
    _prontuari.where((idprontuario) => idprontuario.id == id).first.salvar =
        salvar;
  }

  //visualizando prontuario
  Future<List<ProntuarioModel>> visualizarProntuario() async {
    await Future.delayed(const Duration(seconds: 01));
    return _prontuari;
  }
}
