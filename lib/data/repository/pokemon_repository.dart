import 'package:pokedex/data/repository/api_service/pokemon_api_service.dart';
import 'package:pokedex/data/repository/local_storage/local_storage.dart';
import 'package:pokedex/data/repository/remote_storage/remote_storage.dart';
import 'package:pokedex/domain/data/pokemon_repository.dart';
import 'package:pokedex/domain/model/pokemon.dart';
import 'package:rxdart/src/subjects/publish_subject.dart';


class PokemonRepositoryImpl extends PokemonRepository {
  PokemonRepositoryImpl({
    required RemoteStorage remoteStorage,
    required LocalStorage localStorage,
    required PokemonApiService pokemonApiService,
  }) {
    _remoteStorage = remoteStorage;
    _localStorage = localStorage;
    _pokemonApiService = pokemonApiService;
  }

  late RemoteStorage _remoteStorage;
  late LocalStorage _localStorage;
  late PokemonApiService _pokemonApiService;
  late PublishSubject<List<Pokemon>> _subject;

  var _count = 0;
  final _firstPokemonId = 1;

  final List<Pokemon> _fetchedPokemons = [];

  @override
  void getPokemons(PublishSubject<List<Pokemon>> subject) async {
    _subject = subject;

    var pokemonCountResponse = await _localStorage.getPokemonCountResponse();
    if (pokemonCountResponse.isSaved) {
      _count = pokemonCountResponse.value;
    } else {
      _count = await _remoteStorage.getCount();
      _localStorage.saveCount(_count);
    }

    _getPokemonsBetween(_firstPokemonId, _count);

    var oldNumber = _count;
    _count = await _remoteStorage.getCount();
    _getPokemonsBetween(oldNumber + 1, _count);
  }

  void _getPokemonsBetween(int start, int finish) async {
    for (var i = start; i <= finish; i++) {
      var pokemonResponse = await _localStorage.getPokemonById(i);

      if (pokemonResponse.isSaved) {
        _emit(pokemonResponse.value);
      } else {
        var pokemon = await _pokemonApiService.getPokemonById(i, _saveSprite);
        _emit(pokemon);
        _localStorage.savePokemon(pokemon);
      }
    }
  }

  Future<String> _saveSprite(String url) async {
    return await _localStorage.saveSprite(url);
  }

  void _emit(Pokemon pokemon) {
    _fetchedPokemons.add(pokemon);
    _subject.add(_fetchedPokemons);
  }
}
