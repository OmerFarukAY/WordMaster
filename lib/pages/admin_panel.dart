import 'package:flutter/material.dart';

void main(){

}

class AdminPanel extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }
  _buildAppBar(){
    return AppBar(
      title: Text("Admin Paneli"),
    );
  }

  _buildBody(){
    return Container();
  }
}
