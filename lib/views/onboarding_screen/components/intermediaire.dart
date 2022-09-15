import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../accueil/accueil.dart';
import '../../diagnostic/debut_diagnostic.dart';

class Intermediaire extends StatefulWidget {
  const Intermediaire({super.key});

  @override
  State<Intermediaire> createState() => _IntermediaireState();
}

class _IntermediaireState extends State<Intermediaire> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          //FirebaseAuth.instance.
          if (snapshot.hasData) {
            return const AccueilDiagnostic();
          }
          return const AccueilPage();
        },
      ),
    );
  }
}
