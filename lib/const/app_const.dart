import 'dart:io';
import 'package:flutter/material.dart';

class AppConst{
  static const String appName = "Avengers";
  static final bool isAndroid = Platform.isAndroid ? true : false;

  double sizeHeight(BuildContext context) {
    var a = MediaQuery.of(context).size.height - AppBar(title: const Text("Void")).preferredSize.height - MediaQuery.of(context).padding.top;
    return a;
  }

  double sizeWidth(BuildContext context) {
    var a = MediaQuery.of(context).size.width;
    return a;
  }
}