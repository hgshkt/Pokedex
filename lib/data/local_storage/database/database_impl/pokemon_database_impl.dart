import 'package:pokedex/data/local_storage/database/pokemon_database.dart';
import 'package:pokedex/data/repository/local_storage/model/responses/pokemon_response.dart';
import 'package:pokedex/domain/model/pokemon.dart';
import 'package:sqflite/sqflite.dart';

class PokemonDatabaseImpl extends PokemonDatabase {
  PokemonDatabaseImpl({
    required Database database,
    required String tableName,
  }) {
    _database = database;
    _tableName = tableName;
  }

  late Database _database;
  late String _tableName;

  @override
  Future<PokemonResponse> getPokemonById(int id) async {
    final List<Map<String, dynamic>> maps = await _database.query(
      _tableName,
      where: 'id = ?',
      whereArgs: [id],
    );

    bool loaded = maps.isNotEmpty;

    Pokemon pokemon = Pokemon.empty();
    if (loaded) {
      pokemon = mapToPokemon(maps[0]);
      return PokemonResponse.isSaved(pokemon);
    }

    return PokemonResponse.unsaved();
  }

  @override
  Future<void> savePokemon(Pokemon pokemon) async {
    var map = toMap(pokemon);
    await _database.insert(_tableName, map);
  }

  Map<String, dynamic> toMap(Pokemon pokemon) {
    return {
      'id': pokemon.id,
      'name': pokemon.name,
      'imagePath': pokemon.imagePath,
      'firstAbility': pokemon.firstAbility,
      'secondAbility': pokemon.secondAbility
    };
  }

  Pokemon mapToPokemon(Map<String, dynamic> map) {
    return Pokemon(
      id: map['id'],
      name: map['name'],
      imagePath: map['imagePath'],
      firstAbility: map['firstAbility'],
      secondAbility: map['secondAbility'],
    );
  }

  @override
  void close() {
    _database.close();
  }
}
