import 'package:flutter/material.dart';

class TestSim extends StatefulWidget {
  const TestSim({Key? key}) : super(key: key);

  @override
  State<TestSim> createState() => _TestSimState();
}

class _TestSimState extends State<TestSim> {
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
    );
  }
}
