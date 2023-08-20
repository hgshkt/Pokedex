import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/app/ui/screens/info/info_screen.dart';
import 'package:pokedex/app/ui/screens/list/list_screen.dart';
import 'package:pokedex/app/ui/screens/list/list_use_cases.dart';
import 'package:pokedex/data/local_storage/database/database_impl/pokemon_database_provider_impl.dart';
import 'package:pokedex/data/local_storage/database/pokemon_database.dart';
import 'package:pokedex/data/local_storage/local_storage_impl.dart';
import 'package:pokedex/data/local_storage/pokemon_cache_manager/pokemon_cache_manager_impl/pokemon_cache_manager.dart';
import 'package:pokedex/data/remote_storage/remote_storage_impl.dart';
import 'package:pokedex/data/repository/pokemon_repository.dart';
import 'package:pokedex/domain/use_cases/get_pokemons_use_case.dart';

import 'data/api_service/api_service_impl.dart';
import 'data/api_service/pokemon_fetcher/impl/pokemon_fetcher_impl.dart';
import 'firebase_options.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final remoteConfig = FirebaseRemoteConfig.instance;
  await remoteConfig.setConfigSettings(RemoteConfigSettings(
    fetchTimeout: const Duration(minutes: 1),
    minimumFetchInterval: const Duration(hours: 1),
  ));

  // Database database = await openDatabase(
  //     'pokemons_database.db',
  //     version: 1,
  //     onCreate: (Database db, int version) async {
  //       await db.execute(
  //           'CREATE TABLE pokemons(id INTEGER PRIMARY KEY, name TEXT, imagePath TEXT)');
  //     });

  var database = await PokemonDatabaseProviderImpl().open();

  final useCases = ListUseCases(
    GetPokemonsUseCase(
      PokemonRepositoryImpl(
        remoteStorage: RemoteStorageImpl(remoteConfig),
        localStorage: LocalStorageImpl(
          database: database,
          pokemonCacheManager: PokemonCacheManagerImpl(),
        ),
        pokemonApiService: PokemonApiServiceImpl(
            PokemonFetcherImpl()
        ),
      ),
    ),
  );

  runApp(MyApp(useCases, database));
}

class MyApp extends StatefulWidget {
  const MyApp(this.useCases, this.database, {super.key});

  final ListUseCases useCases;
  final PokemonDatabase database;

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }

}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => ListScreen(widget.useCases),
        '/info': (context) => const InfoScreen(),
      },
    );
  }

  @override
  void dispose() {
    widget.database.close();
    super.dispose();
  }
}



