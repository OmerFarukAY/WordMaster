import 'package:flutter/material.dart';

void main(){

}

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen[100],
      appBar: _buildAppBar(),
      body:  _buildBody(context),
    );
  }
  _buildAppBar(){
    return AppBar(
      title: Text("ANA SAYFA",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
      backgroundColor: Colors.lightGreen,
        automaticallyImplyLeading: false
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
              shadowColor: Colors.green,
              color: Colors.greenAccent[100],
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(32),
                    child:
                     Text('ENGLISH - TURKISH \n     WORD FINDER',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(32),
                    child: Text("KELİME",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black54,
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
                        backgroundColor: Colors.green[500],
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
