import 'package:avengers/model/character_model.dart';
import 'package:avengers/service/marvel_service.dart';
import 'package:avengers/view/widgets/pop_up_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeProvider extends ChangeNotifier {
  final MarvelService _service = MarvelService();
  List<CharacterModel> list = [];
  late List<CharacterModel> _list;
  int _i = 0; // Last index of list
  bool isLoading = true;
  bool isDone = false;

  Future<void> fetchData({required BuildContext context}) async {
    var client = http.Client();
    var response = await _service.getCharacters(client: client, limit: "99");
    if (response.successful) {
      if (response.data != null) {
        _list = response.data!.data.results;
        for (_i; _i < 30; _i++) {
          list.add(_list[_i]);
        }
        print(_i);
      }
    } else if (!response.internetStatus) {
      PopUpWidget.noInternetToast(context);
    } else {
      PopUpWidget.alertDialog(context, "Error", response.message!);
    }
    isLoading = false;
    notifyListeners();
  }

  Future<void> reloadData()async{
    int i = _i+30;
    if(_list.length-1>i){
      while(_i<i){
        list.add(_list[_i]);
        _i++;
      }
      print(_i);
    }else{
      isDone = true;
    }
    notifyListeners();
  }
}
