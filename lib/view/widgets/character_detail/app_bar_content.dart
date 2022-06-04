import 'package:avengers/model/character_model.dart';
import 'package:flutter/material.dart';

class CharacterDetailAppBarContentWidget extends StatelessWidget {
  final CharacterModel data;
  final Size size;
  const CharacterDetailAppBarContentWidget({Key? key,required this.size,required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlexibleSpaceBar(
      background: Stack(
        children: [
          Image(
            image: NetworkImage(
                "${data.thumbnail.path}.${data.thumbnail.extension}"),
            width: size.width,
            height: size.height,
            fit: BoxFit.cover,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Card(
                color: Colors.white70,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(data.name,style: Theme.of(context).textTheme.headline6),
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}