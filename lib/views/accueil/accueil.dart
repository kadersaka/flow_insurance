import 'package:flowinsurance/constants/images.dart';
import 'package:flowinsurance/views/authenticate/login/login.dart';
import 'package:flowinsurance/views/authenticate/register/register.dart';
import 'package:flutter/material.dart';

import '../../constants/strings.dart';
import '../../constants/styles.dart';

class AccueilPage extends StatefulWidget {
  const AccueilPage({super.key});

  @override
  State<AccueilPage> createState() => _AccueilPageState();
}

class _AccueilPageState extends State<AccueilPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Text(StringData.texteAbonneMTN, textAlign: TextAlign.center, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image.asset('assets/${ImageData.mtnlogo}'),
          ),
          SizedBox(
            height: size.height / 17,
          ),
          Image.asset('assets/${ImageData.logo}'),
          Text(StringData.appName,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              )),
          const Expanded(
            child: SizedBox.expand(),
          ),
          ElevatedButton(
              style: ButtonStyle1(MediaQuery.of(context).size.width * 0.8),
              // style: ButtonStyle1(size),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const LoginPage()));
              },
              child: Text(
                StringData.seConnecter,
                style: const TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
              )),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              style: ButtonStyle1(MediaQuery.of(context).size.width * 0.8, reverse: true),
              // style: ButtonStyle1(size),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const RegisterPage()));
              },
              child: Text(
                StringData.senregistrer,
                style: const TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
              )),
          const SizedBox(
            height: 15,
          )
        ],
      )),
    );
  }
}
