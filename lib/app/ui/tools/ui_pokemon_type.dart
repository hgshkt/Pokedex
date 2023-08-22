import 'dart:ui';

enum PokemonType {
  grass('grass', Color.fromRGBO(26, 213, 26, 1.0)),
  poison('poison', Color.fromRGBO(152, 45, 232, 1.0)),
  fire('fire', Color.fromRGBO(234, 67, 67, 1.0)),
  flying('flying', Color.fromRGBO(155, 216, 238, 1.0)),
  water('water', Color.fromRGBO(61, 85, 222, 1.0)),
  bug('bug', Color.fromRGBO(151, 215, 34, 1.0)),
  normal('normal', Color.fromRGBO(178, 178, 178, 1.0)),
  electric('electric', Color.fromRGBO(228, 228, 24, 1.0)),
  ground('ground', Color.fromRGBO(183, 130, 32, 1.0)),
  fairy('fairy', Color.fromRGBO(238, 157, 242, 1.0)),
  rock('rock', Color.fromRGBO(103, 103, 103, 1.0)),
  fighting('fighting', Color.fromRGBO(239, 105, 25, 1.0)),
  ghost('ghost', Color.fromRGBO(97, 47, 234, 1.0)),
  steel('steel', Color.fromRGBO(135, 159, 169, 1.0)),
  psychic('psychic', Color.fromRGBO(238, 16, 166, 1.0)),
  ice('ice', Color.fromRGBO(122, 211, 236, 1.0)),
  dragon('dragon', Color.fromRGBO(185, 74, 133, 1.0)),
  dark('dark', Color.fromRGBO(45, 43, 43, 1.0));

  final String name;
  final Color color;

  const PokemonType(this.name, this.color);

  @override
  String toString() {
    return name;
  }
}