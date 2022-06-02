import 'package:avengers/view_model/home_vm.dart';
import 'package:avengers/view_model/splash_vm.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class ProviderConst{
  static List<SingleChildWidget> providers = [
    ChangeNotifierProvider(create: (context) => SplashProvider()),
    ChangeNotifierProvider(create: (context) => HomeProvider()),
  ];
}