import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_number/mobile_number.dart';
import 'package:mobile_number/sim_card.dart';

class TestSim extends StatefulWidget {
  const TestSim({Key? key}) : super(key: key);

  @override
  State<TestSim> createState() => _TestSimState();
}

class _TestSimState extends State<TestSim> {
  List<SimCard> _simCard = <SimCard>[];
  String _mobileNumber = '';
  bool simExiste = false;

  @override
  void initState() {
    super.initState();
    MobileNumber.listenPhonePermission((isPermissionGranted) {
      if (isPermissionGranted) {
        initMobileNumberState();
      } else {}
    });
    initMobileNumberState();
  }

  Future<void> initMobileNumberState() async {
    if (!await MobileNumber.hasPhonePermission) {
      await MobileNumber.requestPhonePermission;

      try {
        _mobileNumber = (await MobileNumber.mobileNumber)!;
        _simCard = (await MobileNumber.getSimCards)!;
      } on PlatformException catch (e) {
        debugPrint("Failed to get mobile number because of '${e.message}'");
      }
      if (!mounted) return;

      setState(() {
        simExiste = true;
      });
    }
  }

  Widget fillCards() {
    List<Widget> widgets = _simCard
        .map((SimCard sim) => Text(
            'Sim Card Number: (${sim.countryPhonePrefix}) - ${sim.number}\nCarrier Name: ${sim.carrierName}\nCountry Iso: ${sim.countryIso}\nDisplay Name: ${sim.displayName}\nSim Slot Index: ${sim.slotIndex}\n\n'))
        .toList();
    return Column(children: widgets);
  }

  // Future<String> firstMobileNumber() async {
  //   final String? mobileNumber = await MobileNumber.mobileNumber;
  //   return mobileNumber!;
  // }
  //
  // Future<List<SimCard>> listSimCard() async {
  //   final List<SimCard>? simCards = await MobileNumber.getSimCards;
  //   return simCards!;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: const Text(
          'Sim Text',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: simExiste
          ? const Text('La sim n\'existe pas')
          : Column(children: [
              Text('Affichage du numero:$_mobileNumber'),
              fillCards(),
            ]),
    );
  }
}
