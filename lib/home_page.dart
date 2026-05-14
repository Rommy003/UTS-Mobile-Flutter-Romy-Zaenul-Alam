import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Data Dummy berbentuk List 
    final List<String> dummyProducts = List.generate(10, (index) => 'Produk Dummy ${index + 1}');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        backgroundColor: Colors.teal,
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () => Navigator.pushNamed(context, '/profile'),
          ),
          IconButton(
            icon: const Icon(Icons.logout), // Fitur Logout
            onPressed: () => Navigator.pushReplacementNamed(context, '/login'),
          ),
        ],
      ),
      // Menerapkan ListView.builder 
      body: ListView.builder(
        itemCount: dummyProducts.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: ListTile(
              leading: const Icon(Icons.inventory),
              title: Text(dummyProducts[index]),
              subtitle: const Text('Deskripsi produk tersedia disini.'),
            ),
          );
        },
      ),
    );
  }
}