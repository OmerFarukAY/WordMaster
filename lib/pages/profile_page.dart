import 'package:flutter/material.dart';

void main(){

}

class ProfilePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }
  _buildAppBar(){
    return AppBar(
      title: Text("Profil Ayarları"),
    );
  }

  _buildBody(){
    return Container();
  }
}
