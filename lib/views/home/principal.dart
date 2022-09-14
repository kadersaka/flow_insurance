import 'package:flowinsurance/views/home/menu.dart';
import 'package:flowinsurance/views/home/partenaire.dart';
import 'package:flowinsurance/views/home/profile.dart';
import 'package:flowinsurance/views/home/remboursement.dart';
import 'package:flutter/material.dart';

class PrincipalPage extends StatefulWidget {
  const PrincipalPage({super.key});

  @override
  State<PrincipalPage> createState() => _PrincipalPageState();
}

class _PrincipalPageState extends State<PrincipalPage> {
  int pageIndex = 0;

  final pages = [
    const HomeScreen(),
    const RemboursementPage(),
    const PartenairePage(),
    const Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[pageIndex],
      bottomNavigationBar: Container(
        height: 60,
        decoration: const BoxDecoration(boxShadow: [
          BoxShadow(
              color: Colors.grey, blurRadius: 3, blurStyle: BlurStyle.outer)
        ]),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 0;
              });
            },
            icon: pageIndex == 0
                ? const Icon(
                    Icons.home_filled,
                    color: Colors.black,
                    size: 35,
                  )
                : const Icon(
                    Icons.home_outlined,
                    color: Colors.black,
                    size: 35,
                  ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 1;
              });
            },
            icon: pageIndex == 1
                ? const Icon(
                    Icons.list_alt,
                    color: Colors.black,
                    size: 35,
                  )
                : const Icon(
                    Icons.list_alt_outlined,
                    color: Colors.black,
                    size: 35,
                  ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 2;
              });
            },
            icon: pageIndex == 2
                ? const Icon(
                    Icons.people,
                    color: Colors.black,
                    size: 35,
                  )
                : const Icon(
                    Icons.people_outline,
                    color: Colors.black,
                    size: 35,
                  ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 3;
              });
            },
            icon: pageIndex == 3
                ? const Icon(
                    Icons.person,
                    color: Colors.black,
                    size: 35,
                  )
                : const Icon(
                    Icons.person_outline,
                    color: Colors.black,
                    size: 35,
                  ),
          ),
        ]),
      ),
    );
  }
}
