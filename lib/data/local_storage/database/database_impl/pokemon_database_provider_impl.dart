import 'package:path/path.dart';
import 'package:pokedex/data/local_storage/database/database_impl/pokemon_database_impl.dart';
import 'package:pokedex/data/local_storage/database/pokemon_database.dart';
import 'package:sqflite/sqflite.dart';

class PokemonDatabaseProviderImpl {
  late Database _database;
  final _tableName = 'pokemons';
  String _createTableQuery = '';

  PokemonDatabaseProviderImpl() {
    _createTableQuery =
    'CREATE TABLE $_tableName(id INTEGER PRIMARY KEY, name TEXT, imagePath TEXT, firstAbility TEXT, secondAbility TEXT)';
  }

  Future<PokemonDatabase> open() async {
    _database = await openDatabase(
      join(await getDatabasesPath(), '${_tableName}_database.db'),
      version: 1,
      onCreate: (db, version) async {
        await db.execute(_createTableQuery);
      },
    );
    return PokemonDatabaseImpl(database: _database, tableName: _tableName);
  }
}
