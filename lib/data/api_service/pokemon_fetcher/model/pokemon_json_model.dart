import 'package:pokedex/domain/model/pokemon.dart';

class PokemonJsonModel {
  final _emptyPokemon = Pokemon.empty();

  late String name = _emptyPokemon.name;
  late int id = _emptyPokemon.id;
  late String spriteUrl = _emptyPokemon.imagePath;
  late String typeFirst= _emptyPokemon.typeFirst;
  late String typeSecond= _emptyPokemon.typeSecond;
  late int weight= _emptyPokemon.weight;
  late String firstAbility= _emptyPokemon.firstAbility;
  late String secondAbility= _emptyPokemon.secondAbility;

  PokemonJsonModel.fromJson(dynamic json) {
    name = json['name'];
    id = json['id'];
    spriteUrl = 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$id.png';
    typeFirst = json['types'][0]['type']['name'];
    if((json['types'] as List).length > 1) {
      typeSecond = json['types'][1]['type']['name'];
    }
    weight = json['weight'];

    firstAbility = json['abilities'][0]['ability']['name'];
    if ((json['abilities'] as List).length > 1) {
      secondAbility = json['abilities'][1]['ability']['name'];
    }
  }
}