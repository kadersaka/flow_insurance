import 'package:flowinsurance/views/home/menu.dart';
import 'package:flowinsurance/views/home/partenaire.dart';
import 'package:flowinsurance/views/home/profile.dart';
import 'package:flowinsurance/views/home/remboursement.dart';
import 'package:flutter/cupertino.dart';
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
      body:  pages[pageIndex],
      bottomNavigationBar: Container(
        height: 60,
        decoration: const BoxDecoration(boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 3, blurStyle: BlurStyle.outer)]),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          BottomBarItem(0, Icons.home_outlined, Icons.home_filled, pageIndex == 0, "MENU"),
          BottomBarItem(1, Icons.list_alt_outlined, Icons.list_alt, pageIndex == 1, "REMBOURSEMENT"),
          BottomBarItem(2, Icons.people_outline, Icons.people, pageIndex == 2, "PARTENAIRES"),
          BottomBarItem(3, Icons.person_outline, Icons.person, pageIndex == 3, "PROFILE"),
        ]),
      ),
    );
  }

  void setPageIndex(int pageIndex) {
    setState(() {
      this.pageIndex = pageIndex;
    });
  }

  Widget BottomBarItem(int index, IconData normalIcon, IconData focusedIcon, bool focusGot, String title) {
    return InkWell(
      onTap: () => setPageIndex(index),
      child: Column(children: [
        Icon(
          focusGot ? focusedIcon : normalIcon,
          color: Colors.black,
          size: 35,
        ),
        Text(
          title,
          style: TextStyle(fontSize: 10),
        )
      ]),
    );
  }
}
