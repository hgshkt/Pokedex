import 'package:pokedex/data/repository/local_storage/model/responses/pokemon_count_response.dart';

abstract class PokemonCacheManager {
  Future<String> saveSprite(String imageUrl);
  void saveCount(int count);
  Future<PokemonCountResponse> getPokemonCountResponse();
}