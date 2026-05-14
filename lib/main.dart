import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const CineVerseApp());
}

Future<Map<String, dynamic>> obtenerPokemon() async {
  final response = await http.get(
    Uri.parse('https://pokeapi.co/api/v2/pokemon/pikachu'),
  );

  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    throw Exception('Error al cargar datos');
  }
}

class CineVerseApp extends StatelessWidget {
  const CineVerseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CineVerse',
      home: Scaffold(
        body: Stack(
          children: [

            // Imagen de fondo
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    'https://images.unsplash.com/photo-1489599849927-2ee91cede3ba',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // Capa oscura
            Container(
              color: Colors.black.withOpacity(0.6),
            ),

            // Contenido
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  const Text(
                    'Bienvenido a',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                    ),
                  ),

                  const SizedBox(height: 10),

                  const Text(
                    'CineVerse',
                    style: TextStyle(
                      color: Colors.amber,
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    'Tu catálogo de películas',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 18,
                    ),
                  ),

                  const SizedBox(height: 40),

                  // 🔥 AQUÍ VA EL HTTP
                  FutureBuilder(
                    future: obtenerPokemon(),
                    builder: (context, snapshot) {

                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator(color: Colors.white);
                      }

                      if (snapshot.hasError) {
                        return const Text(
                          'Error al cargar datos',
                          style: TextStyle(color: Colors.white),
                        );
                      }

                      final data = snapshot.data!;

                      return Column(
                        children: [
                          Text(
                            data['name'].toUpperCase(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Image.network(
                            data['sprites']['front_default'],
                            width: 120,
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}