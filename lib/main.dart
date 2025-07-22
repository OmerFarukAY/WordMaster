import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:word_master/boxes.dart';
import 'package:word_master/pages/admin_panel.dart';
import 'package:word_master/pages/home_page.dart';
import 'package:word_master/pages/login_page.dart';
import 'package:word_master/pages/password_renewal.dart';
import 'package:word_master/pages/profile_page.dart';
import 'package:word_master/pages/user_management.dart';
import 'package:word_master/person.dart';
import 'package:word_master/words.dart';


void main() async{
  await Hive.initFlutter();
if(!Hive.isAdapterRegistered(0)) {
  Hive.registerAdapter(personAdapter());
}
boxPersons = await Hive.openBox<person>('personBox');

if (!Hive.isAdapterRegistered(1)) {
  Hive.registerAdapter(wordsAdapter());

}

  boxWords = await Hive.openBox<words>('wordsBox');
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
        colorSchemeSeed: Color(0xff819067),
        brightness: Brightness.light,
        fontFamily: 'Urbanist',
      ),
      routes: {
        '/login-page': (_) => LoginPage(),
        '/home-page': (_) => HomePage(),
        '/password-renewal': (_) => PasswordRenewal(),
        '/admin-panel': (_) => AdminPanel(),
        '/profile-page': (_) => ProfilePage(),
        '/user-management': (_) => UserManagement(),
      },
    );
  }
}
