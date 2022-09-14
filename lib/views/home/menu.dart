import 'package:flowinsurance/constants/strings.dart';
import 'package:flowinsurance/views/home/component/assurer_ecran_brise.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import '../customwidget/boutton.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 134,
            width: double.infinity,
            color: const Color.fromARGB(232, 242, 240, 183),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                  Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: CustomWidget()
                          .myText(StringData.model, isbols: true)),
                  Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: CustomWidget()
                          .myText(StringData.myModel, isbols: true)),
                  const SizedBox(
                    width: 10,
                  ),
                  Padding(
                      padding: const EdgeInsets.all(8),
                      child:
                          CustomWidget().myText(StringData.imei, isbols: true)),
                  Padding(
                      padding: const EdgeInsets.only(left: 4),
                      child: CustomWidget()
                          .myText(StringData.myIme, isbols: true)),
                ],
              ),
            ]),
          ),
          const SizedBox(
            height: 24,
          ),
          Wrap(
            children: [
              InkWell(
                onTap: (() {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const AssurerEcranBrise()));//DetailEcranBrise
                }),
                child: Container(
                  height: 120,
                  width: 200,
                  color: const Color(0xffEEF7FF),
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
                                  margin: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: const [
                                        BoxShadow(
                                            color: Colors.grey,
                                            blurRadius: 1,
                                            blurStyle: BlurStyle.outer)
                                      ]),
                                  child: const Icon(Icons.phone_android,
                                      color: Colors.grey, size: 30),
                                ),
                              ),
                              CustomWidget().myText(StringData.ecranBrise,
                                  size: 15, isbols: true),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, bottom: 5),
                            child: CustomWidget().myText(StringData.prix,
                                isbols: true, size: 18),
                          ),
                          Container(
                              height: 20,
                              width: 146,
                              margin: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  color: const Color(0xff00FFC2)),
                              child: CustomWidget().myText(
                                  StringData.assurancePris,
                                  size: 15,
                                  color: Colors.grey)),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              radius: 10,
                              backgroundColor: Color(0xff00FFC2),
                              child: Center(
                                child: Icon(
                                  Icons.check,
                                  color: Colors.white,
                                  size: 15,
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 120,
                  width: 230,
                  color: const Color(0xffEEF7FF),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            margin: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 1,
                                      blurStyle: BlurStyle.outer)
                                ]),
                            child: const Icon(
                              Icons.phonelink_setup_rounded,
                              color: Colors.grey,
                              size: 30,
                            ),
                          ),
                          CustomWidget().myText("DISFONCTIONNEMENT",
                              size: 15, isbols: true),
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
                                  //textAlign: TextAlign.center,
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          Container(
            margin: const EdgeInsets.all(5),
            height: 150,
            width: double.infinity,
            color: const Color(0xffFBFEE7),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.phone_android,
                        size: 45,
                      ),
                    ),
                    CustomWidget()
                        .myText(StringData.nouveauSmar, size: 20, isbols: true),
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
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      )),
    );
  }
}
