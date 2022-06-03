import 'package:avengers/const/app_const.dart';
import 'package:avengers/model/character_model.dart';
import 'package:avengers/view/screens/character_detail/character_detail_body.dart';
import 'package:avengers/view_model/character_detail_vm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CharacterDetailView extends StatefulWidget {
  final CharacterModel data;
  const CharacterDetailView({Key? key,required this.data}) : super(key: key);

  @override
  State<CharacterDetailView> createState() => _CharacterDetailViewState();
}

class _CharacterDetailViewState extends State<CharacterDetailView> {
  final scaffoldColor = Colors.blue.shade200;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ComicProvider>(context);
    return Scaffold(
      backgroundColor: scaffoldColor,
      appBar: AppBar(
        title: const Text("Character Details"),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () => provider.setIsLoading(context),
          icon: Icon(AppConst.isAndroid ? Icons.arrow_back : CupertinoIcons.back),
        ),
      ),
      body: CharacterDetailBodyView(provider: provider, data: widget.data),
    );
  }

  @override
  void initState() {
    Provider.of<ComicProvider>(context,listen: false).fetchData(context: context,characterId: widget.data.id);
    super.initState();
  }
}
