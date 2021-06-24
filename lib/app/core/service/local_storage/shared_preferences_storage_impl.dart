import 'package:app_client/app/core/service/local_storage/local_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesStorage implements LocalStorage {
  final SharedPreferences shared;

  SharedPreferencesStorage(this.shared);

  @override
  Future<void> clear() async {
    await shared.clear();
  }

  @override
  Future<bool> delete(String key) {
    return shared.remove(key);
  }

  @override
  Future get(String key) async {
    return shared.get(key);
  }

  @override
  Future<void> put(String key, dynamic value) {
    if (value is String) {
      return shared.setString(key, value);
    } else if (value is bool) {
      return shared.setBool(key, value);
    } else if (value is int) {
      return shared.setInt(key, value);
    } else if (value is double) {
      return shared.setDouble(key, value);
    } else if (value is List<String>) {
      return shared.setStringList(key, value);
    }
    throw Exception('Value type (${value.runtimeType}) not valid');
  }
}
