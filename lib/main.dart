import 'package:flutter/material.dart';

void main() {
  runApp(const CineVerseApp());
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

            // Texto principal
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Bienvenido a',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'CineVerse',
                    style: TextStyle(
                      color: Colors.amber,
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Tu catálogo de películas',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 18,
                    ),
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