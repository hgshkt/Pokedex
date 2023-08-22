import 'package:flutter/cupertino.dart';
import 'package:pokedex/app/ui/screens/list/list_use_cases.dart';
import 'package:pokedex/domain/model/pokemon.dart';
import 'package:rxdart/rxdart.dart';

class ListViewModel {
  final _pokemonSubject = PublishSubject<List<Pokemon>>();
  List<Pokemon> pokemons = [];
  late Stream<List<Pokemon>> stream;

  ListViewModel(ListUseCases useCases) {
    _pokemonSubject.listen((usersValue) {
      pokemons = usersValue;
    });

    stream = _pokemonSubject.stream;

    useCases.getPokemonsUseCase.execute(_pokemonSubject);
  }

  void onItemClick(BuildContext context, Pokemon pokemon) {
    Navigator.pushNamed(
      context,
      '/info',
      arguments: pokemon,
    );
  }
}
