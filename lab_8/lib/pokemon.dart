import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

/**
 * Name: Dane Patzlaff
 * Date: 10/22/25
 * Description:
 * Bugs:
 * Reflection:
 */


class Pokemon extends StatefulWidget {
  const Pokemon({super.key});

  @override
  State<Pokemon> createState() => _PokemonState();
}

class _PokemonState extends State<Pokemon> {
  @override
  Widget build(BuildContext context) {

    return MaterialApp( 
      home: Scaffold(  
      appBar: AppBar(title: Text("Who's that pokemon?"), 
      centerTitle: true,
      actions: [
        // IconButton(const Icon(Icon.add(pokeball), icon: icon), 
      ]
      ),
      )
    );
  }
}
