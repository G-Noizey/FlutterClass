import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: ExampleAlignments(),
          ),
        ),
      ),
    );
  }
}

class ExampleAlignments extends StatelessWidget {
  const ExampleAlignments({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView( 
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              '1) Columna básica',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Container(
              padding: const EdgeInsets.all(12),
              color: Colors.grey.shade200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('A'),
                  SizedBox(height: 12),
                  Text('B'),
                  SizedBox(height: 12),
                  Text('C'),
                ],
              ),
            ),

            const SizedBox(height: 24),
            const Text(
              '2) Row con espacios',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(12),
              color: Colors.grey.shade200,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Icon(Icons.home),
                  Icon(Icons.favorite),
                  Icon(Icons.person),
                ],
              ),
            ),

            const SizedBox(height: 24),
            const Text(
              '3) Expanded & flex (proporciones)',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 40,
                    color: Colors.blue,
                    alignment: Alignment.center,
                    child: const Text('flex:2',
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 40,
                    color: Colors.green,
                    alignment: Alignment.center,
                    child: const Text('flex:1',
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),
            const Text(
              '4) crossAxisAlignment.stretch en Column',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                    height: 36,
                    color: Colors.orange,
                    alignment: Alignment.center,
                    child: const Text('Ancho estirado')),
                const SizedBox(height: 8),
                Container(
                    height: 36,
                    color: Colors.orange,
                    alignment: Alignment.center,
                    child: const Text('Ancho estirado')),
              ],
            ),

            const SizedBox(height: 24),
            const Text(
              '5) Baseline (solo Row con textos)',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            SingleChildScrollView( 
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic, 
                children: const [
                  Text('Texto base', style: TextStyle(fontSize: 20)),
                  SizedBox(width: 12),
                  Text('más chico', style: TextStyle(fontSize: 14)),
                  SizedBox(width: 12),
                  Text('MÁS GRANDE', style: TextStyle(fontSize: 28)),
                ],
              ),
            ),

            const SizedBox(height: 24),
            const Text(
              '6) Row con texto largo (evitar overflow)',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              children: const [
                Icon(Icons.info),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Este es un texto largo que podría pasar el ancho de pantalla. Con Expanded evitamos el RenderFlex overflow.',
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),
            const Text(
              '7) Column con crossAxisAlignment (start / center / end)',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            Container(
              padding: const EdgeInsets.all(12),
              color: Colors.grey.shade200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, 
                children: [
                  Row(
                    children: const [
                      CircleAvatar(
                        radius: 20,
                        child: Icon(Icons.person),
                      ),
                      SizedBox(width: 12),
                      Text('Perfil de usuario'),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const Text('Nombre: Moises Morales Colin'),
                  const Text('Correo: 20223tn167@utez.edu.mx'),
                  const Text('Teléfono: +52 55 1234 5678'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
