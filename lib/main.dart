// ignore_for_file: must_be_immutable

import 'package:boilerplate/constants/app.dart';
import 'package:boilerplate/hairstyle/view/hairstyle_selector.dart';
import 'package:boilerplate/helpers/app_helper/app_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  await AppHelper.initialize();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      navigatorKey: Application.navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HairStyleSelectorScreen(),
    );
  }
}
