import 'package:flutter/material.dart';
import 'package:travel_ui_200lab/src/constant/asset_constant.dart';
import 'package:travel_ui_200lab/src/helpers/image_helper.dart';
import 'package:travel_ui_200lab/src/helpers/local_storage_helper.dart';
import 'package:travel_ui_200lab/src/screens/bottom_bar.dart';
import 'package:travel_ui_200lab/src/screens/onboarding_scren.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    delayThreeSeconds();
  }

  void delayThreeSeconds() async {
    await Future.delayed(const Duration(seconds: 3));
    redirectOnboardingScreen();
  }

  void redirectOnboardingScreen() {
    final ignoreOnboardingScreen =
        LocalStoragehelper.getVaue('ignoreOnboardingScreen') as bool?;
    if (ignoreOnboardingScreen != null && ignoreOnboardingScreen) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const BottomBar()));
    } else {
      LocalStoragehelper.setValue('ignoreOnboardingScreen', true);
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const OnboardingScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Positioned.fill(
            child: ImageHelper.loadFormAsset(backgroundSplashImg,
                fit: BoxFit.fitWidth)),
        Positioned.fill(child: ImageHelper.loadFormAsset(circleImg))
      ],
    ));
  }
}
