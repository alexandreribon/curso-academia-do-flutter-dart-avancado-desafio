import 'package:dart_avancado_desafio/models/estado_model.dart';
import 'package:dart_avancado_desafio/models/cidade_model.dart';
import 'package:dart_avancado_desafio/models/regiao_model.dart';
import 'package:dart_avancado_desafio/repositories/api_ibge/i_api_ibge_repository.dart';
import 'package:dio/dio.dart';

class ApiIbgeRepository implements IApiIbgeRepository {
  Dio _dio;

  ApiIbgeRepository() {
    _dio = Dio();
    _dio.options.baseUrl =
        'https://servicodados.ibge.gov.br/api/v1/localidades/';
  }

  @override
  Future<List<RegiaoModel>> getAllRegioes() async {
    var regioes = [];

    try {
      var response = await _dio.get('regioes');

      if (response.statusCode == 200) {
        var respMap = response.data;
        regioes = (respMap as List)
            .map<RegiaoModel>((r) => RegiaoModel.fromMap(r))
            .toList();
      }
    } on Exception catch (e) {
      print(e);
    }

    return regioes;
  }

  @override
  Future<List<EstadoModel>> getAllEstados() async {
    var estados = [];

    try {
      var response = await _dio.get('estados');

      if (response.statusCode == 200) {
        var respMap = response.data;
        estados = (respMap as List)
            .map<EstadoModel>((e) => EstadoModel.fromMap(e))
            .toList();
      }
    } on Exception catch (e) {
      print(e);
    }

    return estados;
  }

  @override
  Future<List<CidadeModel>> getCidadesByEstado(int idEstado) async {
    var cidades = [];

    try {
      var response = await _dio.get('estados/${idEstado}/distritos');

      if (response.statusCode == 200) {
        var respMap = response.data;
        cidades = (respMap as List)
            .map<CidadeModel>((e) => CidadeModel.fromMap(e))
            .toList();
      }
    } on Exception catch (e) {
      print(e);
    }

    return cidades;
  }
}
