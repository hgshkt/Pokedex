import 'package:pokedex/data/api_service/pokemon_fetcher/model/pokemon_json_model.dart';
import 'package:pokedex/data/api_service/pokemon_fetcher/pokemon_fetcher.dart';
import 'package:pokedex/data/repository/api_service/pokemon_api_service.dart';
import 'package:pokedex/domain/model/pokemon.dart';

class PokemonApiServiceImpl extends PokemonApiService {
  PokemonApiServiceImpl(this._pokemonFetcher);

  final PokemonFetcher _pokemonFetcher;

  @override
  Future<Pokemon> getPokemonById(
      int id, Future<String> Function(String url) saveSprite) async {
    var pokemonJsonModel = await _pokemonFetcher.getPokemonById(id);

    var path = await saveSprite(pokemonJsonModel.spriteUrl);

    return _mapToDomainPokemon(pokemonJsonModel, path);
  }

  Pokemon _mapToDomainPokemon(PokemonJsonModel jsonModel, String spritePath) {
    return Pokemon(
      id: jsonModel.id,
      name: jsonModel.name,
      imagePath: spritePath,
      firstAbility: jsonModel.firstAbility,
      secondAbility: jsonModel.secondAbility
    );
  }
}
