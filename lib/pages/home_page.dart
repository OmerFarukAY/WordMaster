import 'package:flutter/material.dart';

void main(){

}

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[500],
      appBar: _buildAppBar(context),
      body:  _buildBody(context),
    );
  }
  _buildAppBar(context){
    return AppBar(
      title: Text("ANA SAYFA",
        style: TextStyle(fontWeight: FontWeight.bold,
        color: Colors.black
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.black45,
        automaticallyImplyLeading: false,
      actions: [
        Padding(
          padding: const EdgeInsets.all(5),
          child: IconButton(
            icon: Icon(
              Icons.person,
              size: 40,
              color: Colors.black,
            ),
            onPressed: (){
              Navigator.pushNamed(context, '/profile-page');
            },
          ),
        ),
      ],
    );
  }

  _buildBody(BuildContext context){
    return Center(
      child: Column(
        children: [
          SizedBox(height: 150,),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Card(
              elevation: 10,
              color: Colors.blueGrey[600],
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(32),
                    child:
                     Text('ENGLISH - TURKISH \n     WORD FINDER',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(32),
                    child: Text("KELİME",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(32),
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: "Cevabınızı Girin!!",
                        border: OutlineInputBorder(
                          borderRadius:BorderRadius.circular(12),
                        ),
                        prefixIcon: Icon(Icons.person),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(32),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom (
                        backgroundColor: Color(0xff00a500),
                        padding: const EdgeInsets.symmetric(horizontal: 64, vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: (){
                      },
                      child: Text(
                        "SUBMIT",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
