import 'package:flutter/material.dart';
import 'package:word_master/boxes.dart';
import 'package:word_master/person.dart';

void main() {}

class UserManagement extends StatefulWidget {
  @override
  State<UserManagement> createState() => _UserManagementState();
}

class _UserManagementState extends State<UserManagement> {
  final TextEditingController idController =
      TextEditingController();
  final TextEditingController userNameController =
      TextEditingController();
  final TextEditingController passwordController =
      TextEditingController();
  final TextEditingController roleController =
      TextEditingController();

  @override
  void dispose() {
    idController.dispose();
    userNameController.dispose();
    passwordController.dispose();
    roleController.dispose();
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
        "KULLANICI AYARLARI",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      centerTitle: true,
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () => Navigator.of(context).pop(),
      ),
      automaticallyImplyLeading : false,
      backgroundColor: Color(0xff0A400C),
    );
  }

  _buildBody() {
    return Column(
      children: [
        SizedBox(height: 16),
        Text(
          "YENİ KULLANICI EKLE",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            color: Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: TextField(
            controller: idController,
            decoration: InputDecoration(
              labelText: "ID Girin",
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
          padding: const EdgeInsets.all(8),
          child: TextField(
            controller: userNameController,
            decoration: InputDecoration(
              labelText: "Kullanıcı Adı Girin",
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
          padding: const EdgeInsets.all(8),
          child: TextField(
            controller: passwordController,
            decoration: InputDecoration(
              labelText: "Şifre Girin",
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
          padding: const EdgeInsets.all(8),
          child: DropdownMenu<String>(
            controller: roleController,
            initialSelection: "user",
            onSelected: (String? newValue) {
              print("Seçilen: $newValue");
            },
            dropdownMenuEntries: const [
              DropdownMenuEntry(
                value: "user",
                label: "Kullanıcı",
              ),
              DropdownMenuEntry(value: "admin", label: "Admin"),
            ],
            menuStyle: const MenuStyle(
              backgroundColor: WidgetStatePropertyAll(
                Color(0xffB1AB86),
              ),
              surfaceTintColor: WidgetStatePropertyAll(
                Color(0xffB1AB86),
              ),
            ),
            textStyle: const TextStyle(color: Colors.black),
            width: double.infinity,
            leadingIcon: const Icon(Icons.add),
            label: const Text("Rol Seçin"),

            /// Stil ayarları (border-radius ve arka plan rengi burada!)
            inputDecorationTheme: const InputDecorationTheme(
              filled: true,
              fillColor: Color(0xffB1AB86),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
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
              boxPersons.put(
                'key_${userNameController.text}',
                person(
                  id: int.parse(idController.text),
                  username: userNameController.text,
                  password: passwordController.text,
                  role: roleController.text,
                ),
              );
              idController.clear();
              userNameController.clear();
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
                    'KULLANICILAR',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: SizedBox(
                    height: 300,
                    child: ListView.builder(
                      itemCount: boxPersons.length,
                      itemBuilder: (
                        BuildContext context,
                        int index,
                      ) {
                        final person = boxPersons.getAt(index);

                        return SizedBox(
                          height: 80,
                          child: Card(
                            color: Color(0xffB1AB86),
                            elevation: 3,
                            child: ListTile(
                              title: Text(
                                '${person?.username ?? "Kullanıcı Adı"} - ${person?.id.toString() ?? "Kullanıcı ID"}',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Text(
                                person?.role ?? "Kullanıcı Adı",
                              ),
                              trailing: IconButton(
                                icon: Icon(Icons.delete),
                                onPressed: () {
                                  setState(() {
                                    boxPersons.deleteAt(index);
                                  });
                                  print('Sil butonuna tıklandı');
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
    );
  }
}
