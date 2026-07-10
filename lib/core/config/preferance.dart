import 'package:shared_preferences/shared_preferences.dart';

/// Shared Preferences is the way in which one can store and retrieve small
/// amounts of primitive dataas key/value pairs to a file on the device
class SharedPref {
  late SharedPreferences _preferences;
  static SharedPref? sharedPref;

  Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
    sharedPref = this;
    return;
  }

  static SharedPref? getInstance() {
    return sharedPref;
  }

  //Set bool to shared preferance
  Future<void> setBool({required String key, required bool value}) async {
    await _preferences.setBool(key, value);
  }

  //Get bool from shared preferance
  bool getBool(String key) {
    return _preferences.getBool(key) ?? false;
  }

  //Remove preferance
  Future<void> removeSharedPreferance(String key) async {
    await _preferences.remove(key);
  }

  //Clear shared preferance
  void clear() {
    _preferences.clear();
  }
}
