import 'package:avengers/view/screens/home/home.dart';
import 'package:avengers/view/screens/splash.dart';
import 'package:flutter/material.dart';

class RouterController{
  static dynamic routes() => {
    RouterAddress.splash: (BuildContext context) => const SplashView(),
    RouterAddress.home: (BuildContext context) => const HomeView(),
  };
}

class RouterAddress{
  static const String splash = '/';
  static const String home = '/home';
}