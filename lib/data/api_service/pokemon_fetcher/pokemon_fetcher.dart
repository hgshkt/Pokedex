import 'package:pokedex/data/api_service/pokemon_fetcher/model/pokemon_json_model.dart';

abstract class PokemonFetcher {
  Future<PokemonJsonModel> getPokemonById(int id);
}
