import 'package:flutter/material.dart';
import 'package:word_master/pages/admin_panel.dart';
import 'package:word_master/pages/home_page.dart';
import 'package:word_master/pages/login_page.dart';
import 'package:word_master/pages/password_renewal.dart';
import 'package:word_master/pages/profile_page.dart';

void main()
{
  runApp(AnaUygulama());
}

class AnaUygulama extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //home: RoleManager.currentRole == null ? LoginPage() : HomePage(),
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.lightGreen,
        brightness: Brightness.light,
        fontFamily: 'Urbanist',
      ),
      routes: {
        '/login-page': (_) => LoginPage(),
        '/home-page': (_) => HomePage(),
        '/password-renewal': (_) => PasswordRenewal(),
        '/admin-panel': (_) => AdminPanel(),
        '/profile-page': (_) => ProfilePage(),
      },
    );
  }
}
