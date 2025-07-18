import 'package:flutter/material.dart';
import 'dart:io';


class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? _profileImage;
  final _oldPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  final String email = 'ayfaruk.01@gmail.com'; // örnek
  final String phone = '+90 552 206 7901';     // örnek


  void _changePassword() {
    final oldPassword = _oldPasswordController.text;
    final newPassword = _newPasswordController.text;
    final confirmPassword = _confirmPasswordController.text;

    if (newPassword != confirmPassword) {
      _showSnackbar('Yeni şifreler eşleşmiyor!');
      return;
    }

    if (oldPassword != 'dogruSifre') {
      // Burada gerçek kontrol backend ile yapılmalı
      _showSnackbar('Eski şifre yanlış!');
      return;
    }

    // TODO: Şifreyi backend'de güncelle
    _showSnackbar('Şifre başarıyla değiştirildi.');
  }

  void _showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Colors.grey[500],
      appBar: AppBar(
        title: Text("PROFİL AYARLARI",
          style: TextStyle(fontWeight: FontWeight.bold,
          color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.black45,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: _profileImage != null
                        ? FileImage(_profileImage!)
                        : AssetImage('assets/logo.png') as ImageProvider,
                    backgroundColor: Colors.grey[200],
                  ),

                ],
              ),
            ),
            const SizedBox(height: 24),
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: ListTile(
                leading: Icon(Icons.email),
                title: Text("E-posta"),
                subtitle: Text(email),
              ),
            ),
            const SizedBox(height: 12),
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: ListTile(
                leading: Icon(Icons.phone),
                title: Text("Telefon Numarası"),
                subtitle: Text(phone),
              ),
            ),

            const SizedBox(height: 24),
            Text("Şifre Yenileme", style: theme.textTheme.titleMedium),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Eski Şifre",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  prefixIcon: const Icon(Icons.lock),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Yeni Şifre",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  prefixIcon: const Icon(Icons.lock),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Yeni Şifre (Tekrar)",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  prefixIcon: const Icon(Icons.lock),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: _changePassword,
              icon: Icon(Icons.save),
              label: Text('ŞİFREYİ GÜNCELLE',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff00a500),
                foregroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(horizontal: 64, vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            SizedBox(height: 16,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff00a500),
                padding: const EdgeInsets.symmetric(horizontal: 64, vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/login-page');
              },
              child: const Text(
                "ÇIKIŞ YAP",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
