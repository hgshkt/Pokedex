import 'package:flutter/material.dart';
import 'package:pokedex/app/ui/screens/list/list_use_cases.dart';
import 'package:pokedex/app/ui/screens/list/list_view_model.dart';
import 'package:pokedex/app/ui/widgets/grid_view_content.dart';
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
            return const Center(child: CircularProgressIndicator());
          } else {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1 / 1.3,
              ),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final pokemon = snapshot.data![index];

                return GridViewContent(pokemon, onClick: () {
                  viewModel.onItemClick(context, pokemon);
                });
              },
            );
          }
        },
      ),
    );
  }
}
