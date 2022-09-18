import 'package:flowinsurance/constants/strings.dart';
import 'package:flowinsurance/views/customwidget/boutton.dart';
import 'package:flowinsurance/views/home/component/souscrire_nouveau_telephone.dart';
import 'package:flowinsurance/views/home/partenaire.dart';
import 'package:flowinsurance/views/home/principal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import '../../../constants/styles.dart';

class AssurerNouveauTelephone extends StatefulWidget {
  const AssurerNouveauTelephone({super.key});

  @override
  State<AssurerNouveauTelephone> createState() => _AssurerNouveauTelephoneState();
}

class _AssurerNouveauTelephoneState extends State<AssurerNouveauTelephone> {
  double sliderValue = 3;
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

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
            const SizedBox(
              height: 15,
            ),
            Center(
              child: CustomWidget().myText(
                StringData.nouveauSmar,
                isbols: true,
                size: 18,
              ),
            ),
            Container(
              color: const Color.fromARGB(255, 219, 250, 219),
              margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              padding: const EdgeInsets.all(8),
              child: const Text("Cet assurance est uniquement souscrivable sur les nouveaux telephones achetes aupres de vos partenaires "),
            ),
            Container(margin: const EdgeInsets.all(10), child: const Text("Suivez les etapes pour souscrire a cette Assurance ")),
            Container(
              // height: 70,
              margin: const EdgeInsets.only(left: 8, top: 15, bottom: 15),
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
                    child: TextButton(
                        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const PartenairePage())),
                        child: const Text.rich(
                            TextSpan(
                                text: "Rendez vous chez l'un de nos partenaires pour l'achat de votre smarphone. ",
                                style: TextStyle(color: Colors.black, fontSize: 12),
                                children: [TextSpan(text: "Voir la liste de nos partenaires", style: TextStyle(color: Color.fromARGB(255, 107, 217, 245), decoration: TextDecoration.underline))]),
                            maxLines: 3)),
                  )),
                ],
              ),
            ),
            Container(
              height: 70,
              margin: const EdgeInsets.only(left: 8, top: 15, bottom: 15),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle, border: Border.all(color: Colors.black)),
                    child: const Center(child: Text("2", style: TextStyle(color: Colors.black), textScaleFactor: 2)),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 8, right: 8),
                        child: LimitedBox(
                          maxWidth: size.width - 70,
                          child: const Expanded(
                            child: Text(
                              maxLines: 3,
                              "Une fois le telephone achete, installez l'application Flow Assurance sur le smartphone et uploader le recu du fichier ",
                              style: TextStyle(color: Colors.black, fontSize: 12),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 8, right: 8),
                        child: Row(
                          children: [
                            Icon(
                              Icons.cloud_upload,
                              color: Colors.green[700],
                            ),
                            const Text("  Uploader le fichier")
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              // height: 70,
              margin: const EdgeInsets.only(left: 8, top: 15, bottom: 15),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle, border: Border.all(color: Colors.black)),
                    child: const Center(child: Text("3", style: TextStyle(color: Colors.black), textScaleFactor: 2)),
                  ),
                  Expanded(
                      child: Container(
                    margin: const EdgeInsets.only(left: 8, right: 8),
                    child: const Text.rich(
                        TextSpan(
                          text: "Notre equipe verifiera le recu et vous donnera acces a la souscription de cette assurance ",
                          style: TextStyle(color: Colors.black, fontSize: 12),
                        ),
                        maxLines: 2),
                  )),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 35, top: 50),
              child: CustomWidget().mybutton(size, "Souscrire", () => Navigator.push(context, MaterialPageRoute(builder: (context) => const SouscrireNouveauTelephone()))),
            )
          ],
        ),
      )),
    );
  }
}
