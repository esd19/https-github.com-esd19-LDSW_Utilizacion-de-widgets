import 'package:flutter/material.dart';
  final directorController = TextEditingController();
  final genreController = TextEditingController();
  final synopsisController = TextEditingController();
  final imageController = TextEditingController();

  Future<void> addMovie() async {
    await FirebaseFirestore.instance.collection('movies').add({
      'title': titleController.text,
      'year': yearController.text,
      'director': directorController.text,
      'genre': genreController.text,
      'synopsis': synopsisController.text,
      'image': imageController.text,
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Película agregada'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Administración'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: 'Título',
              ),
            ),

            TextField(
              controller: yearController,
              decoration: const InputDecoration(
                labelText: 'Año',
              ),
            ),

            TextField(
              controller: directorController,
              decoration: const InputDecoration(
                labelText: 'Director',
              ),
            ),

            TextField(
              controller: genreController,
              decoration: const InputDecoration(
                labelText: 'Género',
              ),
            ),

            TextField(
              controller: synopsisController,
              decoration: const InputDecoration(
                labelText: 'Sinopsis',
              ),
              maxLines: 4,
            ),

            TextField(
              controller: imageController,
              decoration: const InputDecoration(
                labelText: 'URL de imagen',
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: addMovie,
              child: const Text('Guardar película'),
            ),
          ],
        ),
      ),
    );
  }
}