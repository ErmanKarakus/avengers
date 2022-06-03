import 'dart:io';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppConst{
  static const String appName = "Avengers";
  static final bool isAndroid = Platform.isAndroid ? true : false;

  static double sizeHeight(BuildContext context) {
    var a = MediaQuery.of(context).size.height - AppBar(title: const Text("Void")).preferredSize.height - MediaQuery.of(context).padding.top;
    return a;
  }

  static double sizeWidth(BuildContext context) {
    var a = MediaQuery.of(context).size.width;
    return a;
  }

  static String dateTimeFormatter(DateTime dateTime){
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String formatted = formatter.format(dateTime);
    return formatted;
  }
}