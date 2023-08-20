import 'package:flutter/cupertino.dart';
import 'package:pokedex/domain/model/pokemon.dart';

class PokemonView extends StatelessWidget {
  const PokemonView({super.key, required this.pokemon});

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(
          pokemon.imagePath,
          width: 200,
          height: 200,
          fit: BoxFit.cover,
        ),
        Text(pokemon.name)
      ],
    );
  }
}
