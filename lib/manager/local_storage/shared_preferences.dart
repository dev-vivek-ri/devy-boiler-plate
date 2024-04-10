import 'package:shared_preferences/shared_preferences.dart';

enum Store { isLogin, versionCheck, accessToken, user, brightnesMode, feature }

class SharedPreferencesManager {
   final Future<SharedPreferences> _prefs =
      SharedPreferences.getInstance();

   getSharedPreferencesGetInstance() async {
    return await _prefs;
  }

  static String getStoreKey(Store key) {
    switch (key) {
      case Store.isLogin:
        return 'is_login';
      case Store.versionCheck:
        return 'version_check';
      case Store.accessToken:
        return 'access_token';
       case Store.user:
        return 'user';
      case Store.brightnesMode:
        return 'brightnes_mode';
      case Store.feature:
        return 'feature';
    }
  }

   Future<String> getValue(Store key) async {
    final SharedPreferences prefs = await _prefs;
    return (prefs.getString(getStoreKey(key)).toString());
  }

   void setValue(Store key, String value) async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setString(getStoreKey(key), value);
  }

   void clearPreference() async {
    final SharedPreferences prefs = await _prefs;
    prefs.clear();
    SharedPreferencesManager().setValue(Store.versionCheck, "3.0.7");
  }
}
