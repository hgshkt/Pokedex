import 'package:pokedex/domain/model/pokemon.dart';

abstract class PokemonApiService {
  Future<Pokemon> getPokemonById(int id, Future<String> Function(String url) saveSprite);
}
