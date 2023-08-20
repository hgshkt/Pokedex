import 'package:pokedex/domain/data/pokemon_repository.dart';
import 'package:pokedex/domain/model/pokemon.dart';
import 'package:rxdart/rxdart.dart';

class GetPokemonsUseCase {
  GetPokemonsUseCase(this._repository);

  final PokemonRepository _repository;

  void execute(PublishSubject<List<Pokemon>> subject) async {
    _repository.getPokemons(subject);
  }
}
