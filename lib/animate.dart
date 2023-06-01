import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:p/home.dart';
import 'package:p/login.dart';
class LogoAnimated extends StatelessWidget{
  const LogoAnimated({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Lottie.asset('images/scanlogo2.json'),
      nextScreen: login(),
      backgroundColor: Colors.blue.shade200,
      splashIconSize: 250,
      duration:5000 ,
    );
  }

}