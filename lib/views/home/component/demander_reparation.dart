import 'package:flowinsurance/constants/strings.dart';
import 'package:flowinsurance/views/customwidget/boutton.dart';
import 'package:flowinsurance/views/home/component/detail_ecran_brise.dart';
import 'package:flutter/material.dart';

class DemanderReparation extends StatefulWidget {
  const DemanderReparation({super.key});

  @override
  State<DemanderReparation> createState() => _DemanderReparationState();
}

class _DemanderReparationState extends State<DemanderReparation> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
              onPressed: (() {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const DetailEcranBrise()));
              }),
              icon: const Icon(Icons.arrow_back)),
          Center(
            child: CustomWidget().myText(
              StringData.demander,
              isbols: true,
              size: 18,
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Container(
            height: 300,
            width: double.infinity,
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), boxShadow: const [BoxShadow(color: Colors.grey, blurRadius: 1, blurStyle: BlurStyle.outer)]),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: CustomWidget().myText(StringData.faireDemande, size: 15),
            ),
          ),
          InkWell(
            child: Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.cloud_upload,
                    color: Color(0xffD3E12B),
                  ),
                ),
                CustomWidget().myText(StringData.uploader, size: 15, color: Colors.grey)
              ],
            ),
          ),
          const Expanded(child: SizedBox.expand()),
          Center(
              child: CustomWidget().mybutton(
            size,
            StringData.submit,
            () => {},
          )),
          SizedBox(height: 15)
        ],
      )),
    );
  }
}
