import 'package:flutter/material.dart';
import 'user_data.dart'; // Import simulasi database lokal

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _namaController;
  late TextEditingController _emailController;
  late TextEditingController _hpController;

  @override
  void initState() {
    super.initState();
    // Membaca data awal (READ - CRUD)
    _namaController = TextEditingController(text: UserData.nama);
    _emailController = TextEditingController(text: UserData.email);
    _hpController = TextEditingController(text: UserData.noHp);
  }

  void _updateProfil() {
    // Proses UPDATE - CRUD dengan validasi 
    if (_formKey.currentState!.validate()) {
      setState(() { // State Management 
        UserData.nama = _namaController.text;
        UserData.email = _emailController.text;
        UserData.noHp = _hpController.text;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Data profil berhasil diperbarui!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile Page'),
      backgroundColor: Colors.teal
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _namaController,
                decoration: const InputDecoration(labelText: 'Nama Lengkap'),
                validator: (value) => value!.isEmpty ? 'Nama tidak boleh kosong' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value!.isEmpty) return 'Email wajib diisi';
                  if (!value.contains('@')) return 'Format email tidak valid';
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _hpController,
                decoration: const InputDecoration(labelText: 'Nomor HP'),
                keyboardType: TextInputType.phone,
                validator: (value) => value!.isEmpty ? 'Nomor HP tidak boleh kosong' : null,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _updateProfil,
                child: const Text('Simpan Perubahan'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}