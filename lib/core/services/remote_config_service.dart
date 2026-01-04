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
        minimumFetchInterval: const Duration(hours: 1),
      ),
    );

    await _remoteConfig.setDefaults({RemoteConfigKeys.splashSegDuration: 2});

    await _remoteConfig.fetchAndActivate();
  }

  // =====================
  // Getters tipados
  // =====================

  int get splashSegDuration =>
      _remoteConfig.getInt(RemoteConfigKeys.splashSegDuration);

  String get theMovieDbApiKey =>
      _remoteConfig.getString(RemoteConfigKeys.theMovieDbApiKey);
}
