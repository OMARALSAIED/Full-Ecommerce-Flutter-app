import 'package:get_storage/get_storage.dart';

class TLocalStorage {
  
static TLocalStorage? _instance;
late  final GetStorage _storage ;
  TLocalStorage._internal(); // Private constructor


  factory TLocalStorage.instance() {
     _instance ??=TLocalStorage._internal();
     return _instance!;
  }


 static Future<void> init(String bucktName)async
 {
    await GetStorage.init(bucktName);
    _instance=TLocalStorage._internal();
    _instance!._storage=GetStorage(bucktName);
 }




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
