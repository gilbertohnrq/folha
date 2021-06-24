abstract class LocalStorage {
  Future<dynamic> get(String key);
  Future<void> put(String key, dynamic value);
  Future<bool> delete(String key);
  Future<void> clear();
}
