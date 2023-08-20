import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:pokedex/data/repository/remote_storage/remote_storage.dart';

class RemoteStorageImpl extends RemoteStorage {
  RemoteStorageImpl(FirebaseRemoteConfig remoteConfig) {
    _remoteConfig = remoteConfig;
  }

  late FirebaseRemoteConfig _remoteConfig;

  @override
  Future<int> getCount() async {
    final defaults = <String, dynamic>{
      'count_value': 0,
    };

    await _remoteConfig.setDefaults(defaults);
    await _remoteConfig.fetchAndActivate();

    return _remoteConfig.getInt('count_value');
  }
}