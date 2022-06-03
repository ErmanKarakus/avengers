import 'package:avengers/model/character_model.dart';
import 'package:avengers/service/marvel_service.dart';
import 'package:avengers/view/widgets/pop_up_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeProvider extends ChangeNotifier {
  final MarvelService _service = MarvelService();
  List<CharacterModel> list = [];
  bool isLoading = true;
  int _i = 0; // Last index of list

  Future<void> fetchData({required BuildContext context}) async {
    var client = http.Client();
    var response = await _service.getCharacters(client: client, offset: _i);
    if (response.successful) {
      if (response.data != null) {
        list.addAll(response.data!.data.results);
        _i+=30;
      }
    } else if (!response.internetStatus) {
      PopUpWidget.noInternetToast(context);
    } else {
      PopUpWidget.alertDialog(context, "Error", response.message!);
    }
    isLoading = false;
    notifyListeners();
  }
}
