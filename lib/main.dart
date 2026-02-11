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
          title: const Text('Ejemplo Columna y Fila'),
          backgroundColor: Colors.amber,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Moviles',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              
              const SizedBox(height: 20), 

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  
                  Icon(Icons.android, size: 50, color: Colors.green[700]),
                  
                  const SizedBox(width: 20), 

                  Icon(Icons.phone_iphone, size: 50, color: Colors.grey[800]),
                ],
              ),
              
              const SizedBox(height: 20), 

              Container(
                margin: const EdgeInsets.all(10.0),
                color: Colors.amber[600],
                width: 48.0,
                height: 48.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
