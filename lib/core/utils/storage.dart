import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:quick_chat/core/constants/storage_keys.dart';

class Storage {
  static final Storage _instance = Storage._();
  FlutterSecureStorage storage = const FlutterSecureStorage();
  late SharedPreferences prefs;

  Storage._();
  static Storage get instance => _instance;

  Future<void> initStorage() async {
    AndroidOptions getAndroidOptions() =>
        const AndroidOptions(encryptedSharedPreferences: true);

    storage = FlutterSecureStorage(aOptions: getAndroidOptions());

    prefs = await SharedPreferences.getInstance();
  }

  bool get isDarkMood => prefs.getBool(StorageKeys.isDarkMood) ?? true;

  set isDarkMood(bool isdarkmood) =>
      prefs.setBool(StorageKeys.isDarkMood, isdarkmood);
}
