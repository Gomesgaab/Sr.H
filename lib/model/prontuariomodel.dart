import 'package:flutter/material.dart';

class ProntuarioModel {
  final String _id = UniqueKey().toString();
  String _cns = "";
  String _nome = "";
  DateTime _dtNacimento;
  String _sexo = "";
  String _fc = "";
  String _pa = "";
  String _tax = "";
  String _r = "";
  String _dx = "";
  String _sintomas = "";
  bool _salvar = false;

  ProntuarioModel(
      this._cns,
      this._nome,
      this._dtNacimento,
      this._sexo,
      this._fc,
      this._pa,
      this._tax,
      this._r,
      this._dx,
      this._sintomas,
      this._salvar);

  //gets
  String get id => _id;

  String get cns => _cns;

  String get nome => _nome;

  DateTime get dtNacimento => _dtNacimento;

  String get sexo => _sexo;

  String get fc => _fc;

  String get pa => _pa;

  String get tax => _tax;

  String get r => _r;

  String get dx => _dx;

  String get sintomas => _sintomas;

  bool get salvar => _salvar;

  //Sets
  set cons(String cns) {
    _cns = cns;
  }

  set nome(String nome) {
    _nome = nome;
  }

  set dtNacimento(DateTime dtNacimento) {
    _dtNacimento = dtNacimento;
  }

  set sexo(String sexo) {
    _sexo = sexo;
  }

  set fc(String fc) {
    _fc = fc;
  }

  set pa(String pa) {
    _pa = pa;
  }

  set tax(String tax) {
    _tax = tax;
  }

  set r(String r) {
    _r = r;
  }

  set dx(String dx) {
    _dx = dx;
  }

  set sintomas(String sintomas) {
    _sintomas = sintomas;
  }

  set salvar(bool salvar) {
    _salvar = salvar;
  }
}
