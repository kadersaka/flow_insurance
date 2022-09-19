import 'package:flowinsurance/constants/strings.dart';
import 'package:flowinsurance/views/customwidget/boutton.dart';
import 'package:flowinsurance/views/home/principal.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import '../../../constants/styles.dart';

class SouscriptionScreen extends StatefulWidget {
  String title;
  final Function(String) fun;
  Color? color;
  IconData? icon;
  String? subtitle;
  SouscriptionScreen({super.key, this.color, this.subtitle, this.icon, required this.title, required this.fun});

  @override
  State<SouscriptionScreen> createState() => _SouscriptionScreenState();
}

class _SouscriptionScreenState extends State<SouscriptionScreen> {
  double sliderValue = 3;
  TextEditingController controller = TextEditingController();
  String price = "3000 FCFA / 3 mois";
  List<bool> bol = [true, false, false];

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
            const SizedBox(height: 15),
            Center(
              child: CustomWidget().myText(widget.title, isbols: true, size: 18),
            ),
            Container(
              child: Row(
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
                      child: Text(widget.subtitle == null ? "Vous avez souscrit a une assurance ${widget.title} pour votre smartphone" : widget.subtitle!),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomWidget().myText(price.substring(0, 4), size: 70, isbols: true),
                  CustomWidget().myText(StringData.devise, size: 40, isbols: true),
                ],
              ),
            ),
            // Center(
            //   child: Slider(
            //     activeColor: const Color(0xffFFD998),
            //     inactiveColor: Colors.grey,
            //     value: sliderValue,
            //     min: 0.0,
            //     max: 100,
            //     onChanged: (value) {
            //       setState(() {
            //         sliderValue = value;
            //       });
            //     },
            //   ),
            // ),
            Center(
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 20),
                    color: const Color.fromARGB(255, 51, 50, 47),
                    height: 3,
                    width: 53,
                  ),
                  InkWell(
                    onTap: () => setPrice(0, "3000 FCFA / 3 mois"),
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: bol[0] ? Colors.amber : const Color.fromARGB(255, 48, 106, 214),
                      ),
                      child: const Center(
                        child: Text("3", textScaleFactor: 1.2),
                      ),
                    ),
                  ),
                  Container(color: const Color.fromARGB(255, 51, 50, 47), height: 3, width: 53),
                  InkWell(
                    onTap: () => setPrice(1, "5800 FCFA / 6 mois"),
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: bol[1] ? Colors.amber : const Color.fromARGB(255, 48, 106, 214),
                      ),
                      child: const Center(child: Text("6", textScaleFactor: 1.2)),
                    ),
                  ),
                  Container(color: const Color.fromARGB(255, 51, 50, 47), height: 3, width: 53),
                  InkWell(
                    onTap: () => setPrice(2, "9700 FCFA / an"),
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: bol[2] ? Colors.amber : const Color.fromARGB(255, 48, 106, 214),
                      ),
                      child: const Center(child: Text("12", textScaleFactor: 1.2)),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: size.height / 8),
            inputWidget(StringData.momo, controller, size),
            SizedBox(height: size.height / 8),
            Center(
                child: CustomWidget().mybutton(size, "PAYER: ${price.substring(0, 9)}", () {
              widget.fun(price);
              Navigator.pop(context);
              _showMyDialog();
            })),
          ],
        ),
      )),
    );
  }

  void setPrice(int index, String newPrice) {
    setState(() {
      price = newPrice;
      for (int i = 0; i < bol.length; i++) bol[i] = false;
      bol[index] = true;
    });
  }

  Widget inputWidget(String headText, TextEditingController controller, Size size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.only(left: size.width * 0.08, bottom: 10),
          child: Text(
            headText,
            textAlign: TextAlign.start,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          height: 43,
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.08,
          ),
          margin: const EdgeInsets.only(bottom: 14),
          child: TextFormField(
            keyboardType: TextInputType.phone,
            autofocus: false,
            decoration: const InputDecoration(
              enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
                // borderRadius: BorderRadius.all(Radius.circular(50)),
              ),
              errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
              //hintText: StringData.motDePasse,
              contentPadding: EdgeInsets.all(20),
              focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
            ),
            cursorColor: Colors.black,
            controller: controller,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return StringData.motDePassePlease;
              }
              return null;
            },
          ),
        ),
        const SizedBox(
          height: 5,
        )
      ],
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,

      // barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          //title: const Text('AlertDialog Title'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Center(
                  child: CustomWidget().myText(
                    StringData.paiementRecu,
                    isbols: true,
                    size: 18,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 35.0),
                  child: Text(
                    StringData.activeSous,
                    textAlign: TextAlign.center,
                  ),
                ),
                ElevatedButton(
                    style: ButtonStyle1(MediaQuery.of(context).size.width * 0.5),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      StringData.compris,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    )),
              ],
            ),
          ),
        );
      },
    );
  }
}
