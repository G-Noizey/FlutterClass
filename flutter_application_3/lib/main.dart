import 'package:flutter/material.dart';
import 'Worker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Worker Manager',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Gestión de Trabajadores'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Controladores para los campos
  final TextEditingController _idCtrl = TextEditingController();
  final TextEditingController _nombreCtrl = TextEditingController();
  final TextEditingController _apellidosCtrl = TextEditingController();
  final TextEditingController _edadCtrl = TextEditingController();

  
  List<Worker> trabajadores = [];

  void _addWorker() {
    final id = _idCtrl.text.trim();
    final nombre = _nombreCtrl.text.trim();
    final apellidos = _apellidosCtrl.text.trim();
    final edadTxt = _edadCtrl.text.trim();

    if (id.isEmpty || nombre.isEmpty || apellidos.isEmpty || edadTxt.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Todos los campos son obligatorios")),
      );
      return;
    }

    final edad = int.tryParse(edadTxt);
    if (edad == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("La edad debe ser un número válido")),
      );
      return;
    }

    if (edad < 18) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Solo se permiten mayores de edad")),
      );
      return;
    }

    if (trabajadores.any((w) => w.id == id)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("El ID ya existe, no se permiten duplicados")),
      );
      return;
    }

    setState(() {
      trabajadores.add(
        Worker(id: id, nombre: nombre, apellidos: apellidos, edad: edad),
      );
    });

    // Limpiar 
    _idCtrl.clear();
    _nombreCtrl.clear();
    _apellidosCtrl.clear();
    _edadCtrl.clear();
  }

  // Eliminar último trabajador
  void _removeLastWorker() {
    if (trabajadores.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("No hay trabajadores para eliminar")),
      );
      return;
    }
    setState(() {
      trabajadores.removeLast();
    });
  }

  // Widget para mostrar lista
  Widget _getWorkers() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 14),
        const Text("Lista de Trabajadores:"),
        const SizedBox(height: 10),
        ...trabajadores.map((w) => Text("- ${w.id} | ${w.nombre} ${w.apellidos} (${w.edad})")),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _idCtrl,
              decoration: const InputDecoration(
                labelText: 'ID',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _nombreCtrl,
              decoration: const InputDecoration(
                labelText: 'Nombre',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _apellidosCtrl,
              decoration: const InputDecoration(
                labelText: 'Apellidos',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _edadCtrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Edad',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _addWorker,
              child: const Text("Agregar trabajador"),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              onPressed: _removeLastWorker,
              child: const Text("Eliminar último trabajador"),
            ),
            const SizedBox(height: 20),
            _getWorkers(),
          ],
        ),
      ),
    );
  }
}
