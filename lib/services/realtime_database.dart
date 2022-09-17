import 'package:firebase_database/firebase_database.dart';
import 'package:flowinsurance/models/user.dart';
import 'package:prefs/prefs.dart';

class DataBaseService {
  FirebaseDatabase database = FirebaseDatabase.instance;

  Future<void> addToDataBase(AppUser user) async {
    DatabaseReference ref =
        FirebaseDatabase.instance.ref("users/${user.phoneNumber}");
>>>>>>> a0ab97e (maj)
    await ref.set({
      "name": user.name,
      "surname": user.surname,
      "phoneNumber": user.phoneNumber,
      "mdp": user.mdp,
    });
    setPreferences(user.phoneNumber, user.mdp);
  }

  void createUser() {}

  void logout() {}

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

  void setPreferences(String numero, String mdp) {
    Prefs.init();
    Prefs.setString("PHONENUMBER", numero);
    Prefs.setString("MDP", mdp);
  }
}
