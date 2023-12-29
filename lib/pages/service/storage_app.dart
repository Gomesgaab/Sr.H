import 'package:shared_preferences/shared_preferences.dart';

//conjunto fixo de constantes, conjunto limitado de dados que não mudarão com o tempo
enum Storagechaves {
  chaveEmail,
  chaveSenha,
  chaveNotificacao,
  chaveDigital,
}

class AppStorage {
  Future<void> setDadosLoginEmail(String email) async {
    await _setString(Storagechaves.chaveEmail.toString(), email);
  }

  Future<void> setDadosLoginSenha(String senha) async {
    await _setString(Storagechaves.chaveSenha.toString(), senha);
  }

  Future<String> getDadosLoginEmail() async {
    return _getstring(Storagechaves.chaveEmail.toString());
  }

  Future<String> getDadoSenha() async {
    return _getstring(Storagechaves.chaveSenha.toString());
  }

  // get set configuração
  Future<void> setDadosConfiguracaoNotificacao(bool notificacao) async {
    await _setBool(Storagechaves.chaveNotificacao.toString(), notificacao);
  }

  Future<void> setDadosConfiguracaoDigital(bool digital) async {
    await _setBool(Storagechaves.chaveDigital.toString(), digital);
  }

  Future<bool> getDadosConfiguracaoNotificacao() async {
    return _getBool(Storagechaves.chaveNotificacao.toString());
  }

  Future<bool> getDadosConfiguracaoDigital() async {
    return _getBool(Storagechaves.chaveDigital.toString());
  }

  //instancia sharedPreferences
  Future<void> _setString(String chave, String value) async {
    var storage = await SharedPreferences.getInstance();
    storage.setString(chave, value);
  }

  Future<String> _getstring(String chave) async {
    var storage = await SharedPreferences.getInstance();
    return storage.getString(chave) ?? "";
  }

  Future<void> _setBool(String chave, bool value) async {
    var storage = await SharedPreferences.getInstance();
    storage.setBool(chave, value);
  }

  Future<bool> _getBool(String chave) async {
    var storage = await SharedPreferences.getInstance();
    return storage.getBool(chave) ?? false;
  }
}
