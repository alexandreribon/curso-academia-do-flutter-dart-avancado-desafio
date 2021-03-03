import 'package:mysql1/mysql1.dart';
import 'package:dart_avancado_desafio/models/cidade_model.dart';
import 'package:dart_avancado_desafio/models/estado_model.dart';
import 'package:dart_avancado_desafio/models/regiao_model.dart';
import 'package:dart_avancado_desafio/services/dao/i_dao_service.dart';

class DaoService implements IDaoService {
  final MySqlConnection conn;

  DaoService(this.conn);

  @override
  Future<int> insertRegiao(RegiaoModel regiao) async {
    try {
      final result = await conn.query(
        'insert into Regiao(id_regiao,sigla,nome) values(?,?,?)',
        [regiao.id, regiao.sigla, regiao.nome],
      );
      return result.affectedRows;
    } on MySqlException catch (e) {
      print(e);
      return 0;
    }
  }

  @override
  Future<int> insertEstado(EstadoModel estado) async {
    try {
      final result = await conn.query(
        'insert into Estado(id_estado,sigla,nome,id_regiao) values(?,?,?,?)',
        [estado.id, estado.sigla, estado.nome, estado.regiao.id],
      );
      return result.affectedRows;
    } on MySqlException catch (e) {
      print(e);
      return 0;
    }
  }

  @override
  Future<int> insertCidade(CidadeModel cidade) async {
    try {
      final result = await conn.query(
        'insert into Cidade(id_cidade,nome,id_estado) values(?,?,?)',
        [cidade.id, cidade.nome, cidade.estado.id],
      );
      print(result.affectedRows);
      return result.affectedRows;
    } on MySqlException catch (e) {
      print(e);
      return 0;
    }
  }
}
