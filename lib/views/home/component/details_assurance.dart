import 'package:flowinsurance/constants/strings.dart';
import 'package:flowinsurance/models/assurance.dart';
import 'package:flowinsurance/views/customwidget/boutton.dart';
import 'package:flowinsurance/views/home/component/demander_reparation.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class DetailAssurance extends StatefulWidget {
  Assurance assu;
  String title;
  // final Function(String) fun;
  Color? color;
  IconData? icon;

  DetailAssurance({super.key, required this.assu, this.color, this.icon, required this.title});

  @override
  State<DetailAssurance> createState() => _DetailAssuranceState();
}

class _DetailAssuranceState extends State<DetailAssurance> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: CustomWidget().myText(widget.title, isbols: true, size: 18),
          ),
          Row(
            children: [
              widget.icon != null
                  ? Transform.rotate(
                      angle: math.pi / 10.0,
                      child: Container(
                        height: 40,
                        width: 40,
                        margin: const EdgeInsets.only(top: 8, bottom: 8, left: 8),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), boxShadow: const [BoxShadow(color: Colors.grey, blurRadius: 1, blurStyle: BlurStyle.outer)]),
                        child: Icon(widget.icon, color: Colors.grey, size: 30),
                      ),
                    )
                  : Container(),
              Expanded(
                child: Container(
                  color: widget.color,
                  margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  padding: const EdgeInsets.all(8),
                  child: Text("Vous avez souscrit a une assurance ${widget.title} pour votre smartphone"),
                ),
              ),
            ],
          ),
          Container(
              height: 150,
              width: double.infinity,
              margin: const EdgeInsets.only(left: 8, top: 15, right: 8),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), boxShadow: const [BoxShadow(color: Colors.grey, blurRadius: 1, blurStyle: BlurStyle.outer)]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomWidget().myText(StringData.dateSous, size: 14),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomWidget().myText(widget.assu.subscriptionDate, size: 14),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomWidget().myText(StringData.dateExp, size: 14),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomWidget().myText(widget.assu.expiryDate, size: 14),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomWidget().myText(StringData.periodeSous, size: 14),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomWidget().myText(widget.assu.delay.substring(12), size: 14),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomWidget().myText(StringData.nbreRep, size: 14),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomWidget().myText(widget.assu.reparationsCounter, size: 14),
                      ),
                    ],
                  ),
                ],
              )),
          Center(
            child: Container(
                margin: const EdgeInsets.only(top: 100),
                child: CustomWidget().mybutton(size, StringData.demander, () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const DemanderReparation())))),
          ),
        ],
      )),
    );
  }
}
