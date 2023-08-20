import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:pokedex/data/local_storage/pokemon_cache_manager/pokemon_cache_manager.dart';
import 'package:pokedex/data/repository/local_storage/model/responses/pokemon_count_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PokemonCacheManagerImpl extends PokemonCacheManager {
  @override
  Future<String> saveSprite(String imageUrl) async {
    final cacheManager = DefaultCacheManager();

    await cacheManager.downloadFile(imageUrl);

    final fileInfo = await cacheManager.getFileFromCache(imageUrl);
    if (fileInfo != null) {
      return fileInfo.file.path;
    }
    return 'file not found';
  }

  @override
  Future<PokemonCountResponse> getPokemonCountResponse() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? count = prefs.getInt('count');
    if (count == null) return PokemonCountResponse.unsaved();
    return PokemonCountResponse.saved(count);
  }

  @override
  void saveCount(int count) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('count', count);
  }
}