import 'package:pokedex/domain/model/pokemon.dart';

class PokemonResponse {
  bool isSaved = false;
  Pokemon value = Pokemon.empty();

  PokemonResponse.isSaved(this.value) {
    isSaved = true;
  }

  PokemonResponse.unsaved();
}
