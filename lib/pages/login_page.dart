import 'package:flutter/material.dart';

void main(){

}

class LoginPage extends StatefulWidget {

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool rememberMe = false;
 // Beni Hatırla durumu
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[500],
      appBar: _buildAppBar(),
      body:  _buildBody(context,),
    );
  }

  _buildAppBar(){
    return AppBar(
      title: Text("HOŞ GELDİNİZ",
        style: TextStyle(fontWeight: FontWeight.bold,
        color: Colors.black,
        ),
      ),
      centerTitle: true,
        backgroundColor: Colors.black45,
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
              decoration: InputDecoration(
                labelText: "Kullanıcı Adı",
                border: OutlineInputBorder(
                  borderRadius:BorderRadius.circular(12),
                ),
                prefixIcon: Icon(Icons.person),
                filled: true,
                fillColor: Colors.blueGrey[300],
              ),
            ),
          ),
          SizedBox(height: 16,),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 32),
            child: TextField(
              decoration: InputDecoration(
                labelText: "Şifre",
                border: OutlineInputBorder(
                  borderRadius:BorderRadius.circular(12),
                ),
                prefixIcon:  Icon(Icons.lock),
                filled: true,
                fillColor: Colors.blueGrey[300],
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
              backgroundColor: Color(0xff00a500),
              padding: const EdgeInsets.symmetric(horizontal: 64, vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: (){
              Navigator.pushReplacementNamed(context, '/admin-panel'
                  '');
            },
            child: Text(
              "GİRİŞ YAP",
              style: TextStyle(
                fontSize: 18,
                color: Colors.black87,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
