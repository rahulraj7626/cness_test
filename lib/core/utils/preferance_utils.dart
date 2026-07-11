import 'package:cness_test/core/config/preferance.dart';

///Class to handle simple persist data
class SharedUtils extends SharedPref {
  static SharedPref get _prefs => SharedPref.getInstance()!;

  ///Set is setIsLogin
  static Future<void> setIsLogin(bool value) async {
    await _prefs.setBool(key: SharedKeys.isLogin, value: value);
  }

  ///Clear preferance
  static void onLogout() {
    _prefs.clear();
  }

  ///GetsetIsLogin
  static bool get getLogin => _prefs.getBool(SharedKeys.isLogin);
}

///Shared keys
class SharedKeys {
  static const String isLogin = 'is_login';
}
