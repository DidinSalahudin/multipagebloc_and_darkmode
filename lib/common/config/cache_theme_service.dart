import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

const CHACHED_THEME_SERVICE = 'DARK_THEME';

abstract class CacheThemeService {
  bool getCacheTheme();
  Future<void> updateCacheTheme(bool isDarkTheme);
}

@LazySingleton(as: CacheThemeService)
class CacheThemeServiceImpl implements CacheThemeService {
  final SharedPreferences _preferences;

  CacheThemeServiceImpl(
    this._preferences,
  );

  @override
  bool getCacheTheme() {
    final bool? value = _preferences.getBool(CHACHED_THEME_SERVICE);
    print(value);
    if (value == true) {
      print('a');
      return value!;
      // return false;
    } else {
      print('b');
      return false;
    }
  }

  @override
  Future<void> updateCacheTheme(bool isDarkTheme) {
    return _preferences.setBool(
      CHACHED_THEME_SERVICE,
      isDarkTheme,
    );
  }
}
