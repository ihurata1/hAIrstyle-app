import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {
  late SharedPreferences _preferences;

  // Singleton tasarım deseni uygulandı
  static final AppPreferences _instance = AppPreferences._internal();

  factory AppPreferences() {
    return _instance;
  }

  AppPreferences._internal();

  // SharedPreferences instance'ını oluştur
  Future<void> initialize() async {
    _preferences = await SharedPreferences.getInstance();
  }

  // Örneğin, bir veri okuma fonksiyonu
  String getString(String key, {String defaultValue = ""}) {
    return _preferences.getString(key) ?? defaultValue;
  }

  // Örneğin, bir veri yazma fonksiyonu
  Future<void> setString(String key, String value) async {
    await _preferences.setString(key, value);
  }
}
