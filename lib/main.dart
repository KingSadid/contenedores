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
      title: 'Flutter Layout Demo',
      home: Scaffold(
        body: ListView(
          children: [
            
            Image.asset(
              'assets/Suiza-Montañas.jpg', 
              width: 600,
              height: 240,
              fit: BoxFit.cover,
            ),

            Padding(
              padding: const EdgeInsets.all(32),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Oeschinen Lake Campground',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Kandersteg, Switzerland',
                          style: TextStyle(
                            color: Colors.grey[500],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(Icons.star, color: Colors.red[500]),
                  const Text('41'),
                ],
              ),
            ),

            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _BotonIcono(icon: Icons.call, label: 'CALL'),
                _BotonIcono(icon: Icons.near_me, label: 'ROUTE'),
                _BotonIcono(icon: Icons.share, label: 'SHARE'),
              ],
            ),

            const Padding(
              padding: EdgeInsets.all(32),
              child: Text(
                'Lake Oeschinen lies at the foot of the Blüemlisalp. Situated 1,578 meter above sea level, it is one of the larger Alpine Lakes. A gondola train leads from Kandersteg to a location near the lake. A half-hour walk across pastures and through pine forest takes you to the lake. The water in the lake warms up to 20 degree Celsius in the summer. Activities enjoyed here include rowing or riding on the summer toboggan run.',
                softWrap: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BotonIcono extends StatelessWidget {
  final IconData icon;
  final String label;

  const _BotonIcono({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    Color color = Colors.blue;

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        const SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: color,
          ),
        ),
      ],
    );
  }
}