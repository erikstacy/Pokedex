import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex/screens/pokemon_screen.dart';
import 'package:pokedex/services/models.dart';
import 'package:pokedex/services/string_extension.dart';

class MainScreen extends StatefulWidget {

  static String id = 'main_screen';

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  Future<List<Pokemon>> _getPokemon() async {
    var data = await http.get('https://pokedex-bb36f.firebaseio.com/pokemon.json');
    var jsonData = json.decode(data.body);

    List<Pokemon> pokemonList = [];
    for (var p in jsonData) {
      if (p != null) {
        Pokemon pokemon = Pokemon.fromJson(p);
        pokemonList.add(pokemon);
      }
    }

    print(pokemonList.length);
    return pokemonList;
  }

  @override
  void initState() {
    _getPokemon();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Pokedex'),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: SafeArea(
        child: FutureBuilder<List<Pokemon>>(
          future: _getPokemon(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            
            if (snapshot.data == null) {
              return Center(child: CircularProgressIndicator(),);
            } else {
              return Padding(
                padding: const EdgeInsets.all(10),
                child: GridView.count(
                  crossAxisCount: 3,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  children: List.generate(snapshot.data.length, (index) {
                    Pokemon poke = snapshot.data[index];
                    return GestureDetector(
                      onTap: () async {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => PokemonScreen(pokemon: poke),
                        ));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: <Widget>[
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(5),
                                child: Image(
                                  image: NetworkImage(poke.imageUrl),
                                ),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              height: 30,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
                              ),
                              child: Text(
                                poke.name.capitalize(),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}