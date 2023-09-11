import 'dart:convert' as convert;

import 'package:codigo5_provider/models/rick_and_morty_model.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  Future<List<Results>?> getCharacter() async {
    List<Results>? list = [];
    Uri uri = Uri.parse('https://rickandmortyapi.com/api/character');
    http.Response response = await http.get(uri);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      RickAndMortyModel rickAndMortyModel =
          RickAndMortyModel.fromJson(jsonResponse);

      list = rickAndMortyModel.results;
      return list;
    } else {
      return list;
    }
  }
}
