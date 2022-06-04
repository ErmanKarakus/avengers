import 'package:avengers/model/character_model.dart';
import 'package:avengers/view/widgets/app_widget.dart';
import 'package:avengers/view/widgets/character_detail/comic_list_widget.dart';
import 'package:avengers/view_model/character_detail_vm.dart';
import 'package:flutter/material.dart';

class CharacterDetailBodyView extends StatelessWidget {
  final CharacterModel data;
  final ComicProvider provider;
  const CharacterDetailBodyView({Key? key, required this.data, required this.provider}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Description
          _Description(data: data),
          // Comics
          _Comics(provider: provider)
        ],
      ),
    );
  }
}

class _Description extends StatelessWidget {
  final CharacterModel data;
  const _Description({Key? key,required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String description = data.description.isNotEmpty ? data.description : "No description";
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top:5),
              child: Text(
                  description,
                  style: TextStyle(
                      fontSize: Theme.of(context).textTheme.titleMedium?.fontSize,
                      color: description != "No description" ? Colors.deepPurple : Colors.grey)),
            ),
          ],
        ),
      ),
    );
  }
}

class _Comics extends StatelessWidget {
  final ComicProvider provider;
  const _Comics({Key? key,required this.provider}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(provider.isLoading){
      return AppWidget.dataLoading();
    }else if(provider.list.isNotEmpty){
      return Column(
        children: ComicListWiget.bringList(provider.list)
      );
    }else{
      return Container();
    }
  }
}