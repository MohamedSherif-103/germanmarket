import 'package:shared_preferences/shared_preferences.dart';

class CacheNetwork {
  static late SharedPreferences sharedPref;
  // بعمل instance من ال sharedPrefernce
  static Future cacheInitialization() async {
    sharedPref = await SharedPreferences.getInstance();
  }
  // set  - get - delete - clear

  static Future<bool> insertToCash(
      {required String key, required String value}) async {
    return await sharedPref.setString(key, value);
  }

  static String getCacheData({required String key}) {
    return sharedPref.getString(key) ?? '';
  }

  static Future<bool> deleteCashItem({required String key}) async {
    return await sharedPref.remove(key);
  }
}
