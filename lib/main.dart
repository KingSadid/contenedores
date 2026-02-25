import 'package:flutter/material.dart';

void main() {
  runApp(const MockupApp());
}

class MockupApp extends StatelessWidget {
  const MockupApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wireframe to UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF8F9FA),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black87),
          titleTextStyle: TextStyle(
            color: Colors.black87,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        // Definiendo estilos globales para mantener consistencia
        textTheme: const TextTheme(
          titleLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black87),
          bodyMedium: TextStyle(fontSize: 16, color: Colors.black54, height: 1.5),
        ),
      ),
      home: const ProductDetailsScreen(),
    );
  }
}

/// Pantalla principal que orquesta todos los componentes.
class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_outlined),
          onPressed: () => debugPrint('Back pressed'),
        ),
        title: const Text('Titulo'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.star_border_outlined, size: 28),
            onPressed: () => debugPrint('Favorite pressed'),
          ),
        ],
      ),
      // Uso Column con Expanded para empujar los botones al fondo 
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _ProductImage(),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _DescriptionSection(),
                  SizedBox(height: 32),
                  _IconSelector(),
                ],
              ),
            ),
          ),
          _BottomActionMenu(),
        ],
      ),
    );
  }
}

/// Componente encargado de mostrar la imagen.
class _ProductImage extends StatelessWidget {
  const _ProductImage();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
      child: Container(
        width: double.infinity,
        height: 250,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black12, width: 2),
        ),
        // Imagen aleatoria de Picsum Photos
        child: Image.network(
          'https://picsum.photos/seed/flutterUI/800/600',
          fit: BoxFit.cover,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return const Center(child: CircularProgressIndicator());
          },
          errorBuilder: (context, error, stackTrace) => const Center(
            child: Icon(Icons.image_not_supported, color: Colors.grey, size: 50),
          ),
        ),
      ),
    );
  }
}

/// Componente que maneja los textos de descripción.
class _DescriptionSection extends StatelessWidget {
  const _DescriptionSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Description',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 12),
        Text(
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
          'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. '
          'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip.',
          style: Theme.of(context).textTheme.bodyMedium,
          textAlign: TextAlign.justify,
        ),
      ],
    );
  }
}

/// Componente personalizado de los iconos aleatorios.
class _IconSelector extends StatelessWidget {
  const _IconSelector();

  @override
  Widget build(BuildContext context) {
    // Lista de iconos aleatorios
    final List<IconData> displayIcons = [
      Icons.ac_unit,             // ❄️
      Icons.local_fire_department, // 🔥
      Icons.water_drop_outlined,   // 💧
      Icons.air,                   // 🌪️
    ];

    return Row(
      children: [
        Text(
          'Icons:',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 18),
        ),
        const SizedBox(width: 16),
        // Generamos dinámicamente los botones basados en la lista
        ...displayIcons.map((icon) => Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: _IconOption(icon: icon),
            )),
      ],
    );
  }
}

/// Widget helper para mantener la UI de cada opción de icono consistente.
class _IconOption extends StatelessWidget {
  final IconData icon;

  const _IconOption({required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.black87, width: 1.5),
      ),
      child: Icon(icon, size: 20, color: Colors.black87),
    );
  }
}

/// Componente inferior para las llamadas a la acción (Botones).
class _BottomActionMenu extends StatelessWidget {
  const _BottomActionMenu();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: () => debugPrint('Add to Cart pressed'),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  side: const BorderSide(color: Colors.black87, width: 1.5),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero, // Bordes cuadrados como en el sketch
                  ),
                ),
                child: const Text(
                  'Add to Cart',
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black87, width: 1.5),
              ),
              child: IconButton(
                icon: const Icon(Icons.favorite_border),
                onPressed: () => debugPrint('Like pressed'),
                color: Colors.black87,
                padding: const EdgeInsets.all(12),
                constraints: const BoxConstraints(), // Quita restricciones por defecto
              ),
            ),
          ],
        ),
      ),
    );
  }
}