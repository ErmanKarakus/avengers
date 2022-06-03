import 'package:avengers/const/app_const.dart';
import 'package:avengers/view_model/home_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home_listview.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeProvider>(context);
    final String appBarTitle = "${AppConst.appName}(${provider.list.length})";
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          title: Text(provider.list.isNotEmpty ? appBarTitle : AppConst.appName),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: BodyListView(provider: provider),
      ),
    );
  }

  @override
  void initState() {
    Provider.of<HomeProvider>(context,listen: false).fetchData(context: context);
    super.initState();
  }
}