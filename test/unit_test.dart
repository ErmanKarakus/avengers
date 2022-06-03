import 'package:avengers/model/character_model.dart';
import 'package:avengers/model/http_model.dart';
import 'package:avengers/service/marvel_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'unit_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  group('Service Test', () {
    test('Get Characters', () async {
      final client = MockClient();
      final service = MarvelService();

      expect(await service.getCharacters(client: client, offset: 0), isA<HTTPModel<CharacterDataWrapper>>());
    });
  });
}
