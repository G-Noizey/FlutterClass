import 'package:flutter/material.dart';
import 'package:flutter_application_dio/api_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ApiService _api = ApiService();
  List<dynamic> users = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    final result = await _api.getUsers();
    setState(() {
      users = result;
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Usuarios con DIO")),
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final item = users[index];

                return ListTile(
                  leading: CircleAvatar(child: Text(item['id'].toString())),
                  title: Text(item['name']),
                  subtitle: Text(item['email']),
                );
              },
            ),
    );
  }
}
