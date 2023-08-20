import 'package:pokedex/data/repository/local_storage/model/responses/pokemon_response.dart';
import 'package:pokedex/domain/model/pokemon.dart';

abstract class PokemonDatabase {
  Future<void> savePokemon(Pokemon pokemon);
  Future<PokemonResponse> getPokemonById(int id);
  void close();
}