import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    // Validasi Form
    if (_formKey.currentState!.validate()) {
      // Menampilkan SnackBar success message 
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Login Berhasil!")),
      );
      // Navigasi ke Home
      Navigator.pushReplacementNamed(context, '/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login Page'),
      backgroundColor: Colors.teal
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form( // Menggunakan Widget Form
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email', 
                  border: OutlineInputBorder()
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Email wajib diisi';
                  if (!value.contains('@')) return 'Format email tidak valid';
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  labelText: 'Password', 
                  border: OutlineInputBorder()
                ),
                obscureText: true, // Menyembunyikan teks password
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Password wajib diisi';
                  if (value.length < 6) return 'Password minimal 6 karakter';
                  return null;
                },
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                style: ElevatedButton.styleFrom(minimumSize: const Size(double.infinity, 50)),
                onPressed: _login,
                child: const Text('LOGIN'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}