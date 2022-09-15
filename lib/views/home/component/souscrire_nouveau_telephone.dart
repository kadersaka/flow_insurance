import 'package:flowinsurance/constants/strings.dart';
import 'package:flowinsurance/views/customwidget/boutton.dart';
import 'package:flowinsurance/views/home/principal.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import '../../../constants/styles.dart';

class SouscrireNouveauTelephone extends StatefulWidget {
  const SouscrireNouveauTelephone({super.key});

  @override
  State<SouscrireNouveauTelephone> createState() => _SouscrireNouveauTelephoneState();
}

class _SouscrireNouveauTelephoneState extends State<SouscrireNouveauTelephone> {
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
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomWidget().myText(sliderValue.toStringAsFixed(2), size: 70, isbols: true),
                  CustomWidget().myText(StringData.devise, size: 40, isbols: true),
                ],
              ),
            ),
            Center(
              child: Slider(
                activeColor: const Color(0xffFFD998),
                inactiveColor: Colors.grey,
                value: sliderValue,
                min: 0.0,
                max: 100,
                onChanged: (value) {
                  setState(() {
                    sliderValue = value;
                  });
                },
              ),
            ),
            SizedBox(
              height: size.height / 8,
            ),
            inputWidget(StringData.momo, controller, size),
            //const Expanded(child: SizedBox.expand()),
            SizedBox(
              height: size.height / 8,
            ),
            Center(child: CustomWidget().mybutton(size, StringData.payer, () => _showMyDialog())),
          ],
        ),
      )),
    );
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
            obscureText: true,
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
      barrierDismissible: false, // user must tap button!
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
                    // style: ButtonStyle1(size),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const PrincipalPage()));
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
