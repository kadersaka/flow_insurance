import 'package:firebase_database/firebase_database.dart';
import 'package:flowinsurance/models/user.dart';
import 'package:prefs/prefs.dart';

import '../constants/strings.dart';

class DataBaseService {
  FirebaseDatabase database = FirebaseDatabase.instance;

  Future<void> addToDataBase(AppUser user) async {
    DatabaseReference ref = FirebaseDatabase.instance.ref("users/${user.phoneNumber}");
    await ref.set({
      "name": user.name,
      "surname": user.surname,
      "phoneNumber": user.phoneNumber,
      "mdp": user.mdp,
    });
    setPreferences(user.phoneNumber, user.mdp);
  }

  Future<AppUser?> login(String phoneNumber, String mdp) async {
    final ref = FirebaseDatabase.instance.ref();
    final snapshot = await ref.child("users/$phoneNumber").get();
    var json = snapshot.exists ? snapshot.value as Map<dynamic, dynamic> : {};

    if (snapshot.exists && json['mdp'] == mdp) {
      print(snapshot.value);
      setPreferences(phoneNumber, mdp);
      return AppUser(json['name'], json['surname'], json['phoneNumber'], json['mdp']);
    } else {
      return null;
    }
  }

  Future<void> getPhoneDetailsFromDatabase() async {
    final ref = FirebaseDatabase.instance.ref();
    Prefs.init();
    String phoneNumber = Prefs.getString("PHONENUMBER", "");
    print("Phone number is $phoneNumber");
    final snapshot = await ref.child("users/$phoneNumber/phones/${StringData.myIme}").get();
    var json = snapshot.exists ? snapshot.value as Map<dynamic, dynamic> : {};
    print("json found  --------$json");
    if (snapshot.exists) {
      StringData.essai[0][2] = json[StringData.essai[0][0]];
      StringData.essai[1][2] = json[StringData.essai[1][0]];
      StringData.essai[2][2] = json[StringData.essai[2][0]];
      StringData.essai[3][2] = json[StringData.essai[3][0]];
      StringData.essai[4][2] = json[StringData.essai[4][0]];
      StringData.essai[5][2] = json[StringData.essai[5][0]];
      StringData.essai[6][2] = json[StringData.essai[6][0]];
      StringData.essai[7][2] = json[StringData.essai[7][0]];
      StringData.essai[8][2] = json[StringData.essai[8][0]];
      // StringData.essai[9][2] = json[StringData.essai[9][0]];
      // print("phone data Loading--------");
      // for (int i = 0; i < StringData.essai.length; i++) print("${StringData.essai[i][0]}-------------${StringData.essai[i][2]}");

    } else
      print("Load phone data failed");
  }

  Future<void> setPhoneDetailsToDatabase() async {
    Prefs.init();
    String phoneNumber = Prefs.getString("PHONENUMBER", "");
    DatabaseReference ref = FirebaseDatabase.instance.ref("users/$phoneNumber/phones/${StringData.myIme}");
    await ref.set({
      StringData.essai[0][0]: StringData.essai[0][2],
      StringData.essai[1][0]: StringData.essai[1][2],
      StringData.essai[2][0]: StringData.essai[2][2],
      StringData.essai[3][0]: StringData.essai[3][2],
      StringData.essai[4][0]: StringData.essai[4][2],
      StringData.essai[5][0]: StringData.essai[5][2],
      StringData.essai[6][0]: StringData.essai[6][2],
      StringData.essai[7][0]: StringData.essai[7][2],
      StringData.essai[8][0]: StringData.essai[8][2],
    });
    // print("fait  ${StringData.essai[StringData.essai.indexOf(e)][2]}");

    print("Phone details add to database");
    print({
      StringData.essai[0][0]: StringData.essai[0][2],
      StringData.essai[1][0]: StringData.essai[1][2],
      StringData.essai[2][0]: StringData.essai[2][2],
      StringData.essai[3][0]: StringData.essai[3][2],
      StringData.essai[4][0]: StringData.essai[4][2],
      StringData.essai[5][0]: StringData.essai[5][2],
      StringData.essai[6][0]: StringData.essai[6][2],
      StringData.essai[7][0]: StringData.essai[7][2],
      StringData.essai[8][0]: StringData.essai[8][2],
      // StringData.essai[9][0]: StringData.essai[9][2],
    });
  }

  void setPreferences(String numero, String mdp) {
    Prefs.init();
    Prefs.setString("PHONENUMBER", numero);
    Prefs.setString("MDP", mdp);
  }
}
