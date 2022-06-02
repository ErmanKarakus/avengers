import 'package:avengers/const/app_const.dart';
import 'package:avengers/const/provider_const.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'const/router_const.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: ProviderConst.providers,
      child: MaterialApp(
        title: AppConst.appName,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: RouterAddress.splash,
        routes: RouterController.routes()
      ),
    );
  }
}