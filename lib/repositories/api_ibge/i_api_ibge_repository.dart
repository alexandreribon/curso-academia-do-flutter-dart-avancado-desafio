import 'package:dart_avancado_desafio/models/cidade_model.dart';
import 'package:dart_avancado_desafio/models/estado_model.dart';
import 'package:dart_avancado_desafio/models/regiao_model.dart';

abstract class IApiIbgeRepository {
  Future<List<RegiaoModel>> getAllRegioes();
  Future<List<EstadoModel>> getAllEstados();
  Future<List<CidadeModel>> getCidadesByEstado(int idEstado);
}
