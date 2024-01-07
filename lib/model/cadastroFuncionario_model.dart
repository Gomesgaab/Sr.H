import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CadastroFuncionarioModel {
  String idFuncionario = UniqueKey().toString();
  String? nome;
  String? telefone;
  String? endereco;
  DateTime dtNacimento = DateTime.now();
  int? cPF;
  String? genero;
  String? rProficional;
  String? especializacao;
  String? email;
  String? senha;

  CadastroFuncionarioModel(
      {this.nome,
      this.telefone,
      this.endereco,
      required this.dtNacimento,
      this.cPF,
      this.genero,
      this.rProficional,
      this.especializacao,
      this.email,
      this.senha});

  CadastroFuncionarioModel.fromJson(Map<String, dynamic> json) {
    idFuncionario = json['idFuncionario'];
    nome = json['nome'];
    telefone = json['telefone'];
    endereco = json['endereco'];
    dtNacimento = (json['dtNacimento'] as Timestamp).toDate();
    cPF = json['CPF'];
    genero = json['genero'];
    rProficional = json['rProficional'];
    especializacao = json['especializacao'];
    email = json['email'];
    senha = json['senha'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idFuncionario'] = this.idFuncionario;
    data['nome'] = this.nome;
    data['telefone'] = this.telefone;
    data['endereco'] = this.endereco;
    data['dtNacimento'] = Timestamp.fromDate(this.dtNacimento);
    data['CPF'] = this.cPF;
    data['genero'] = this.genero;
    data['rProficional'] = this.rProficional;
    data['especializacao'] = this.especializacao;
    data['email'] = this.email;
    data['senha'] = this.senha;
    return data;
  }
}
