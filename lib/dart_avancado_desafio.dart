import 'package:dart_avancado_desafio/database/database_connection.dart';
import 'package:dart_avancado_desafio/database/i_database_connection.dart';
import 'package:dart_avancado_desafio/models/estado_model.dart';
import 'package:dart_avancado_desafio/models/regiao_model.dart';
import 'package:dart_avancado_desafio/repositories/api_ibge/api_ibge_repository.dart';
import 'package:dart_avancado_desafio/services/dao/dao_service.dart';
import 'package:dart_avancado_desafio/services/dao/i_dao_service.dart';
import 'package:mysql1/mysql1.dart';

Future<void> run() async {
  var apiRepository = ApiIbgeRepository();
  IDatabaseConnection db = DatabaseConnection();
  var conn = await db.openConnection();

  print('Inicializado processo de cadastrar regiões');
  var regioes = await apiRepository.getAllRegioes();
  await cadastrarRegioes(regioes, conn);
  print('Finalizado processo de cadastrar regiões');

  print('');

  print('Inicializado processo de cadastrar estados');
  var estados = await apiRepository.getAllEstados();
  await cadastrarEstados(estados, conn);
  print('Finalizado processo de cadastrar estados');

  print('');

  print('Inicializado processo de cadastrar cidades por estado');
  await cadastrarCidadesPorEstado(estados, conn, apiRepository);
  print('Finalizado processo de cadastrar cidades por estado');

  await conn.close();
}

Future<void> cadastrarRegioes(
    List<RegiaoModel> regioes, MySqlConnection conn) async {
  var i = 0;
  var reg = 0;
  IDaoService daoService = DaoService(conn);

  for (var regiao in regioes) {
    reg = await daoService.insertRegiao(regiao);
    if (reg > 0) i++;
  }

  print('');
  print('  Total de regiões cadastradas: $i');
  print('');
}

Future<void> cadastrarEstados(
    List<EstadoModel> estados, MySqlConnection conn) async {
  var i = 0;
  var reg = 0;
  IDaoService daoService = DaoService(conn);

  for (var estado in estados) {
    reg = await daoService.insertEstado(estado);
    if (reg > 0) i++;
  }

  print('');
  print('  Total de estado(s) cadastrado(s): $i');
  print('');
}

Future<void> cadastrarCidadesPorEstado(List<EstadoModel> estados,
    MySqlConnection conn, ApiIbgeRepository repository) async {
  var i = 0;
  var reg = 0;
  IDaoService daoService = DaoService(conn);

  print('');

  for (var estado in estados) {
    var cidades = await repository.getCidadesByEstado(estado.id);
    await sleep();

    i = 0;

    print('Inserindo cidades do estado: ${estado.nome}');

    for (var cidade in cidades) {
      reg = await daoService.insertCidade(cidade);
      if (reg > 0) i++;
      await sleep();
    }

    print('  Total de cidade(s) cadastrada(s): $i');
    print('');
  }
}

Future sleep() {
  return Future.delayed(Duration(milliseconds: 500));
}
