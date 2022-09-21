import 'dart:io';
import 'package:intl/intl.dart';
import 'package:flowinsurance/constants/strings.dart';
import 'package:flowinsurance/models/assurance.dart';
import 'package:flowinsurance/services/realtime_database.dart';
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
  bool isLoading = true;
  String prix = "0";
  late Map<String, Assurance?> listAssurance;
  Future<void> _init() async {
    await DataBaseService().getAllAssurance().then((value) => listAssurance = value);
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    imageFile = null;
    super.initState();
    _init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : SafeArea(
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
                        assu: listAssurance[StringData.ecranBrise],
                        title: StringData.ecranBrise,
                        subtitle: StringData.assurEcranBrise,
                        activedWidth: 150,
                        desactivedWidth: 150,
                        icon: Icons.phone_android,
                      ),
                    ),
                    Expanded(
                      flex: 55,
                      child: Bloc(
                        assu: listAssurance[StringData.disfonc],
                        title: StringData.disfonc,
                        subtitle: StringData.faiteAss,
                        activedWidth: 182,
                        desactivedWidth: 190,
                        icon: Icons.phonelink_setup_rounded,
                      ),
                    ),
                  ],
                ),
                Bloc(
                  assu: listAssurance[StringData.nouveauSmar],
                  activedWidth: MediaQuery.of(context).size.width - 40,
                  desactivedWidth: MediaQuery.of(context).size.width - 10,
                  icon: Icons.phone_android,
                  subtitle: StringData.besoin,
                  title: StringData.nouveauSmar,
                  color: const Color.fromARGB(255, 235, 241, 236),
                ),

                // InkWell(
                //   onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => AssurerNouveauTelephone(fun: assuranceActivation))),
                //   child: Container(
                //     margin: const EdgeInsets.all(5),
                //     height: 120,
                //     width: double.infinity,
                //     color: const Color.fromARGB(255, 235, 241, 236),
                //     child: Column(
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       children: [
                //         Row(
                //           children: [
                //             const Padding(
                //               padding: EdgeInsets.all(8.0),
                //               child: Icon(
                //                 Icons.phone_android,
                //                 size: 40,
                //               ),
                //             ),
                //             CustomWidget().myText(StringData.nouveauSmar, size: 13, isbols: true),
                //           ],
                //         ),
                //         Expanded(
                //           child: Row(
                //             children: [
                //               Expanded(
                //                 child: Padding(
                //                   padding: const EdgeInsets.all(8.0),
                //                   child: Text(
                //                     StringData.besoin,
                //                     textAlign: TextAlign.start,
                //                     maxLines: 3,
                //                     overflow: TextOverflow.ellipsis,
                //                   ),
                //                 ),
                //               ),
                //               const Icon(Icons.play_arrow, color: Color.fromARGB(255, 12, 94, 23), size: 30),
                //             ],
                //           ),
                //         )
                //       ],
                //     ),
                //   ),
                // ),
              ],
            )),
    );
  }

  void setImageFile(File? newImageFile) {
    setState(() {
      imageFile = newImageFile;
    });
  }

  void assuranceActivation(String p) {
    setState(() {
      // newPhoneActived.theBool = true;
      prix = p;
    });
    print("Toucheeeeeeeeeeeeeee");
  }
}

class Bloc extends StatefulWidget {
  String title, subtitle;
  IconData icon;
  double activedWidth, desactivedWidth;
  Assurance? assu;
  Color? color;
  Bloc({super.key, this.color, required this.assu, required this.activedWidth, required this.desactivedWidth, required this.icon, required this.subtitle, required this.title});

  @override
  State<Bloc> createState() => _BlocState(assu, activedWidth, desactivedWidth, icon, subtitle, title);
}

class _BlocState extends State<Bloc> {
  String title, subtitle;
  late String assurancePrice;
  IconData icon;
  double activedWidth, desactivedWidth;
  Assurance? assu;
  _BlocState(this.assu, this.activedWidth, this.desactivedWidth, this.icon, this.subtitle, this.title);
  @override
  void initState() {
    if (assu != null) {
      assurancePrice = assu!.delay;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 6, right: 3.0),
      height: 120,
      color: widget.color ?? const Color(0xffEEF7FF),
      child: InkWell(
        onTap: () => title != StringData.nouveauSmar
            ? Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => SouscriptionScreen(
                      icon: icon,
                      title: title,
                      fun: assuranceActivation,
                    )))
            : Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AssurerNouveauTelephone(fun: assuranceActivation),
                )),
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
                        Visibility(visible: assu != null, child: const Icon(Icons.check_circle, color: Color(0xff00FFC2), size: 25)),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  width: assu != null ? activedWidth : desactivedWidth,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      assu != null
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

  void assuranceActivation(String p) {
    String now, later;

    now = DateFormat('dd/MM/yyyy').format(DateTime.now());
    print("now time  $now");
    if (p[p.length - 1] == 'n') {
      later = DateFormat('dd/MM/yyyy').format(DateTime(DateTime.now().year + 1, DateTime.now().month, DateTime.now().day));
    } else {
      later = DateFormat('dd/MM/yyyy').format(DateTime(DateTime.now().year, DateTime.now().month + (int.parse(p.substring(12, 13))), DateTime.now().day));
    }
    print("later time $later");

    setState(() {
      assu = Assurance(title, p, now, later, "2", "1");
      assurancePrice = p;
      DataBaseService().setAssuranceToDatabase(assu!);
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
