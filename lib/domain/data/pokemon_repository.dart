import 'package:pokedex/domain/model/pokemon.dart';
import 'package:rxdart/rxdart.dart';

abstract class PokemonRepository {
  void getPokemons(PublishSubject<List<Pokemon>> subject);
}
