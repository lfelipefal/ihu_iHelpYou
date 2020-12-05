import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mktp_service/screens/home_screen.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

class SplashIhuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      duration: 1500,
      splash: Image.asset('assets/ihu.png'),
      splashIconSize: 500.0,
      centered: true,
      nextScreen: HomeScreen(),
      backgroundColor: Colors.white,
      splashTransition: SplashTransition.fadeTransition,
    );
  }
}
