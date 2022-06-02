import 'package:avengers/model/character_model.dart';
import 'package:flutter/material.dart';

class CharacterDetailView extends StatefulWidget {
  final CharacterModel data;
  const CharacterDetailView({Key? key,required this.data}) : super(key: key);

  @override
  State<CharacterDetailView> createState() => _CharacterDetailViewState();
}

class _CharacterDetailViewState extends State<CharacterDetailView> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
