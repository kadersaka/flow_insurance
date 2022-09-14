import 'package:flowinsurance/constants/strings.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'component/assurer_ecran_brise.dart';
import 'component/detail_ecran_brise.dart';

class RemboursementPage extends StatefulWidget {
  const RemboursementPage({super.key});

  @override
  State<RemboursementPage> createState() => _RemboursementPageState();
}

class _RemboursementPageState extends State<RemboursementPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          title: const Text(
            "Remboursement",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
        ),
        body: Column(
          children: [
            const Divider(),
            Container(
              child: Row(
                children: [
                  Transform.rotate(
                    angle: math.pi / 10.0,
                    child: Container(
                      height: 40,
                      width: 40,
                      margin: const EdgeInsets.fromLTRB(8, 8, 20, 8),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), boxShadow: const [BoxShadow(color: Colors.grey, blurRadius: 1, blurStyle: BlurStyle.outer)]),
                      child: const Icon(Icons.phone_android, color: Colors.grey, size: 30),
                    ),
                  ),
                  Column(
                    children: [Text(StringData.ecranBrise), Text(StringData.exempleDate)],
                  ),
                  const Expanded(child: SizedBox()),
                  ElevatedButton(
                      style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all<Size>(const Size(100, 35)),
                          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ))),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => DetailEcranBrise()));
                      },
                      child: const Text("Soumettre", style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold))),
                  const SizedBox(width: 10)
                ],
              ),
            ),
            const Divider(),
          ],
        ));
  }
}
