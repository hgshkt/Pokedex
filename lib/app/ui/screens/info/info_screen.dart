import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/app/ui/styles/text/text_style.dart';
import 'package:pokedex/app/ui/tools/color_helper.dart';
import 'package:pokedex/domain/model/pokemon.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _InfoScreenState();
  }
}

class _InfoScreenState extends State<InfoScreen> {
  @override
  Widget build(BuildContext context) {
    final pokemon = ModalRoute.of(context)!.settings.arguments as Pokemon;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(pokemon.name.toUpperCase()),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.file(File(pokemon.imagePath)),
            Text(
              pokemon.name.toUpperCase(),
              style: const TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text('#${pokemon.id}',
                style: Theme.of(context).textTheme.displayMedium),
            Text(
              'Types:',
              style: Theme.of(context).textTheme.displayMedium,
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: getColorsByPokemonType(pokemon.typeFirst),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 16.0,
                  ),
                  child: Text(
                    pokemon.typeFirst.toUpperCase(),
                    style: AppTextStyle.pokemonTypeText,
                  ),
                ),
                if (pokemon.typeSecond != 'normal') ...[
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: getColorsByPokemonType(pokemon.typeSecond),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 16.0,
                    ),
                    child: Text(
                      pokemon.typeSecond.toUpperCase(),
                      style: AppTextStyle.pokemonTypeText,
                    ),
                  ),
                ]
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'Abilities:',
              style: Theme.of(context).textTheme.displayMedium,
            ),
            Container(
              width: MediaQuery.of(context).size.width - 32,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromRGBO(139, 207, 243, 1.0),
                    Colors.white,
                  ],
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 16.0,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  if (pokemon.firstAbility != 'firstAbility')
                    Text(
                      pokemon.firstAbility.toUpperCase(),
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                  const SizedBox(height: 8),
                  if (pokemon.secondAbility != 'secondAbility')
                    Text(
                      pokemon.secondAbility.toUpperCase(),
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Text(
                'Weight: ${pokemon.weight}',
                style: const TextStyle(
                  fontSize: 16,
                ),
            ),
          ],
        ),
      ),
    );
  }
}
