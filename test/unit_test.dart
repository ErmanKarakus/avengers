import 'package:avengers/const/api_const.dart';
import 'package:avengers/model/character_model.dart';
import 'package:avengers/model/http_model.dart';
import 'package:avengers/service/marvel_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'unit_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  group('Service Test', () {
    final client = MockClient();
    final service = MarvelService();
    const String endPoint = "v1/public/characters";

    test('Get Characters True Response Model', () async {
      expect(await service.getCharacters(client: client, offset: 0), isA<HTTPModel<List<CharacterModel>>>());
    });

    test('Get Characters Bad Request', () async {
      Map<String, dynamic> queryParams = {
        "apikey": MarvelService.apiKey,
        "hash": MarvelService.hash,
        "ts": MarvelService.timestamp,
        "limit": "101",
        "offset": "0"
      };
      final uri = Uri.https(MarvelService.baseUrl, endPoint, queryParams);
      when(
      client.get(uri, headers: ApiConst.contentType)
      ).thenAnswer((_) async =>
          http.Response('{"code": "Status Code: 409", "description": "You may not request more than 100 items."}', 409));
      // Limit value changed to 101(cannot be higher than 10)
      // Data will be null
      var response = await service.getCharacters(client: client, offset: 0, limit: 101);
      expect(response.data, null);
    });
  });
}
