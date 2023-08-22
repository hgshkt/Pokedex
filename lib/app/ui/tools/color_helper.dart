import 'package:flutter/material.dart';
import 'package:pokedex/app/ui/tools/ui_pokemon_type.dart';

Color getColorsByPokemonType(String type) {
  for (var pokemonType in PokemonType.values) {
    if(type == pokemonType.name) {
      return pokemonType.color;
    }
  }
  return Colors.white;
}