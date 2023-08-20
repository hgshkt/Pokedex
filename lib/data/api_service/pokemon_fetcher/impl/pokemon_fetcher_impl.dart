import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokedex/data/api_service/pokemon_fetcher/model/pokemon_json_model.dart';
import 'package:pokedex/data/api_service/pokemon_fetcher/pokemon_fetcher.dart';

class PokemonFetcherImpl extends PokemonFetcher {

  final String baseUrl = 'https://pokeapi.co/api/v2/pokemon/';

  @override
  Future<PokemonJsonModel> getPokemonById(int id) async {
    final response = await http.get(Uri.parse('$baseUrl$id'));

    final data = json.decode(response.body);

    return PokemonJsonModel.fromJson(data);
  }
}