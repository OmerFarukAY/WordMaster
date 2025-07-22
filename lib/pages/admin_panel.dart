import 'package:flutter/material.dart';
import 'package:word_master/boxes.dart';
import 'package:word_master/words.dart';

class AdminPanel extends StatefulWidget {
  @override
  State<AdminPanel> createState() => _AdminPanelState();
}

class _AdminPanelState extends State<AdminPanel> {
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
      body: _buildBody(),
    );
  }

  _buildAppBar(context) {
    return AppBar(
      title: Text(
        "ADMİN PANELİ",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      centerTitle: true,
      backgroundColor: Color(0xff0A400C),
      automaticallyImplyLeading : false,
      actions: [
        Padding(
          padding: const EdgeInsets.all(5),
          child: IconButton(
            icon: Icon(
              Icons.admin_panel_settings,
              size: 40,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/user-management');
            },
          ),
        ),
      ],
    );
  }

  _buildBody() {
    return Center(
      child: Column(
        children: [
          SizedBox(height: 70),
          Text(
            "YENİ KELİME EKLE",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              color: Colors.black87,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: englishController,
              decoration: InputDecoration(
                labelText: "Yeni İngilizce Kelime Girin",
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
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: turkishController,
              decoration: InputDecoration(
                labelText: "Yeni Kelimenin Türkçesini Girin",
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
            padding: const EdgeInsets.all(16),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff819067),
                padding: const EdgeInsets.symmetric(
                  horizontal: 64,
                  vertical: 14,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                boxWords.put(
                  'key_${englishController.text}',
                  words(
                    english: englishController.text,
                    turkish: turkishController.text,
                  ),
                );
                turkishController.clear();
                englishController.clear();
                setState(() => {});
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
          SizedBox(height: 50,),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Card(
              elevation: 10,
              color: Color(0xff819067),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      'KELİMELER',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    child: SizedBox(
                      height: 300,
                      child: ListView.builder(
                        itemCount: boxWords.length,
                        itemBuilder: (
                          BuildContext context,
                          int index,
                        ) {
                          final word = boxWords.getAt(index);

                          return SizedBox(
                            height: 80,
                            child: Card(
                              color: Color(0xffB1AB86),
                              elevation: 3,
                              child: ListTile(
                                title: Text(
                                  word?.english ??
                                      "İngilizce kelime",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Text(
                                  word?.turkish ??
                                      "Türkçe anlam",
                                ),
                                trailing: IconButton(
                                  icon: Icon(Icons.delete),
                                  onPressed: () {
                                    setState(() {
                                      boxWords.deleteAt(index);
                                    });
                                    print(
                                      'Sil butonuna tıklandı',
                                    );
                                  },
                                ),
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
