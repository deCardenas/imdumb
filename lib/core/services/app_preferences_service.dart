import 'package:shared_preferences/shared_preferences.dart';

final class AppPreferencesService {
  static const movieLayoutKey = 'movie_layout';
  static const movieListKey = 'movie_list';

  AppPreferencesService._();

  static final AppPreferencesService _instance = AppPreferencesService._();

  static AppPreferencesService get instance => _instance;

  late final SharedPreferences _preferences;

  /// Inicializa Remote Config
  Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  String? get movieLayout => _preferences.getString(movieLayoutKey);
  set movieLayout(String value) =>
      _preferences.setString(movieLayoutKey, value);

  String? get movieList => _preferences.getString(movieListKey);
  set movieList(String value) => _preferences.setString(movieListKey, value);
}
