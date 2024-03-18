import 'dart:math';

import 'package:flutter/material.dart';
import 'package:boilerplate/constants/app.dart';

class DeviceInfo {
  double screenWidth = MediaQuery.of(Application.context).size.width;
  static double screenHeight = MediaQuery.of(Application.context).size.height;
  double safeAreaHorizontal = MediaQuery.of(Application.context).padding.horizontal;
  static double safeAreaVertical = MediaQuery.of(Application.context).padding.vertical;

  // Güvenli alan boyutunu hesapla

  static MediaQueryData get mediaQuery => MediaQuery.of(Application.context);

  static get bottomPadding => max(DeviceInfo.mediaQuery.viewPadding.bottom, DeviceInfo.height(1.5));

  static double width(double width) {
    return MediaQuery.of(Application.context).size.width / 100.0 * width;
  }

  static double heightSafeAreaFree(double height) {
    return MediaQuery.of(Application.context).size.height / 100.0 * height;
  }

  static double height(double height) {
    return (MediaQuery.of(Application.context).size.height * ((screenHeight - safeAreaVertical) / screenHeight)) / 100.0 * height;
  }
}
