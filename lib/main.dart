import 'package:flutter/material.dart';
import 'login_page.dart';
import 'home_page.dart';
import 'profile_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UTS Praktikum Mobile',
      theme: ThemeData(primarySwatch: Colors.blue),
      // Menerapkan Named Routes
      initialRoute: '/login', 
      routes: {
        '/login': (context) => const LoginPage(),
        '/home': (context) => const HomePage(),
        '/profile': (context) => const ProfilePage(),
      },
    );
  }
}