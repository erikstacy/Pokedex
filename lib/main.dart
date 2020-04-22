import 'package:flutter/material.dart';
import 'package:pokedex/screens/main_screen.dart';
import 'package:pokedex/screens/pokemon_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokedex',
      initialRoute: MainScreen.id,
      routes: {
        MainScreen.id: (context) => MainScreen(),
        PokemonScreen.id: (context) => PokemonScreen(),
      },
    );
  }
}