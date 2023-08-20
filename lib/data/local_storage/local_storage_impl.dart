import 'package:pokedex/data/local_storage/database/pokemon_database.dart';
import 'package:pokedex/data/local_storage/pokemon_cache_manager/pokemon_cache_manager.dart';
import 'package:pokedex/data/repository/local_storage/local_storage.dart';
import 'package:pokedex/data/repository/local_storage/model/responses/pokemon_count_response.dart';
import 'package:pokedex/data/repository/local_storage/model/responses/pokemon_response.dart';
import 'package:pokedex/domain/model/pokemon.dart';

class LocalStorageImpl extends LocalStorage {


  LocalStorageImpl({
    required PokemonDatabase database,
    required PokemonCacheManager pokemonCacheManager,
  }) {
    _database = database;
    _pokemonCacheManager = pokemonCacheManager;
  }
  late PokemonDatabase _database;
  late PokemonCacheManager _pokemonCacheManager;

  @override
  Future<PokemonResponse> getPokemonById(int id) async {
    return await _database.getPokemonById(id);
  }

  @override
  Future<void> savePokemon(Pokemon pokemon) async {
    await _database.savePokemon(pokemon);
  }

  @override
  Future<String> saveSprite(String url) async {
    return await _pokemonCacheManager.saveSprite(url);
  }

  @override
  Future<PokemonCountResponse> getPokemonCountResponse() async {
    return await _pokemonCacheManager.getPokemonCountResponse();
  }

  @override
  void saveCount(int count) {
    _pokemonCacheManager.saveCount(count);
  }

}