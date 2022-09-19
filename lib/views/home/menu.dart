import 'dart:io';

import 'package:flowinsurance/constants/strings.dart';
import 'package:flowinsurance/views/home/component/souscriptionScreen.dart';
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
              Expanded(
                flex: 45,
                child: Bloc(
                  title: StringData.ecranBrise,
                  subtitle: StringData.assurEcranBrise,
                  assuranceActived: ecranBriseActive,
                  activedWidth: 150,
                  desactivedWidth: 150,
                  assurancePrice: prix,
                  icon: Icons.phone_android,
                ),
              ),
              Expanded(
                flex: 55,
                child: Bloc(
                  title: "DISFONCTIONNEMENT",
                  subtitle: StringData.faiteAss,
                  assuranceActived: ecranBriseActive,
                  activedWidth: 182,
                  desactivedWidth: 190,
                  assurancePrice: prix,
                  icon: Icons.phonelink_setup_rounded,
                ),
              ),
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
                        const Icon(Icons.play_arrow, color: Color.fromARGB(255, 12, 94, 23), size: 30),
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
}

class Bloc extends StatefulWidget {
  bool assuranceActived;
  String assurancePrice, title, subtitle;
  IconData icon;
  double activedWidth, desactivedWidth;

  Bloc(
      {super.key,
      required this.assuranceActived,
      required this.activedWidth,
      required this.desactivedWidth,
      required this.assurancePrice,
      required this.icon,
      required this.subtitle,
      required this.title});

  @override
  State<Bloc> createState() => _BlocState(assuranceActived, assurancePrice, activedWidth, desactivedWidth, icon, subtitle, title);
}

class _BlocState extends State<Bloc> {
  bool assuranceActived;
  String assurancePrice, title, subtitle;
  IconData icon;
  double activedWidth, desactivedWidth;

  _BlocState(this.assuranceActived, this.assurancePrice, this.activedWidth, this.desactivedWidth, this.icon, this.subtitle, this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 3.0),
      height: 120,
      color: const Color(0xffEEF7FF),
      child: InkWell(
        onTap: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => SouscriptionScreen(
                  icon: icon,
                  title: title,
                  fun: setEcranBriseActive,
                ))),
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
                        height: 30,
                        width: 30,
                        margin: const EdgeInsets.fromLTRB(4, 8, 4, 0),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), boxShadow: const [BoxShadow(color: Colors.grey, blurRadius: 1, blurStyle: BlurStyle.outer)]),
                        child: Icon(icon, color: Colors.grey, size: 30),
                      ),
                    ),
                    CustomWidget().myText(title, size: 13, isbols: true),
                    Column(
                      children: [
                        Visibility(visible: assuranceActived, child: const Icon(Icons.check_circle, color: Color(0xff00FFC2), size: 25)),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  width: assuranceActived ? activedWidth : desactivedWidth,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      assuranceActived
                          ? Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 15, left: 10, bottom: 5),
                                  child: CustomWidget().myText(assurancePrice, isbols: true, size: 12),
                                ),
                                Container(
                                  height: 15,
                                  width: 120,
                                  margin: const EdgeInsets.only(left: 8),
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(7), color: const Color(0xff00FFC2)),
                                  child: CustomWidget().myText(StringData.assurancePris, size: 10, color: Colors.grey),
                                ),
                              ],
                            )
                          : Expanded(
                              child: Container(
                                padding: const EdgeInsets.only(left: 8.0, top: 8),
                                child: Text(
                                  subtitle,
                                  maxLines: 8,
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
    );
  }

  void setEcranBriseActive(String p) {
    setState(() {
      assuranceActived = true;
      assurancePrice = p;
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
