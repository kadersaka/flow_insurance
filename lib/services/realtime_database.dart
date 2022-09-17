import 'package:firebase_database/firebase_database.dart';
import 'package:flowinsurance/models/user.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DataBaseService {
  FirebaseDatabase database = FirebaseDatabase.instance;

  Future<void> addToDataBase(AppUser user) async {
    DatabaseReference ref = FirebaseDatabase.instance.ref();
    await ref.set({
      user.phoneNumber: {
        "name": user.name,
        "surname": user.surname,
        "phoneNumber": user.phoneNumber,
        "mdp": user.mdp,
      }
    });
  }

  void createUser() {}

  void logout() {}

  Future<AppUser?> login(String phoneNumber, String mdp) async {
    final ref = FirebaseDatabase.instance.ref();
    final snapshot = await ref.child("/$phoneNumber").get();
    var json = snapshot.exists ? snapshot.value as Map<dynamic, dynamic> : {};
    if (snapshot.exists && json['mdp'] == mdp) {
      print(snapshot.value);
      return AppUser(json['name'], json['surname'], json['phoneNumber'], json['mdp']);
    } else {
      return null;
    }
  }
}
