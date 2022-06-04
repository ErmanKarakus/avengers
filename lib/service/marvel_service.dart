import 'dart:convert';
import 'dart:io';
import 'package:avengers/const/api_const.dart';
import 'package:avengers/const/app_const.dart';
import 'package:avengers/model/character_model.dart';
import 'package:avengers/model/comic_model.dart';
import 'package:avengers/model/error_model.dart';
import 'package:crypto/crypto.dart';
import '../model/http_model.dart';

class MarvelService{
  static const baseUrl = "gateway.marvel.com";
  static const String apiKey = "395c84b7e97e4a6a141e834a9ec6d5dd";
  static const String privateKey = "312811f5c825ada78298441518eafba463561eb0";
  static String timestamp = DateTime.now().millisecondsSinceEpoch.toString();
  static String hash = md5.convert(utf8.encode("$timestamp$privateKey$apiKey")).toString();

  Future<HTTPModel<List<CharacterModel>>> getCharacters({required client, required int offset, int? limit}) async {
    try {
      const String endPoint = "v1/public/characters";
      Map<String, dynamic> queryParams = {
        "apikey": apiKey,
        "hash": hash,
        "ts": timestamp,
        "limit": "${limit ?? 30}",
        "offset": "$offset"
      };
      final uri = Uri.https(baseUrl, endPoint, queryParams);
      final response = await client.get(uri, headers: ApiConst.contentType);
      int code = response.statusCode;
      if (code == 200) {
        var data = CharacterDataWrapper.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
        return HTTPModel(data: data.data.results, successful: true);
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

  Future<HTTPModel<List<ComicModel>>> getComics({required client, required int characterId}) async {
    try {
      String endPoint = "v1/public/characters/$characterId/comics";
      String now = AppConst.dateTimeFormatter(DateTime.now());
      Map<String, dynamic> queryParams = {
        "apikey": apiKey,
        "hash": hash,
        "ts": timestamp,
        "limit": "10",
        "characterId": "$characterId",
        "dateRange": "2005-01-01,$now",
        "orderBy": "-onsaleDate"
      };
      final uri = Uri.https(baseUrl, endPoint, queryParams);
      final response = await client.get(uri, headers: ApiConst.contentType);
      int? code = response.statusCode;
      if (code == 200) {
        var data = ComicDataWrapper.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
        return HTTPModel(data: data.data.results, successful: true);
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