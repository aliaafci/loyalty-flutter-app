import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

export 'local_storage_keys.dart';

class LocalStorage {
  static LocalStorage _instance = new LocalStorage.internal();

  SharedPreferences _sharedPreferencesInstance;

  LocalStorage.internal() {
//   Initialization code for the singleton here
  }

  factory LocalStorage() => _instance;

  initialize() async {
    if (_sharedPreferencesInstance == null) {
      _sharedPreferencesInstance = await SharedPreferences.getInstance();
    }
    return _sharedPreferencesInstance;
  }

  getString(String key) async {
    String value =  _sharedPreferencesInstance.getString(key);
    debugPrint("LocalStorage-getString: $key  -- $value");
    return value;
  }

  setString(String key, String value) async {
    bool status = await _sharedPreferencesInstance.setString(key, value);
    debugPrint("LocalStorage-setString: $key  -- $value");
    return status;
  }

  remove(String key) async {
    return await _sharedPreferencesInstance.remove(key);
  }
}
