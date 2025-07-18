import 'package:flutter/material.dart';

void main(){

}

class WordSettings extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[500],
      appBar: _buildAppBar(context),
      body: _buildBody(),
    );
  }
  _buildAppBar(context){
    return AppBar(
      title: Text("KELİME AYARLARI",
        style: TextStyle(fontWeight: FontWeight.bold,
        color: Colors.black
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.black45,
    );
  }

  _buildBody(){
    return Container();
  }
}
