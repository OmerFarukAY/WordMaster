import 'package:flutter/material.dart';
import 'package:word_master/boxes.dart';
import 'package:word_master/words.dart';

class AdminPanel extends StatefulWidget {

  @override
  State<AdminPanel> createState() => _AdminPanelState();
}

class _AdminPanelState extends State<AdminPanel> {

  final TextEditingController englishController = TextEditingController();
  final TextEditingController turkishController = TextEditingController();

  @override
  void dispose() {
    englishController.dispose();
    turkishController.dispose();
    super.dispose();
  }


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
        title: Text("ADMİN PANELİ",
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

  _buildBody(){
    return Center(
      child: Column(
        children: [
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.all(16),
            child:
            TextField(
              controller: englishController,
              decoration: InputDecoration(
                labelText: "Yeni İngilizce Kelime Girin",
                border: OutlineInputBorder(
                  borderRadius:BorderRadius.circular(12),
                ),
                prefixIcon: Icon(Icons.add),
                filled: true,
                fillColor: Colors.blueGrey[300],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child:
            TextField(
              controller: turkishController,
              decoration: InputDecoration(
                labelText: "Yeni Kelimenin Türkçesini Girin",
                border: OutlineInputBorder(
                  borderRadius:BorderRadius.circular(12),
                ),
                prefixIcon: Icon(Icons.add),
                filled: true,
                fillColor: Colors.blueGrey[300],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom (
                backgroundColor: Color(0xff00a500),
                padding: const EdgeInsets.symmetric(horizontal: 64, vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: (){
                boxWords.put('key_${englishController.text}',words(
                  english: englishController.text,
                  turkish: turkishController.text,
                ),
                );
                turkishController.clear();
                englishController.clear();
                setState(()=>{});

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
      Padding(
        padding: const EdgeInsets.all(8),
        child: Card(
          elevation: 10,
          color: Colors.blueGrey[600],
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  'Kelime\nEkle-Sil',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SizedBox(
                  height: 300,
                  child: ListView.builder(
                    itemCount: boxWords.length,
                    itemBuilder: (BuildContext context, int index) {
                      final word = boxWords.getAt(index); // düzeltildi

                      return SizedBox(
                        height: 80,
                        child: Card(
                          color: Colors.white,
                          elevation: 3,
                          child: ListTile(
                            title: Text(
                              word?.english ?? "İngilizce kelime",
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(word?.turkish ?? "Türkçe anlam"),
                            trailing: const Icon(
                              Icons.edit,
                              color: Color(0xff00a500),
                            ),
                            onTap: () {
                              Navigator.pushNamed(context, '/word-settings');
                            },
                          ),
                        ),
                      );
                    },
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