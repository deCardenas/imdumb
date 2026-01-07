import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:imdumb/core/services/remote_config_keys.dart'
    show RemoteConfigKeys;

final class RemoteConfigService {
  RemoteConfigService._();

  static final RemoteConfigService _instance = RemoteConfigService._();

  static RemoteConfigService get instance => _instance;

  late final FirebaseRemoteConfig _remoteConfig;

  /// Inicializa Remote Config
  Future<void> init() async {
    _remoteConfig = FirebaseRemoteConfig.instance;

    await _remoteConfig.setConfigSettings(
      RemoteConfigSettings(
        fetchTimeout: const Duration(seconds: 10),
        minimumFetchInterval: Duration.zero,
      ),
    );

    await _remoteConfig.setDefaults({
      RemoteConfigKeys.moviesDefaultLayout: 'horizontal',
      RemoteConfigKeys.moviesDefaultList: 'popular',
    });

    await _remoteConfig.fetchAndActivate();
  }

  // =====================
  // Getters tipados
  // =====================

  String get theMovieDbApiKey =>
      _remoteConfig.getString(RemoteConfigKeys.theMovieDbApiKey);

  String get moviesDefaultLayout =>
      _remoteConfig.getString(RemoteConfigKeys.moviesDefaultLayout);
  String get moviesDefaultList =>
      _remoteConfig.getString(RemoteConfigKeys.moviesDefaultList);
}
