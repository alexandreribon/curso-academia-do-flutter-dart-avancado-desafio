import 'dart:convert';

import 'package:dart_avancado_desafio/models/estado_model.dart';

class CidadeModel {
  int id;
  String nome;
  EstadoModel estado;

  CidadeModel({
    this.id,
    this.nome,
    this.estado,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'estado': estado?.toMap(),
    };
  }

  factory CidadeModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return CidadeModel(
      id: map['id'],
      nome: map['nome'],
      estado: EstadoModel.fromMap(
          map['municipio']['microrregiao']['mesorregiao']['UF']),
    );
  }

  String toJson() => json.encode(toMap());

  factory CidadeModel.fromJson(String source) =>
      CidadeModel.fromMap(json.decode(source));
}
