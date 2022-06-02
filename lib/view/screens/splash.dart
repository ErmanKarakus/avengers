import 'package:avengers/view_model/splash_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(child: Image.asset("assets/images/logo.png")),
      ),
    );
  }

  @override
  void initState() {
    Provider.of<SplashProvider>(context,listen: false).initSplash(context: context);
    super.initState();
  }
}
