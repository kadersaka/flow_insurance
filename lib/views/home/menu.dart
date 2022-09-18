import 'dart:io';

import 'package:flowinsurance/constants/strings.dart';
import 'package:flowinsurance/views/home/component/assurer_ecran_brise.dart';
import 'package:flowinsurance/views/home/component/assurer_nouveau_telephone.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import '../customwidget/boutton.dart';
import 'component/ImageProfilPage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late File? imageFile;
  bool ecranBriseActive = false;
  String prix = "0";
  @override
  void initState() {
    imageFile = null;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipPath(
            clipper: CustomShape(),
            child: Container(
              height: 200,
              width: double.infinity,
              decoration: const BoxDecoration(color: Color.fromARGB(232, 223, 223, 218)),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Row(
                  children: [
                    const SizedBox(height: 8),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.phone_android),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(StringData.votreTelephone, style: const TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    const Expanded(child: SizedBox()),
                    InkWell(
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ImageProfilPage(ImageFile: imageFile, fun: setImageFile))),
                      child: Container(
                          height: 50,
                          width: 50,
                          margin: const EdgeInsets.all(5),
                          child: CircleAvatar(
                            // backgroundColor: Colors.black,
                            radius: 100,
                            // backgroundImage: AssetImage(ImagePath),
                            child: Container(
                              height: 50,
                              width: 50,
                              child: CircleAvatar(
                                radius: 40,
                                child: ClipOval(
                                  child: imageFile != null
                                      ? Image.file(
                                          imageFile!,
                                          height: double.infinity,
                                          width: double.infinity,
                                          fit: BoxFit.cover,
                                        )
                                      : const Icon(CupertinoIcons.person_crop_circle_fill, color: Color(0xffEEF7FF)),
                                ),
                              ),
                            ),
                          )),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    StringData.infinix,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Color(0xff185182),
                    ),
                  ),
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 3,
                    ),
                    Padding(padding: const EdgeInsets.only(left: 8), child: CustomWidget().myText(StringData.model, isbols: true)),
                    Padding(padding: const EdgeInsets.only(left: 8), child: CustomWidget().myText(StringData.myModel, isbols: true)),
                    const SizedBox(
                      width: 10,
                    ),
                    Padding(padding: const EdgeInsets.all(8), child: CustomWidget().myText(StringData.imei, isbols: true)),
                    Padding(padding: const EdgeInsets.only(left: 4), child: CustomWidget().myText(StringData.myIme, isbols: true)),
                  ],
                ),
              ]),
            ),
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Container(
                height: 120,
                // width: MediaQuery.of(context).size.width / 2,
                // width: 200,
                color: const Color(0xffEEF7FF),
                child: InkWell(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => AssurerEcranBrise(
                            fun: setEcranBriseActive,
                          ))), //DetailEcranBrise
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Transform.rotate(
                                angle: math.pi / 10.0,
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  margin: const EdgeInsets.fromLTRB(4, 8, 4, 0),
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), boxShadow: const [BoxShadow(color: Colors.grey, blurRadius: 1, blurStyle: BlurStyle.outer)]),
                                  child: const Icon(Icons.phone_android, color: Colors.grey, size: 30),
                                ),
                              ),
                              CustomWidget().myText(StringData.ecranBrise, size: 13, isbols: true),
                              Column(
                                children: [
                                  Visibility(visible: ecranBriseActive, child: Icon(Icons.check_circle, color: Color(0xff00FFC2), size: 25)),
                                  const SizedBox(height: 20),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            // height: 60,
                            width: ecranBriseActive ? 166 : 160,
                            child: Row(
                              children: [
                                ecranBriseActive
                                    ? Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(top: 18, left: 10, bottom: 5),
                                            child: CustomWidget().myText("$prix FCFA / 3 mois", isbols: true, size: 12),
                                          ),
                                          Container(
                                            height: 15,
                                            width: 120,
                                            margin: const EdgeInsets.all(8),
                                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(7), color: const Color(0xff00FFC2)),
                                            child: CustomWidget().myText(StringData.assurancePris, size: 10, color: Colors.grey),
                                          ),
                                        ],
                                      )
                                    : Expanded(
                                        child: Container(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            StringData.assurEcranBrise,
                                            maxLines: 3,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ),
                                const Icon(Icons.play_arrow, color: Color.fromARGB(255, 12, 94, 23), size: 30),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    height: 120,
                    // width: MediaQuery.of(context).size.width / 2.2,
                    color: const Color(0xffEEF7FF),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              margin: const EdgeInsets.fromLTRB(4, 8, 4, 0),
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), boxShadow: const [BoxShadow(color: Colors.grey, blurRadius: 1, blurStyle: BlurStyle.outer)]),
                              child: const Icon(
                                Icons.phonelink_setup_rounded,
                                color: Colors.grey,
                                size: 30,
                              ),
                            ),
                            CustomWidget().myText("DISFONCTIONNEMENT", size: 12.5, isbols: true),
                          ],
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    StringData.faiteAss,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                              const Icon(Icons.play_arrow, color: Color.fromARGB(255, 12, 94, 23), size: 30),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          InkWell(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const AssurerNouveauTelephone())),
            child: Container(
              margin: const EdgeInsets.all(5),
              height: 120,
              width: double.infinity,
              color: const Color.fromARGB(255, 235, 241, 236),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.phone_android,
                          size: 40,
                        ),
                      ),
                      CustomWidget().myText(StringData.nouveauSmar, size: 13, isbols: true),
                    ],
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              StringData.besoin,
                              textAlign: TextAlign.start,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        const Icon(Icons.play_arrow, color: const Color.fromARGB(255, 12, 94, 23), size: 30),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }

  void setImageFile(File? newImageFile) {
    setState(() {
      imageFile = newImageFile;
    });
  }

  void setEcranBriseActive(double p) {
    setState(() {
      ecranBriseActive = true;
      prix = p.toString().substring(0, 4);
    });
  }
}

class CustomShape extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    double height = size.height;
    double width = size.width;
    var path = Path();
    path.lineTo(0, height - 50);
    path.quadraticBezierTo(width / 2, height, width, height - 50);
    path.lineTo(width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}
