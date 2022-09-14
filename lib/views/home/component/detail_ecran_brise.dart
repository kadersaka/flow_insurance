import 'package:flowinsurance/constants/strings.dart';
import 'package:flowinsurance/views/customwidget/boutton.dart';
import 'package:flowinsurance/views/home/component/demander_reparation.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class DetailEcranBrise extends StatefulWidget {
  const DetailEcranBrise({super.key});

  @override
  State<DetailEcranBrise> createState() => _DetailEcranBriseState();
}

class _DetailEcranBriseState extends State<DetailEcranBrise> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 15,
          ),
          Center(
            child: CustomWidget().myText(
              StringData.ecranBrise,
              isbols: true,
              size: 18,
            ),
          ),
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
              Expanded(
                child: CustomWidget().myText(StringData.vousAvez, size: 15),
              ),
            ],
          ),
          Container(
              height: 150,
              width: double.infinity,
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.grey,
                        blurRadius: 1,
                        blurStyle: BlurStyle.outer)
                  ]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomWidget()
                            .myText(StringData.dateSous, size: 14),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomWidget()
                            .myText(StringData.exempleDate, size: 14),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child:
                            CustomWidget().myText(StringData.dateExp, size: 14),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomWidget()
                            .myText(StringData.exempleDate, size: 14),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomWidget()
                            .myText(StringData.periodeSous, size: 14),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomWidget()
                            .myText(StringData.troisMois, size: 14),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child:
                            CustomWidget().myText(StringData.nbreRep, size: 14),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomWidget().myText(StringData.deux, size: 14),
                      ),
                    ],
                  ),
                ],
              )),
          const Expanded(child: SizedBox.expand()),
          Center(
              child: CustomWidget().mybutton(
                  size,
                  StringData.demander,
                  () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const DemanderReparation())))),
          const SizedBox(
            height: 15,
          )
        ],
      )),
    );
  }
}
