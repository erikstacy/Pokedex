import 'package:flutter/material.dart';
import 'package:pokedex/services/models.dart';
import 'package:pokedex/services/string_extension.dart';

class PokemonScreen extends StatefulWidget {

  static String id = 'pokemon_screen';

  final Pokemon pokemon;

  PokemonScreen({this.pokemon});

  @override
  _PokemonScreenState createState() => _PokemonScreenState();
}

class _PokemonScreenState extends State<PokemonScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(widget.pokemon.name.capitalize()),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Image(
                    image: NetworkImage(widget.pokemon.imageUrl),
                  ),
                ),
                SizedBox(height: 20,),
                Row(
                  children: <Widget>[
                    DataField(
                      field: 'ID',
                      value: widget.pokemon.id.toString(),
                    ),
                    DataField(
                      field: 'Type',
                      value: widget.pokemon.type,
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  children: <Widget>[
                    DataField(
                      field: 'Attack',
                      value: widget.pokemon.attack.toString(),
                    ),
                    DataField(
                      field: 'Defense',
                      value: widget.pokemon.defense.toString(),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  children: <Widget>[
                    DataField(
                      field: 'Height',
                      value: widget.pokemon.height.toString(),
                    ),
                    DataField(
                      field: 'Weight',
                      value: widget.pokemon.weight.toString(),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    widget.pokemon.description,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]
      ),
    );
  }
}

class DataField extends StatelessWidget {

  final String field;
  final String value;

  DataField({ this.field, this.value });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 30),
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              field,
              style: TextStyle(
                color: Colors.grey[600],
                letterSpacing: 1.5,
                fontSize: 14,
              ),
            ),
            Text(
              value.capitalize(),
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}