import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sim_data/sim_data.dart';

//void main() => runApp(const MyApp());

class SimTestScreen extends StatefulWidget {
  final Function() fun;
  const SimTestScreen({Key? key, required this.fun}) : super(key: key);

  @override
  _SimTestScreenState createState() => _SimTestScreenState();
}

class _SimTestScreenState extends State<SimTestScreen> {
  bool _isLoading = true;
  SimData? _simData;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    SimData simData;
    try {
      var status = await Permission.phone.status;
      if (!status.isGranted) {
        bool isGranted = await Permission.phone.request().isGranted;
        if (!isGranted) return;
      }
      simData = await SimDataPlugin.getSimData();
      setState(() {
        _isLoading = false;
        _simData = simData;
      });
    } catch (e) {
      debugPrint(e.toString());
      setState(() {
        _isLoading = false;
        _simData = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var cards = _simData?.cards;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        title: const Text(
          'Test de Sim',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Center(
              child: ElevatedButton(
                onPressed: () {
                  if (cards != null && cards.isNotEmpty) {
                    widget.fun();
                    print('carte presente');
                  }
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(275, 275),
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(20),
                  elevation: 20,
                ),
                child: const Text('TESTER', style: TextStyle(fontSize: 25.0)),
              ),
            ),
    );
  }
}
