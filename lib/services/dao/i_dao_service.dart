import 'package:dart_avancado_desafio/models/cidade_model.dart';
import 'package:dart_avancado_desafio/models/estado_model.dart';
import 'package:dart_avancado_desafio/models/regiao_model.dart';

abstract class IDaoService {
  Future<int> insertRegiao(RegiaoModel regiao);
  Future<int> insertEstado(EstadoModel estado);
  Future<int> insertCidade(CidadeModel cidade);
}
