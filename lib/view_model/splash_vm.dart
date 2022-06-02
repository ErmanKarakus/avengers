import 'dart:async';
import 'package:avengers/const/router_const.dart';
import 'package:flutter/material.dart';

class SplashProvider extends ChangeNotifier {
  Future<void> initSplash({required BuildContext context})async{
    int counter = 0;
    Duration oneSec = const Duration(seconds: 1);
    Timer.periodic(oneSec, (Timer timer) {
      if (counter >= 2) {
        timer.cancel();
        Navigator.pushNamed(context, RouterAddress.home);
      } else {
        counter++;
      }
    }
    );
  }
}