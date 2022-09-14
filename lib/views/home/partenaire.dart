import 'package:flowinsurance/constants/strings.dart';
import 'package:flowinsurance/views/customwidget/boutton.dart';
import 'package:flowinsurance/views/home/principal.dart';
import 'package:flutter/material.dart';

class PartenairePage extends StatefulWidget {
  const PartenairePage({super.key});

  @override
  State<PartenairePage> createState() => _PartenairePageState();
}

class _PartenairePageState extends State<PartenairePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: 100,
          //color: Colors.blue[50],
          width: size.width,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const PrincipalPage()));
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                    size: 30,
                  )),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomWidget().myText(StringData.partenaires,
                          isbols: true, size: 20),
                    ),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomWidget()
                          .myText(StringData.rendezVous, size: 15),
                    )),
                    Expanded(
                        child: SingleChildScrollView(
                      child: Container(color: Colors.blue[200]),
                    ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
