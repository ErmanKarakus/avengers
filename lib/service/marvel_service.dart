import 'dart:convert';
import 'dart:io';
import 'package:avengers/const/api_const.dart';
import 'package:avengers/model/character_model.dart';
import 'package:avengers/model/comic_model.dart';
import 'package:avengers/model/error_model.dart';
import 'package:crypto/crypto.dart';
import '../model/http_model.dart';

class MarvelService{
  final _baseUrl = "gateway.marvel.com";
  final String _apiKey = "395c84b7e97e4a6a141e834a9ec6d5dd";
  final String _privateKey = "312811f5c825ada78298441518eafba463561eb0";
  String timestamp = DateTime.now().millisecondsSinceEpoch.toString();

  Future<HTTPModel<CharacterDataWrapper>> getCharacters({required client, required int offset}) async {
    try {
      String hash = md5.convert(utf8.encode("$timestamp$_privateKey$_apiKey")).toString();
      const String endPoint = "v1/public/characters";
      Map<String, dynamic> queryParams = {
        "apikey": _apiKey,
        "hash": hash,
        "ts": timestamp,
        "limit": "30",
        "offset": "$offset"
      };
      final uri = Uri.https(_baseUrl, endPoint, queryParams);
      final response = await client.get(uri, headers: ApiConst.contentType);
      int code = response.statusCode;
      if (code == 200) {
        var data = CharacterDataWrapper.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
        return HTTPModel(data: data, successful: true);
      } else if(code == 401 || code == 403 || code == 405 || code == 409){
        var data = ErrorModel.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
        return HTTPModel(message: ApiConst.definedErrorMessage(data.code, data.description));
      } else {
        return HTTPModel(message: ApiConst.errorMessage(response.statusCode));
      }
    } on SocketException {
      return HTTPModel(internetStatus: false);
    } catch (e) {
      return HTTPModel(message: ApiConst.catchMessage(e: e, name: "MarvelService/getCharacters"));
    } finally {
      client.close();
    }
  }

  Future<HTTPModel<ComicDataWrapper>> getComics({required client, required int characterId}) async {
    try {
      Map<String, dynamic> queryParams = {
        "apikey": _apiKey,
        "ts": timestamp,
        "limit": "10",
        "characterId": "$characterId",
        "startYear": "2005",
      };
      String endPoint = "v1/public/characters/$characterId/comics";
      final uri = Uri.https(_baseUrl, endPoint, queryParams);
      final response = await client.get(uri, headers: ApiConst.contentType);
      int? code = response.statusCode;
      if (code == 200) {
        var data = ComicDataWrapper.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
        return HTTPModel(data: data, successful: true);
      } else if(code == 401 || code == 403 || code == 405 || code == 409){
        var data = ErrorModel.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
        return HTTPModel(message: ApiConst.definedErrorMessage(data.code, data.description));
      } else {
        return HTTPModel(message: ApiConst.errorMessage(response.statusCode));
      }
    } on SocketException {
      return HTTPModel(internetStatus: false);
    } catch (e) {
      return HTTPModel(message: ApiConst.catchMessage(e: e, name: "MarvelService/getComics"));
    } finally {
      client.close();
    }
  }
}