class PokemonJsonModel {
  late String name;
  late int id;
  late String spriteUrl;
  late String typeFirst;
  late String typeSecond;
  late int weight;
  late String firstAbility;
  late String secondAbility;

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
    } else {
      secondAbility = '';
    }
  }
}