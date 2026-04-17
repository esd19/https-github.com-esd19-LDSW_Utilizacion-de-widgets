import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Widgets Básicos',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('LDSW Widgets'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              // TEXT
              const Text(
                'Bienvenido a Flutter',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              // ROW
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.star),
                  SizedBox(width: 10),
                  Text('Row Widget'),
                  SizedBox(width: 10),
                  Icon(Icons.star),
                ],
              ),

              const SizedBox(height: 20),

              // STACK
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 120,
                    height: 120,
                    color: Colors.blue,
                  ),
                  Container(
                    width: 70,
                    height: 70,
                    color: Colors.orange,
                  ),
                  const Text(
                    'Stack',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // CONTAINER
              Container(
                padding: const EdgeInsets.all(15),
                color: Colors.green,
                child: const Text(
                  'Container Widget',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}