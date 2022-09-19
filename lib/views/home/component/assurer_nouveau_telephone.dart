import 'package:flowinsurance/constants/strings.dart';
import 'package:flowinsurance/views/customwidget/boutton.dart';
import 'package:flowinsurance/views/home/component/souscriptionScreen.dart';

import 'package:flowinsurance/views/home/partenaire.dart';
import 'package:flutter/gestures.dart';

import 'package:flutter/material.dart';

class AssurerNouveauTelephone extends StatefulWidget {
  final Function(String) fun;
  const AssurerNouveauTelephone({super.key, required this.fun});

  @override
  State<AssurerNouveauTelephone> createState() => _AssurerNouveauTelephoneState();
}

class _AssurerNouveauTelephoneState extends State<AssurerNouveauTelephone> {
  TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 15),
            Center(
              child: CustomWidget().myText(StringData.nouveauSmar, isbols: true, size: 18),
            ),
            Container(
              color: const Color.fromARGB(255, 219, 250, 219),
              margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              padding: const EdgeInsets.all(8),
              child: const Text("Cet assurance est uniquement souscrivable sur les nouveaux telephones achetes aupres de vos partenaires "),
            ),
            Container(margin: const EdgeInsets.all(10), child: const Text("Suivez les etapes pour souscrire a cette Assurance ")),
            Container(
              margin: const EdgeInsets.only(left: 8, top: 12, bottom: 15),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle, border: Border.all(color: Colors.black)),
                    child: const Center(child: Text("1", style: TextStyle(color: Colors.black), textScaleFactor: 2)),
                  ),
                  Expanded(
                      child: Container(
                    margin: const EdgeInsets.only(left: 8, right: 8),
                    child: Text.rich(
                      maxLines: 3,
                      TextSpan(text: "Rendez vous chez l'un de nos partenaires pour l'achat de votre smarphone. ", style: const TextStyle(color: Colors.black, fontSize: 12), children: [
                        TextSpan(
                          text: "Voir la liste de nos partenaires",
                          style: const TextStyle(color: Color.fromARGB(255, 107, 217, 245), decoration: TextDecoration.underline),
                          recognizer: TapGestureRecognizer()..onTap = () => Navigator.push(context, MaterialPageRoute(builder: (context) => const PartenairePage())),
                        )
                      ]),
                    ),
                  )),
                ],
              ),
            ),
            SizedBox(
              height: 90,
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                item("2", "Une fois le telephone achete, installez l'application Flow Assurance sur le smartphone et uploader le recu du fichier ", 4, size.width - 30),
                Container(
                  margin: const EdgeInsets.only(left: 55),
                  child: Row(
                    children: [
                      Icon(Icons.cloud_upload, color: Colors.green[700]),
                      const Text("  Uploader le fichier"),
                    ],
                  ),
                ),
              ]),
            ),
            item("3", "Notre equipe verifiera le recu et vous donnera acces a la souscription de cette assurance ", 0, size.width - 30),
            Container(
              margin: const EdgeInsets.only(left: 35, top: 50),
              child: CustomWidget().mybutton(
                size,
                "Souscrire",
                () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SouscriptionScreen(
                        title: "NOUVEAU TELEPHONE",
                        color: const Color.fromARGB(255, 219, 250, 219),
                        subtitle: "Cet assurance est uniquement souscrivable sur les nouveaux telephones achetes aupres de vos partenaires ",
                        fun: widget.fun,
                      ),
                    )),
              ),
            )
          ],
        ),
      ),
    ));
  }

  Widget item(String no, String body, double bottomMargin, double width) {
    return Container(
      width: width,
      margin: EdgeInsets.only(left: 8, top: 5, bottom: bottomMargin),
      child: Row(
        children: [
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle, border: Border.all(color: Colors.black)),
            child: Center(child: Text(no, style: const TextStyle(color: Colors.black), textScaleFactor: 2)),
          ),
          Expanded(
              child: Container(
            margin: const EdgeInsets.only(left: 8, right: 8),
            child: Text(body, style: const TextStyle(color: Colors.black, fontSize: 12), maxLines: 3),
          )),
        ],
      ),
    );
  }
}
