import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:pokedex/domain/model/pokemon.dart';

class GridViewContent extends StatelessWidget {
  const GridViewContent(this.pokemon, { required this.onClick, super.key});

  final Pokemon pokemon;
  final Function() onClick;

  @override
  Widget build(BuildContext context) {
    double imageWidth = MediaQuery.of(context).size.width / 3;

    return Container(
      child: GestureDetector(
        onTap: onClick,
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
      ),
    );
  }
}
