import 'package:shared_preferences/shared_preferences.dart';

class LocalDataService {
  final SharedPreferences pref;
  LocalDataService(this.pref);

  Future<void> setBool({
    required String key,
    required bool value,
  }) async {
    await pref.setBool(key, value);
  }

  bool getBool({required String key}) {
    return pref.getBool(key) ?? false;
  }
}
