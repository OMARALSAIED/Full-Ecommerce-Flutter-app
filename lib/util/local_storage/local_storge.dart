import 'package:get_storage/get_storage.dart';

class TLocalStorage {
  static final TLocalStorage _instance = TLocalStorage._internal();

  factory TLocalStorage() {
    return _instance;
  }

  TLocalStorage._internal(); // Private constructor

  final GetStorage _storage = GetStorage();

  // Generic method to save data
  Future<void> saveData<T>(String key, T value) async {
    await _storage.write(key, value);
  }

  // Generic method to read data
  T? readData<T>(String key) {
    return _storage.read<T>(key);
  }

  // Remove data by key
  Future<void> removeData(String key) async {
    await _storage.remove(key);
  }

  // Clear all storage
  Future<void> clearAll() async {
    await _storage.erase();
  }
}
