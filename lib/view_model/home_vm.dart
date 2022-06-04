import 'package:avengers/model/character_model.dart';
import 'package:avengers/service/marvel_service.dart';
import 'package:avengers/view/widgets/pop_up_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeProvider extends ChangeNotifier {
  final MarvelService _service = MarvelService();
  List<CharacterModel> _list = [];
  List<CharacterModel> get list => _list;
  bool _isLoading = true;
  bool get isLoading => _isLoading;
  int _i = 0; // offset

  Future<void> fetchData({required BuildContext context}) async {
    var client = http.Client();
    var response = await _service.getCharacters(client: client, offset: _i);
    if (response.successful) {
      if (response.data != null && response.data!.isNotEmpty) {
        _list.addAll(response.data!);
        _i+=30;
      }
    } else if (!response.internetStatus) {
      PopUpWidget.noInternetToast(context);
    } else {
      PopUpWidget.alertDialog(context, "Error", response.message!);
    }
    _isLoading = false;
    notifyListeners();
  }
}
