import 'package:flowinsurance/constants/strings.dart';
import 'package:flowinsurance/views/customwidget/boutton.dart';
import 'package:flowinsurance/views/home/principal.dart';
import 'package:flutter/material.dart';

class DiagnosticResult extends StatefulWidget {
  const DiagnosticResult({super.key});

  @override
  State<DiagnosticResult> createState() => _DiagnosticResultState();
}

class _DiagnosticResultState extends State<DiagnosticResult> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Column(
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
          //------------------------------
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: CustomWidget().myText(StringData.terminerDiagnostic,
                    isbols: true, color: const Color(0xff185182), size: 30),
              ),
              Container(
                width: 30,
                height: 30,
                color: Colors.green,
                child: const Icon(
                  Icons.check,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Padding(
              padding: const EdgeInsets.all(10),
              child: CustomWidget()
                  .myText(StringData.resDiagnos, isbols: false, size: 15)),
          Expanded(
            child: ListView.separated(
                itemCount: StringData.essai.length,
                separatorBuilder: ((context, index) {
                  return const SizedBox(
                    height: 25,
                  );
                }),
                itemBuilder: (context, i) {
                  return Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: size.width * 0.04),
                      height: 40,
                      //width: size.width * 0.8,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 0.5)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CustomWidget()
                                .myText(StringData.essai[i][0], isbols: false),
                          ),
                          Container(
                            width: 40,
                            height: 40,
                            color: i % 3 != 0 ? Colors.green : Colors.red,
                            child: Icon(
                              i % 3 != 0 ? Icons.check : Icons.close,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ));
                }),
          ),
          Center(
              child: CustomWidget().mybutton(
                  size,
                  StringData.continuer,
                  () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const PrincipalPage()))))
        ],
      )),
    );
  }
}
