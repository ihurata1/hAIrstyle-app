import 'package:boilerplate/helpers/app_helper/app_preferences.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppHelper {
  static initialize() async {
    WidgetsFlutterBinding.ensureInitialized();

    await AppPreferences().initialize();
  }
}
