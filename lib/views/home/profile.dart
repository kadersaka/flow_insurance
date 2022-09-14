import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool bool1 = false, bool2 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: TextButton(onPressed: () => Navigator.pop(context), child: const Icon(Icons.arrow_back, color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text("Parametres", style: TextStyle(color: Colors.black)),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(children: const [Icon(Icons.manage_accounts_outlined), Text(" PROPRIETAIRE", style: TextStyle(color: Color.fromARGB(255, 129, 125, 125)))]),
              TextButton(
                  onPressed: () {
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => UpdateOwner()));
                  },
                  child: Row(children: const [Text(" Modifier", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)), Icon(Icons.mode_edit_outlined, color: Colors.black)]))
            ],
          ),
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 35),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromARGB(255, 252, 248, 248),
              boxShadow: const [
                BoxShadow(blurRadius: 1, spreadRadius: 0.75, color: Colors.black26),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Padding(padding: EdgeInsets.only(bottom: 4), child: Text("Nom", style: TextStyle(color: Color.fromARGB(255, 129, 125, 125), fontSize: 13))),
                const Text("Houknou", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
                const Divider(height: 20),
                const Padding(padding: EdgeInsets.only(bottom: 4), child: Text("Prenom", style: TextStyle(color: Color.fromARGB(255, 129, 125, 125), fontSize: 13))),
                const Text("Rodrigue", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
                const Divider(height: 20),
                const Divider(height: 20),
                const Padding(padding: EdgeInsets.only(bottom: 4), child: Text("Verifiervotre identite", style: TextStyle(color: Color.fromARGB(255, 129, 125, 125), fontSize: 13))),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        onPressed: () => getFile(1),
                        child: Row(
                          children: [
                            const Icon(Icons.cloud_upload_sharp, color: Color.fromARGB(255, 166, 231, 45)),
                            Text(!bool1 ? "  Telecharger" : "Carte d'identite Rodrigue", style: const TextStyle(color: Color.fromARGB(255, 129, 125, 125), fontSize: 13))
                          ],
                        )),
                    bool1
                        ? IconButton(
                            onPressed: () {
                              setState(() {
                                bool1 = false;
                              });
                            },
                            icon: const Icon(Icons.cancel_sharp, color: Colors.red))
                        : Container()
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.only(left: 5, right: 5, top: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromARGB(255, 252, 248, 248),
              boxShadow: const [
                BoxShadow(blurRadius: 1, spreadRadius: 0.75, color: Colors.black26),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Padding(padding: EdgeInsets.only(bottom: 4), child: Text("Nous contacter", style: TextStyle(color: Color.fromARGB(255, 129, 125, 125), fontSize: 13))),
                const Text("96 06 05 22", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
                const Divider(height: 20),
                const Padding(
                  padding: EdgeInsets.only(bottom: 4),
                  child: Text("Lire nos termes et conditions", style: const TextStyle(color: Color.fromARGB(255, 129, 125, 125), fontSize: 13)),
                ),
                const Text("Terms et conditions  de flow assurance",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      decoration: TextDecoration.underline,
                    )),
                const Divider(height: 20),
                TextButton(
                  onPressed: () {},
                  child: Row(
                    children: const [
                      Text("Me deconnecter", style: TextStyle(color: Colors.red)),
                      Expanded(child: SizedBox()),
                      Icon(Icons.logout, color: Colors.red),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  void getFile(int option) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.custom, allowedExtensions: ['jpg', 'pdf', 'png']);
    if (result != null) {
      setState(() {
        if (option == 1) bool1 = true;
        if (option == 2) bool2 = true;
      });
    }
  }
}
