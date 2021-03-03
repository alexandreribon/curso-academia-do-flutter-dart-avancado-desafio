import 'package:dart_avancado_desafio/database/i_database_connection.dart';
import 'package:mysql1/src/single_connection.dart';

class DatabaseConnection implements IDatabaseConnection {
  DatabaseConnection();

  final _settings = ConnectionSettings(
    host: 'localhost',
    port: 3306,
    user: 'root',
    password: 'root',
    db: 'desafio_dart_avancado',
  );

  @override
  Future<MySqlConnection> openConnection() async {
    return await MySqlConnection.connect(_settings);
  }
}
