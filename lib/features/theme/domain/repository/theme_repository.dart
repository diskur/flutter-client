import 'package:diskur/features/theme/data/theme_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeRepository {
  final SharedPreferences sharedPreferences;
  static const String themeKey = 'theme_key';
  static const String darkVal= 'dark';
  static const String lightVal= 'light';

  ThemeRepository({required this.sharedPreferences});

  Future saveTheme(ThemeData theme) async {
    var themeValue = theme.themeType == ThemeType.dark ? darkVal : lightVal;
    await sharedPreferences.setString(themeKey, themeValue);
  }

  Future<ThemeData> getTheme() async {
    var themeValue = sharedPreferences.getString(themeKey);
    if (themeValue == darkVal) {
      return ThemeData(themeType: ThemeType.dark);
    }
    return ThemeData(themeType: ThemeType.light);
  }
}