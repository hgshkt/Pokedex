import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:pokedex/domain/model/pokemon.dart';

class GridViewContent extends StatelessWidget {
  const GridViewContent(this.pokemon, {super.key});

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    double imageWidth = MediaQuery.of(context).size.width / 3;

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: imageWidth,
            height: imageWidth,
            child: Image.file(File(pokemon.imagePath)),
          ),
          Text('#${pokemon.id}'),
          Text(pokemon.name.toUpperCase(),),
        ],
      ),
    );
  }
}
