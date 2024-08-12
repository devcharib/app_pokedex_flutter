import 'package:flutter_app_pokedex/models/pokemon.dart';

class PokemonVerify {
  //variavel
  List<Pokemon>? pokemon;
  //construtor
  PokemonVerify({this.pokemon});
  //metodos
  PokemonVerify.fromJson(Map<String, dynamic> json) {
    if (json['pokemon'] != null) {
      pokemon = <Pokemon>[];
      json['pokemon'].forEach((v) {
        pokemon!.add(new Pokemon.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.pokemon != null) {
      data['pokemon'] = this.pokemon!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
