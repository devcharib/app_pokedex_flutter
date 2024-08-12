
//http adicionar no pubspec.yaml - dependencies
import 'package:http/http.dart' as http;
//decode JSON
import 'dart:convert';

import 'package:flutter_app_pokedex/models/pokemon_verify.dart';

class PokeApi {
  static const url =
      "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";

  Future<PokemonVerify> fetchData() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final decodedJson = jsonDecode(response.body);
        return PokemonVerify.fromJson(decodedJson);
      } else {
        throw Exception("Falha na API");
      }
    } catch (e) {
      throw Exception("falha nos dados: $e");
    }
  }
}
