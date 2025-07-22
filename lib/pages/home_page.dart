import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'package:word_master/boxes.dart';
import 'package:word_master/words.dart';

void main(){

}

class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();
}
final ValueNotifier<String> wordText = ValueNotifier<String>("İngilizce kelime");

void getRandomWord() {
  final box = Hive.box("boxWords");
  if (box.isNotEmpty) {
    final allWords = box.values.toList();
    allWords.shuffle(); // rastgele sırala
    final randomWord = allWords.first;
    wordText.value = randomWord.english;
  } else {
    wordText.value = "Kutu boş!";
  }
}


class _HomePageState extends State<HomePage> {
  final TextEditingController englishController =
  TextEditingController();
  final TextEditingController turkishController =
  TextEditingController();

  @override
  void dispose() {
    englishController.dispose();
    turkishController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFEFAE0),
      appBar: _buildAppBar(context),
      body:  _buildBody(context),
    );
  }

  _buildAppBar(context){
    return AppBar(
      title: Text("ANA SAYFA",
        style: TextStyle(fontWeight: FontWeight.bold,
        color: Colors.white
        ),
      ),
      centerTitle: true,
      backgroundColor: Color(0xff0A400C),
        automaticallyImplyLeading: false,
      actions: [
        Padding(
          padding: const EdgeInsets.all(5),
          child: IconButton(
            icon: Icon(
              Icons.person,
              size: 40,
              color: Colors.white,
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
              color: Color(0xff819067),
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
                    child: ValueListenableBuilder<String>(
                      valueListenable: wordText,
                      builder: (context, value, child) {
                        return Text(
                          value,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      },
                    ),
                  ),


                  Padding(
                    padding: const EdgeInsets.all(32),
                    child:  TextField(
                      controller: turkishController,
                      decoration: InputDecoration(
                        labelText: "Cevabınızı Girin!!",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        prefixIcon: Icon(Icons.add),
                        filled: true,
                        fillColor: Color(0xffB1AB86),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(32),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom (
                        backgroundColor: Color(0xff0A400C),
                        padding: const EdgeInsets.symmetric(horizontal: 64, vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: (){
                      },
                      child: Text(
                        "ONAYLA",
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
