import 'package:flutter/material.dart';
import 'package:flutter_app_pokedex/controllers/poke_api.dart';
import 'package:flutter_app_pokedex/models/pokemon.dart';
import 'package:flutter_app_pokedex/models/pokemon_verify.dart';

class HomeView extends StatefulWidget {
  // const HomeView({super.key});
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  // variavel API
  final PokeApi api = PokeApi();
  // variavel verificar
  late PokemonVerify pokeVerify = PokemonVerify(pokemon: []);

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  Future<PokemonVerify?> fetchData() async {
    try {
      PokemonVerify data = await api.fetchData();
      setState(() {
        pokeVerify = data;
      });
    } catch (e) {
      print("erro nos dados $e");
    }
    return null;
  }

  Widget buildPokedex() {
    return pokeVerify.pokemon!.isEmpty
        ? Center(child: CircularProgressIndicator())
        : ListView.builder(
            itemCount: pokeVerify.pokemon?.length,
            itemBuilder: (context, index) {
              final poke = pokeVerify.pokemon?[index];
              return buildPokemon(poke!);
            });
  }

  Widget buildPokemon(Pokemon poke) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: InkWell(
        onTap: () {},
        child: Hero(
            tag: poke.imagem!,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              elevation: 3.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 100.0,
                    width: 100.0,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: NetworkImage(poke.imagem!, scale: 1),
                    )),
                  ),
                  Text(
                    poke.nome!,
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: AppBar(
            title: Text('title'),
            backgroundColor: Colors.blueAccent,
            actions: [],
          )),
      body: buildPokedex(),
      drawer: Drawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: fetchData,
        backgroundColor: Colors.redAccent,
        child: Icon(Icons.refresh),
      ),
    );
  }
}
