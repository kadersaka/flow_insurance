import 'package:badges/badges.dart';
import 'package:flowinsurance/constants/strings.dart';
import 'package:flowinsurance/services/realtime_database.dart';
import 'package:flowinsurance/views/customwidget/boutton.dart';
import 'package:flowinsurance/views/diagnostic/test_page/micro_test.dart';
import 'package:flutter/material.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:unique_identifier/unique_identifier.dart';

import '../home/principal.dart';
import 'test_page/ScreenTestPage.dart';

class AccueilDiagnostic extends StatefulWidget {
  const AccueilDiagnostic({super.key});

  @override
  State<AccueilDiagnostic> createState() => _AccueilDiagnosticState();
}

class _AccueilDiagnosticState extends State<AccueilDiagnostic> {
  late AndroidDeviceInfo androidInfo;
  bool loading = true;

  Future<void> _initInfo() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    String? imei = "";
    AndroidDeviceInfo andro = await deviceInfo.androidInfo;
    imei = await UniqueIdentifier.serial;
    setState(() {
      androidInfo = andro;
      StringData.infinix = androidInfo.board!;
      StringData.myModel = androidInfo.model!;
      if (imei != null) StringData.myIme = imei;
      loading = false;
      print('Running on ${androidInfo.model}');
    });
  }

  @override
  void initState() {
    _initInfo();
    DataBaseService().getPhoneDetailsFromDatabase();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : SafeArea(
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 134,
                  width: double.infinity,
                  color: const Color.fromARGB(232, 242, 240, 183),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Row(
                      children: [
                        const SizedBox(
                          height: 8,
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(Icons.phone_android),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            StringData.votreTelephone,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        '${androidInfo.board}',
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
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: CustomWidget().myText(StringData.phoneDiagn, isbols: true, color: const Color(0xff185182), size: 30),
                ),
                Padding(padding: const EdgeInsets.all(10), child: CustomWidget().myText(StringData.resulDiagnos, isbols: false, size: 15)),
                Wrap(
                    spacing: 10,
                    children: StringData.essai
                        .map((e) => Container(
                              margin: const EdgeInsets.symmetric(vertical: 5),
                              height: 92,
                              child: Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      if (e[2] != "1") {
                                        if (e[0] == StringData.essai[1][0]) {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) => ScreenTestPage(
                                                        fun: () => setBadgeIcon(e),
                                                      )));
                                        }
                                        if (e[0] == StringData.essai[2][0]) {
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => const MicroTest()));
                                        }
                                        setState(() {
                                          e[2] = "0";
                                        });
                                      }
                                    },
                                    child: Badge(
                                      badgeColor: Colors.white,
                                      showBadge: e[2] != "",
                                      badgeContent: e[2] == "0"
                                          ? const Icon(
                                              Icons.close,
                                              color: Colors.red,
                                            )
                                          : const Icon(
                                              Icons.check,
                                              color: Colors.green,
                                            ),
                                      child: Container(
                                        height: 70,
                                        width: 80,
                                        decoration: BoxDecoration(border: Border.all(color: Colors.grey, width: 0.5)),
                                        child: Image.asset(
                                          "assets/${e[1]}",
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 3),
                                  CustomWidget().myText(e[0], isbols: false),
                                ],
                              ),
                            ))
                        .toList()),
                Center(
                    child: CustomWidget().mybutton(size, StringData.continuer, () {
                  DataBaseService().setPhoneDetailsToDatabase().then((value) => Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const PrincipalPage()),
                      ));
                }))
              ],
            )),
    );
  }

  void setBadgeIcon(List<String> e) {
    setState(() {
      StringData.essai[StringData.essai.indexOf(e)][2] = "1";
    });
    print("fait  ${StringData.essai[StringData.essai.indexOf(e)][2]}");
  }
}
