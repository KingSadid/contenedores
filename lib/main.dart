import 'package:flutter/material.dart';

void main() {
  runApp(const MiAplicacion());
}

class MiAplicacion extends StatelessWidget {
  const MiAplicacion({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Imagen, Texto e Iconos'),
          backgroundColor: Colors.amber,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                'https://images.unsplash.com/photo-1512941937669-90a1b58e7e9c',
                height: 400,
                width: 400,
                fit: BoxFit.cover,
              ),

              const SizedBox(height: 20),

              const Text(
                'Móviles',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey,
                ),
              ),

              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.android, size: 50, color: Colors.green[700]),
                  const SizedBox(width: 30),
                  Icon(Icons.phone_iphone, size: 50, color: Colors.grey[800]),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
