import 'package:avengers/const/app_const.dart';
import 'package:avengers/model/character_model.dart';
import 'package:avengers/view/screens/character_detail/character_detail_body.dart';
import 'package:avengers/view/widgets/character_detail/app_bar_content.dart';
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
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: scaffoldColor,
      body: CustomScrollView(slivers: <Widget>[
        SliverAppBar(
          automaticallyImplyLeading: false,
          leading: Padding(
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: CircleAvatar(
              backgroundColor: Colors.black26,
              child: IconButton(
                onPressed: () => provider.setIsLoading(context),
                icon: Icon(AppConst.isAndroid ? Icons.arrow_back : CupertinoIcons.back),
              ),
            ),
          ),
          expandedHeight: size.height*0.4,
          pinned: true,
          floating: false,
          snap: false,
          flexibleSpace: CharacterDetailAppBarContentWidget(data: widget.data,size: size),
          backgroundColor: Colors.black12,
        ),
        SliverList(
            delegate: SliverChildListDelegate(
              <Widget>[
                CharacterDetailBodyView(provider: provider, data: widget.data)
              ],
            ))
      ]),
    );
  }

  @override
  void initState() {
    Provider.of<ComicProvider>(context,listen: false).fetchData(context: context,characterId: widget.data.id);
    super.initState();
  }
}
