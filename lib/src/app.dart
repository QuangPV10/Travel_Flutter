import 'package:flutter/material.dart';
import 'package:travel_ui_200lab/src/constant/color_constant.dart';
import 'package:travel_ui_200lab/src/screens/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel App',
      theme: ThemeData(
          primaryColor: ColorPalette.primaryColor,
          scaffoldBackgroundColor: ColorPalette.backgroundScaffoldColor,
          backgroundColor: ColorPalette.backgroundScaffoldColor),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
