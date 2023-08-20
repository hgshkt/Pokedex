import 'package:pokedex/domain/use_cases/get_pokemons_use_case.dart';

class ListUseCases {
  ListUseCases(
    this.getPokemonsUseCase,
  );

  GetPokemonsUseCase getPokemonsUseCase;
}