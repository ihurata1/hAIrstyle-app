// ignore_for_file: unnecessary_new

import 'package:flutter/material.dart';

class Application {
  static GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();
  static int versionCode = 0; //Updated from env.json file.
  static String versionName = ""; //Updated from env.json file.
  static String name = "boilerplate"; //Updated from env.json file.
  static String apiKey = "rnyz9YfaQQ8Sxq3pwkNURwHL5D73liNvmyOztHCVCsXVgId1hAKIhfXi2bJn6Dju";
  static String apiBaseUrl = "https://www.ailabapi.com";

  ///Updated from env.json file.

  static get context => navigatorKey.currentContext;
}
