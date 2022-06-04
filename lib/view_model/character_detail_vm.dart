import 'package:avengers/model/comic_model.dart';
import 'package:avengers/service/marvel_service.dart';
import 'package:avengers/view/widgets/pop_up_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ComicProvider extends ChangeNotifier {
  final MarvelService _service = MarvelService();
  List<ComicModel> _list = [];
  List<ComicModel> get list => _list;
  bool _isLoading = true;
  bool get isLoading => _isLoading;

  Future<void> fetchData({required BuildContext context, required int characterId}) async {
    var client = http.Client();
    var response = await _service.getComics(client: client, characterId: characterId);
    if (response.successful) {
      if (response.data != null && response.data!.isNotEmpty) {
        _list.addAll(response.data!);
      }
    } else if (!response.internetStatus) {
      PopUpWidget.noInternetToast(context);
    } else {
      PopUpWidget.alertDialog(context, "Error", response.message!);
    }
    _isLoading = false;
    notifyListeners();
  }

  void resetData(BuildContext ctx){
    _isLoading = true;
    _list.clear();
    notifyListeners();
  }
}