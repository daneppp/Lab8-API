// ignore_for_file: slash_for_doc_comments

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

/**
 * Name: Dane Patzlaff
 * Date: 10/22/25
 * Description: Welcome to the Pokemon Generator API. This tab lets users enter a pokemon's 
 * name as a String parameter into the textfield. If the name is valid, the user can click on the pokeball 
 * in the AppBar, and the app will fetch the pokemon's name, sprite, and type from 
 * the api and display those elements in a ListView. Once satisfied, users can clear their entry
 * using the recycling button in the AppBar.
 * 
 * Bugs: N/A
 * Reflection: Hardest part of the lab was parsing the pokemon api before using JSON. I originally wanted to get
 * more out of the fetch but I struggled with the more complicated parsing for my map, ie. abilities. I also needed help
 * rendering the pokemon's sprites properly, so I had AI help me with Image.network(dynamic obj, double? width, double height).
 * But doing work with futures again helped me immensely. I feel way better about the material now.
 */

class Pokemon extends StatefulWidget {
  const Pokemon({super.key});

  @override
  State<Pokemon> createState() => PokemonState();
}

class PokemonState extends State<Pokemon> {
  Future<Map<String, dynamic>>? newPoke;
  final TextEditingController textMe = TextEditingController();

  //Using a Future with a Map<String, dynamic> since we are only grabbing one pokemon
  //at a time
  Future<Map<String, dynamic>> catchPokemon(String name) async {
    final url = Uri.parse('https://pokeapi.co/api/v2/pokemon/$name');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      //response is good, continue with content from body
      return jsonDecode(response.body);
    } else {
      //Any other statusCode is deemed a fail and throws an Exception
      throw Exception("Failed to catch! Are you sure that's a pokemon?");
    }
  }

  /**
   * Reset the TextEditingController and reassign the newPoke to null
   */
  void clear() {
    setState(() {
      textMe.clear();
      newPoke = null;
    });
  }

  /**
   * Get the new pokemon's name in lowercase form
   */
  void fetchPoke() {
    setState(() {
      newPoke = catchPokemon(textMe.text.trim().toLowerCase());
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Who's that Pokémon?"),
          centerTitle: true,
          actions: [
            //Get new pokemon
            IconButton(
              icon: Image.asset(
                'assets/images/pokeballIcon.jpeg',
                height: 28,
                width: 28,
              ),
              tooltip: 'Catch a new Pokémon',
              onPressed: fetchPoke,
            ), //Clear the pokemon data
            IconButton(
              icon: const Icon(Icons.recycling),
              tooltip: 'Release the Pokémon, make room for new data',
              onPressed: clear,
            ),
          ],
        ),
        body: Column(
          children: [
            Padding(
              //Contains the TextEditController and its stylings
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                controller: textMe,
                decoration: const InputDecoration(
                  labelText: 'Name a Pokémon, any Pokémon',
                  border: OutlineInputBorder(),
                  labelStyle: TextStyle(
                    color: Color.fromRGBO(42, 4, 119, 0.69),
                    backgroundColor: Color.fromRGBO(11, 120, 209, 0.847),
                  ),
                ),
              ),
            ),
            Expanded(child: buildPokemon()),
          ],
        ),
      ),
    );
  }

  /**
   * Uses a FutureBuilder with a Map<String, dynamic> to fetch the pokemon's name, 
   * sprite, and type for display in a ListView.
   */
  Widget buildPokemon() {
    if (newPoke == null) {
      //Once cleared, take a new text input from user
      return const Center(child: Text('Enter a Pokémon'));
    }

    return FutureBuilder<Map<String, dynamic>>(
      future: newPoke,
      builder: (context, snapshot) {
        //Generate a loading indicator while waiting
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          //If the builder can't find the pokemon, display an error message
          return const Center(child: Text("Error: Couldn't load the Pokémon!"));
        } else if (!snapshot.hasData) {
          //If the data can't be collected, display an error message
          return const Center(
            child: Text('No data on pokemon inputted found.'),
          );
        } else {
          final data = snapshot.data!;

          //Get the name, sprite, and type
          final name = data['name'];
          final spriteUrl = data['sprites']['front_default'] ?? '';
          final types = (data['types'] as List)
              .map((t) => t['type']['name'])
              .join(', ');

          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              //Display the sprite
              if (spriteUrl.isNotEmpty)
                Center(
                  child: Image.network(spriteUrl, height: 150, width: 150),
                ),
              const SizedBox(height: 16),
              Center(
                //Display the name
                child: Text(
                  name.toString().toUpperCase(),
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Center(
                //Display the type
                child: Text(
                  'Type: $types',
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
