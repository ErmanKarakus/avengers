import 'package:avengers/model/comic_model.dart';
import 'package:avengers/service/marvel_service.dart';
import 'package:avengers/view/widgets/pop_up_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ComicProvider extends ChangeNotifier {
  final MarvelService _service = MarvelService();
  List<ComicModel> list = [];
  bool isLoading = true;

  Future<void> fetchData({required BuildContext context, required int characterId}) async {
    var client = http.Client();
    var response = await _service.getComics(client: client, characterId: characterId);
    if (response.successful) {
      if (response.data != null) {
        list.clear();
        list.addAll(response.data!.data.results);
      }
    } else if (!response.internetStatus) {
      PopUpWidget.noInternetToast(context);
    } else {
      PopUpWidget.alertDialog(context, "Error", response.message!);
    }
    isLoading = false;
    notifyListeners();
  }

  void setIsLoading(BuildContext ctx){
    isLoading = true;
    Navigator.pop(ctx);
    notifyListeners();
  }
}