import 'package:pokedex/data/local_storage/database/pokemon_database.dart';

abstract class PokemonDatabaseProvider {
  PokemonDatabase open();
}