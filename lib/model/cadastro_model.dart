class CadastroSqliteModel {
  int _id = 0;
  String _nome = "";
  String _telefone = "";
  String _endereco = "";
  String _email = "";
  String _cpf = "";

  CadastroSqliteModel(this._id, this._nome, this._endereco, this._telefone,
      this._email, this._cpf);

  int get id => _id;

  set id(int id) {
    _id = id;
  }

  String get nome => _nome;

  set nome(String nome) {
    _nome = nome;
  }

  String get endereco => _endereco;

  set endereco(String endereco) {
    _endereco = endereco;
  }

  String get telefone => _telefone;

  set telefone(String telefone) {
    _telefone = telefone;
  }

  String get email => _email;

  set email(String email) {
    _email = email;
  }

  String get cpf => _cpf;

  set cpf(String cpf) {
    _cpf = cpf;
  }
}
