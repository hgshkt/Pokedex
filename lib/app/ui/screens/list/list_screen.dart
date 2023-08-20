import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pokedex/app/ui/screens/list/list_use_cases.dart';
import 'package:pokedex/app/ui/screens/list/list_view_model.dart';
import 'package:pokedex/domain/model/pokemon.dart';

class ListScreen extends StatefulWidget {
  const ListScreen(this.useCases, {super.key});

  final ListUseCases useCases;

  @override
  State<StatefulWidget> createState() {
    return _ListScreenState();
  }
}

class _ListScreenState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    final viewModel = ListViewModel(widget.useCases);

    return Scaffold(
      appBar: AppBar(title: const Text('Pokédex')),
      body: StreamBuilder<List<Pokemon>>(
        stream: viewModel.stream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No users available.'));
          } else {
            return GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final pokemon = snapshot.data![index];
                return GridTile(
                  child: Center(
                    child: Column(
                      children: [
                        Image.file(File(pokemon.imagePath)),
                        Text('#${pokemon.id}'),
                        Text(pokemon.name),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
