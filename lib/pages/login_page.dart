import 'package:flutter/material.dart';
import 'package:word_master/boxes.dart';

void main(){

}

class LoginPage extends StatefulWidget {

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  bool rememberMe = false;
 // Beni Hatırla durumu
  final TextEditingController userNameController =
  TextEditingController();
  final TextEditingController passwordController =
  TextEditingController();
  final TextEditingController roleController =
  TextEditingController();
  @override

  void dispose() {
    userNameController.dispose();
    passwordController.dispose();
    roleController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFEFAE0),
      appBar: _buildAppBar(),
      body:  _buildBody(context,),
    );
  }

  _buildAppBar(){
    return AppBar(
      title: Text("HOŞ GELDİNİZ",
        style: TextStyle(fontWeight: FontWeight.bold,
        color: Colors.white,
        ),
      ),
      centerTitle: true,
        backgroundColor: Color(0xff0A400C),
        automaticallyImplyLeading: false
    );
  }

  _buildBody(BuildContext context){
    return Center(
      child: Column(
        children: [
          SizedBox(height: 150,),
          Image.asset(
            "assets/logo.png",
            width: 180,
            height: 180,
            fit: BoxFit.contain,
          ),
          SizedBox(height: 24),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: TextField(
              controller: userNameController,
              decoration: InputDecoration(
                labelText: "Kullanıcı Adı",
                border: OutlineInputBorder(
                  borderRadius:BorderRadius.circular(12),
                ),
                prefixIcon: Icon(Icons.person),
                filled: true,
                fillColor: Color(0xffB1AB86),
              ),
            ),
          ),
          SizedBox(height: 16,),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 32),
            child: TextField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: "Şifre",
                border: OutlineInputBorder(
                  borderRadius:BorderRadius.circular(12),
                ),
                prefixIcon:  Icon(Icons.lock),
                filled: true,
                fillColor: Color(0xffB1AB86),
              ),
            ),
          ),
          SizedBox(height: 16,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 64),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/password-renewal');
                  },
                  child: Text("Şifremi Unuttum",
                    style: TextStyle(
                      color: Colors.blueAccent[700]
                    ),
                  ),
                ),
                Row(
                  children: [
                    Checkbox(
                      value: rememberMe,
                      onChanged: (value) {
                        setState(() {
                          rememberMe = value ?? false;
                        });
                      },
                    ),
                    Text("Beni Hatırla",
                    style:TextStyle(color: Colors.black),),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 16,),
          ElevatedButton(
            style: ElevatedButton.styleFrom (
              backgroundColor: Color(0xff0A400C),
              padding: const EdgeInsets.symmetric(horizontal: 64, vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),

            onPressed: (){

              var role = "";
              final loginUser = boxPersons.values.where((user) =>
              user.username == userNameController.value && user.password == passwordController.value);

              if (loginUser.isEmpty) {
                print("rol yok");
              }

              role = loginUser.first.role;
              if (role == "admin") {
                Navigator.pushReplacementNamed(context, "/admin-panel");
              } else if (role == "user") {
                Navigator.pushReplacementNamed(context, "/home-page");
              } else {
                Navigator.pushReplacementNamed(context, "/login-page");
              }

            },
            child: Text(
              "GİRİŞ YAP",
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
