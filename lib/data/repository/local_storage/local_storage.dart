import 'package:pokedex/data/repository/local_storage/model/responses/pokemon_count_response.dart';
import 'package:pokedex/data/repository/local_storage/model/responses/pokemon_response.dart';
import 'package:pokedex/domain/model/pokemon.dart';

abstract class LocalStorage {
  Future<PokemonCountResponse> getPokemonCountResponse();
  void saveCount(int count);
  Future<PokemonResponse> getPokemonById(int id);
  void savePokemon(Pokemon pokemon);
  Future<String> saveSprite(String url);
}