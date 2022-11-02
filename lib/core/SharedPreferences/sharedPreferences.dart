import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesClass
{
  static late SharedPreferences _sharedPreferences;
  static String key="THEME";

  static Future init()
  async
  {
    _sharedPreferences=await SharedPreferences.getInstance();
  }
  static Future SetTheme(bool theme)
  async
  {
    await _sharedPreferences.setBool(key, theme);
  }
 static bool? GetTheme()
  
  {
    return _sharedPreferences.getBool(key);
  }

}
